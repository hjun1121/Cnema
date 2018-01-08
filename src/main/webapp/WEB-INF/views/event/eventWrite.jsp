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
<title>Insert title here</title>

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
    $("#writeBtn").click(function(){
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
<h2>이벤트 작성하기</h2>
<form action="eventWrite" method="post" id="frm" enctype="multipart/form-data">

<div class="eventViewhead">
    <strong>제목</strong>
    <input type="text" name="title" value=""> 
    <input type="hidden" name="writer" value="${member.id}">
    <br>
    <em class="date">
        <span>기간: </span>
        <input type="date" name="s_date" value="">~ 
        <input type="date" name="e_date" value="">
    </em>
</div>

<div class="eventViewContents">
<textarea id="contents" name="contents" rows="10" cols="30"> </textarea>
</div>

<!--  파일수정하기  -->
<div class="eventViewFile">
파일 첨부 : <input type="file" name="file">
</div>

<!-- 이벤트 당첨 타입  -->
<div class="eventJoinType">
<p>이벤트 쿠폰 타입 </p>
1.쿠폰 <input type="radio" name="typeSel" value="10">
2.포인트<input type="radio" name="typeSel" value="11">
</div>
<a href="eventList">cancel</a>
		
<input type="submit" id="writeBtn" value="write"> 
</form>	
	
</body>
</html>