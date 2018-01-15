<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="../resources/SE2/js/HuskyEZCreator.js"></script>
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
		//SmartEditor start
		//전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        //textarea ID
        elPlaceHolder: "contents",
        sSkinURI: "../resources/SE2/SmartEditor2Skin.html", 
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true, 
        }
    });
     
    //전송버튼 클릭이벤트
    $("#updateBtn").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
         
        // 이부분에 에디터 validation 검증
         
        //폼 submit
        $("#frm").submit();
    })
		
		//CKEDITOR.replace( 'contents' );
		
	
			 
		 //쌤 방식
	/* 	var index = 0;
		var count = 0;
		$("#add").click(function(){
			if(count < 5){
				var s = '<div id="d'+index+'">';
				s = s+'<input type="file" name="f1"><span class="del" title="d'+index+'">X</span></div>';
				$("#files").append(s);
				count++;
				index++;
			}else{
				alert("fail");
			}
		})
		
		$("#files").on("click",".del",function(){
			var id = $(this).attr("title");
			$("#"+id).remove();
			index--;
		}); */
		
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
<h2>이벤트 수정하기</h2>
<form action="eventUpdate" method="post" id="frm" enctype="multipart/form-data">
<div class="eventViewhead">
    <h3><input type="text" name="title" value="${view.title }"></h3> 
   <input type="hidden" name="num" value="${view.num }">
    <em class="date">
        <span>기간: </span>
        <input type="date" name="s_date" value="${view.s_date }">~ 
        <input type="date" name="e_date" value="${view.e_date }">
    </em>
</div>
<div class="eventViewContents">
<textarea id="contents" name="contents" rows="10" cols="30"> ${view.contents}</textarea>

</div>

<!--  파일수정하기  -->
<div class="eventViewFile">
파일수정 : ${view.oriName }
<input type="file" name="file">
</div>


<a href="eventList">cancel</a>
		
<input type="submit" id="updateBtn" value="update"> 
</form>	
			
			</div><!--게시판 내용  -->
	
	
	</div>
	
	
	<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	
</div>
</body>
</html>