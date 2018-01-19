<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/boardMain/boardTab.css">

<title>Insert title here</title>
<style type="text/css">


#btn1{
    padding: 10px 15px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
    margin: 0 auto;
    -webkit-transition-duration: 0.4s; 
    transition-duration: 0.4s;
    cursor: pointer;
    border-radius: 5px;
    background-color: #ede9dd; 
    color: #7b7b7b; 
 	border:  2px solid #7b7b7b;
 
	

}

#savebutton{
	
    padding: 10px 15px;
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
    float:right;
}

#titleInput, #writerInput{

background-color: #f1f0e5;

}
#titleInput, #writerInput{
 width:620px;
 height: 30px;
 border: 1px solid #ccc;
}
#writerInput{
border: none;
 width:100px;
}
#empty_td{
height: 10px;
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
    $("#savebutton").click(function(){
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
                            	수정
                            </li>
                    	</ul>
                	</div>
            	</div>
        	</div>
        	<!-- 상단바 끝 -->
        	
	
	
	<div class="board_container">
	<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/boardTab/noticeTab.jsp"></c:import>
	<div class="board_contents">
	<form action="noticeUpdate" id="noticeForm" method="post" id="frm">
	<h1>공지사항 수정</h1>
		<input type="hidden" name="num" value="${view.num}">
		<table>
		<tr>
			<td><input type="text" id="titleInput" name="title" value="${view.title}"></td>
			<td><strong>작성자 &nbsp;</strong><input type="text" id="writerInput" name="writer" value="${view.writer}" readonly="readonly"></td>
		</tr>
		<tr id="empty_td"></tr>
		<tr>
		<td></td>
		</tr>
		<tr>
			<td class="content" colspan="2"><textarea id="contents" name="contents" rows="20" cols="20" draggable="false">${view.contents}</textarea></td>
		</tr>
		
	</table>
	<br>
		<a href="./noticeList" id="btn1">수정취소</a>
		<input type="submit" id="savebutton" value="수정완료">
	</form>
	
	</div>
			
			</div><!--게시판 내용  -->
	
	
	</div>
	
	
	<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	
</div>
</body>
</html>