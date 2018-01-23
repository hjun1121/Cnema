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
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/boardMain/boardTab.css">
<title>Insert title here</title>
<style type="text/css">
.board_container{
	width: 1200px;
	margin:0 auto;
	margin-top:40px;
 
}
#contents{
	width:650px;
	height: 400px;
	
}
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

#writeBtn{
	
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
#title, .dateInput{

background-color: #f1f0e5;
 width:500px;
 height: 30px;
 border: 1px solid #ccc;
}
.dateInput{

 width:150px;
}
#right_input{
 float:right;
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
    $("#writeBtn").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
         
        // 이부분에 에디터 validation 검증
		/* var title=$("#title").val();
        var file=$('#file').val();
		var contents=$("#contents").val();
		var s_date=$("#s_date").val();
		var e_date=$("#e_date").val();
        alert(s_date);
		
        if(title==null){
			alert("제목을 입력하세요");
			$('#title').focus();
			return false;
		}
		else if(contents=""){
			alert("내용을 입력하세요"); 
			$("contents").focus();
			return false;
		}
		else if(s_date=null){
			alert("시작날짜를 입력하세요"); 
			$("s_date").focus();
			return false;
		}
		else if(e_date=""){
			alert("종료날짜를 입력하세요"); 
			$("e_date").focus();
			return false;
		}
		else if(file==""){
			alert("파일 확인");
			file.focus();
			return false;
		}
        else{ */
      /*   $("#frm").submit(); */
        
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
                                <a href="#">이벤트</a>
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
	<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/boardTab/eventTab.jsp"></c:import>
<div class="board_contents">
<h2>이벤트 작성하기</h2>
<form action="eventWrite" method="post" id="frm" enctype="multipart/form-data">

<div class="eventViewhead">
    <strong>제목</strong>
    <input type="text" name="title" value="" id="title" required="required"> 
    <input type="hidden" name="writer" value="${member.id}">
    <br>
    <p class="date">
        <span>기간: </span>
        <input type="date" name="s_date" value="" id="s_date" class="dateInput" required="required"> <strong>~</strong> 
        <input type="date" name="e_date" value="" id="e_date" class="dateInput" required="required">
    </p>
</div>

<div class="eventViewContents">
<textarea id="contents" name="contents" rows="10" cols="20"  style="width: 600px;" required="required"> </textarea>
</div>

<!--  파일수정하기  -->
<div class="eventViewFile">
파일 첨부 : <input type="file" name="file" id="file" required="required">
</div>

<!-- 이벤트 당첨 타입  -->
<div class="eventJoinType">
<p>이벤트 쿠폰 타입 </p>
1.쿠폰 <input type="radio" name="typeSel" value="10" checked="checked">
2.포인트<input type="radio" name="typeSel" value="11">
</div>
<a href="eventList" id="btn1">cancel</a>
		
<input type="submit" id="writeBtn" value="write"> 
</form>	
		</div>
			</div><!--게시판 내용  -->
	
	
	</div>
	
	
	<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	
</div>
</body>
</html>