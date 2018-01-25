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
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/boardMain/boardTab.css">

<title>Insert title here</title>
<style type="text/css">
.eventViewhead {
    height: 42px;
    margin-top: 25px;
    padding: 0 10px;
    background-color: #edebe1;
    border-width: 1px 0;
    border-style: solid;
    border-top-color: #b8b6aa;
    border-bottom-color: #d6d4ca;
    line-height: 42px;
}
.eventViewhead h3 {
    float: left;
    background: none;
    margin: 0;
    text-align: justify;
    word-break: initial;
}

.eventViewhead .date {
    float: right;
}
.eventViewContents {
    padding-top: 10px;
    text-align: center;
}
.board_contents{

	width:980px;

}

.eventJoin h3{
	color: #222;
 	font-weight: bold; 
    display:inline-block;
    font-size: 36px;
    text-align: left;
    vertical-align: middle;
}
#backList{

    float: right;
    height: 20px;
    margin: 9px 2px 0 0;
    padding-left: 20px;
    background: url(../resources/images/common/btn/btn-prev.png) no-repeat 0 2px;
    color: #333333;
    font-family: 'NanumBarunGothicBold';
    font-size: 16px;
    	font-weight: bold; 
}
.submenu .tit{
	color: #222;
    font-weight: bold;
    display:inline-block;
    font-size: 26px;
    text-align: left;
    vertical-align: middle;
}


.btnSet{
	margin-top:10px;

}
#upBtn , #delBtn {
	
    padding: 5px 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
    margin: 0 auto;
    -webkit-transition-duration: 0.4s; 
    transition-duration: 0.4s;
    cursor: pointer;
    border-radius: 5px;
    background-color: #e71a0f; 
    color: #ffffff; 
    border: 2px solid #e71a0f;
  	/* float:right; */


}

#delBtn{
	  display: inline-block;
    background-color: #5b5b58; 
    color: #ffffff; 

    border: 2px solid #5b5b58;
    margin-left: 10px;

}
.joinImgBtn{
	width:400px;
	margin:0 auto;
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
		if(id==null)
		{
			alert('회원 로그인하세요1');	
			location.href="../member/memberLogin?path=event/eventView&num="+num;
		}
		else{
		var type= Math.floor(Math.random() * 2);//0 또는 1 만 나오게 한다.
		$.ajax({
			url:"../ajax/eventCheck",
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
		
		}
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
                                <a href="#">이벤트</a>
                            </li>
                            <li class="last">
                            	글보기
                            </li>
                    	</ul>
                	</div>
            	</div>
        	</div>
        	<!-- 상단바 끝 -->
        	
	
	
	<div class="board_container">
	<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/boardTab/eventTab.jsp"></c:import>

<div class="board_contents">
<div class="submenu">
	<span class="tit">이벤트 내용</span>
	<p>진행중인 이벤트가 응모하세요.<br></p>
</div>
<div class="eventViewhead">
    <h3>${view.title } </h3> 
    <em class="date">
        <span>기간: </span>
        ${view.s_date } ~ ${view.e_date }
    </em>
</div>
<div class="eventViewContents" style="width: 800px;">
${view.contents}

</div>

<!-- <div class="eventViewFile">
첨부 파일 다운로드
</div> -->
<br>
<hr>

<div class="eventJoin">

<input type="hidden" id="num" name="num" value="${view.num }">
<c:if test="${member.type==10 or member.type==11 }">
<input type="hidden" id="id" value="${member.id}">
</c:if>
<div class="joinImgBtn">
<a id="join" href="#" onclick="return false;"><img alt="" src="../resources/images/common/btn/eventJoin.png"> </a>
</div>

</div>
	<div class="btnSet">
	<c:if test="${not empty member and member.type eq 20  }">
		<a id="upBtn" href="./eventUpdate?num=${view.num}">update</a>
		<a id="delBtn"  href="./eventDelete?num=${view.num}">delete</a>
	</c:if>
		<a id="backList" href="./eventList">목록으로</a>
	</div>
</div>
</div><!--게시판 내용  -->
	
</div>
	
	
	<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	
</div>
	
</body>
</html>