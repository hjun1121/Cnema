<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/headerBar.css">

<title>Insert title here</title>
<style type="text/css">
.board_container{
	width: 1200px;
	height:1000px;
	margin:0 auto;
	margin-top:40px;
 
}
</style>
<script type="text/javascript">

$(function(){
	var message = '${message}';
	if(message != ""){
		alert(message);
	}
	
	$("#join").click(function(){
		
		var num = $("#num").val();
		var id = $("#id").val();
		var type= Math.floor(Math.random() * 2);//0 또는 1 만 나오게 한다.
		$.ajax({
			url:"../ajax/eventJoin",
			type:"POST",
			data:{
			 num:num,
			 id:id,
			 type:type
				 
			},
			success:function(data){
				alert(data);
				},
			error : function(){
				
			}
		});
		
		
	});
});


</script>
</head>
<body>
<div id="cgvwrap">
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/header.jsp"></c:import>

			<!-- //////////////////////////////// -->
<div id="contaniner" class="">
	<!-- 상단바 시작 -->
        	<div class="linemap-wrap">
           		<div class="sect-linemap">
                	<div class="sect-bcrumb">
                    	<ul>
                        	<li>
                        		<a href="../">
                        		<img alt="home" src="${pageContext.request.contextPath }/resources/images/common/btn/btn_home.png"></a>
                        	</li>
                            <li>
                                <a href="#">게시판</a>
                            </li>
                            <li>
                                <a href="#">공지사항</a>
                            </li>
                            <li class="last">
                            	글쓰기
                            </li>
                    	</ul>
                	</div>
            	</div>
        	</div>
        	<!-- 상단바 끝 -->
        	
	
	
	<div class="board_container">
	<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/board/board_tab.jsp"></c:import>
<div class="eventViewhead">
    <h3>${view.title } </h3> 
    <em class="date">
        <span>기간: </span>
        ${view.s_date }~ ${view.e_date }
    </em>
</div>
<div class="eventViewContents">
${view.contents}

</div>

<div class="eventViewFile">
첨부 파일 다운로드
</div>
<br>
<hr>
<div class="eventJoin">
<h3>이벤트 참여하기</h3>
<input type="hidden" id="num" name="num" value="${view.num }">
<input type="hidden" id="id" value="${member.id}">

<button id="join">바로 참여하기</button>


</div>

		<a href="./evnetList">목록으로</a>
		<a href="./eventUpdate?num=${view.num}">update</a>
		<a href="./eventDelete?num=${view.num}">delete</a>
				
			</div><!--게시판 내용  -->
	
	
	</div>
	
	
	<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	
</div>
	
</body>
</html>