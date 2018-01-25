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
table {
    border-top: solid 1px #d6d4ca;
    border-bottom: solid 1px #b8b6aa;
    font-size: 12px;
    line-height: 1.2;
    color: #666;
    font-family: 'NanumBarunGothic', '맑은 고딕', '돋움', Dotum, sans-serif;
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
}


th{
    line-height: 27px;
    vertical-align: top;
    padding: 15px 0px 15px 13px;
    border-top: 1px solid #d6d4ca;
    text-align: left;
    font-weight: normal
}

td{
	padding: 15px 5px;
    text-align: left;
	border-top: solid 1px #d6d4ca;
	font-weight: normal;
    line-height: 1.5em;
    vertical-align: middle
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
#updateBtn{
	
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
textarea{
width:620px;
border: 1px solid #ccc;
}
.board_contents .tit{
	color: #222;
    font-weight: bold;
    display:inline-block;
    font-size: 26px;
    text-align: left;
    vertical-align: middle;
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
                                <a href="#">이벤트</a>
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
	<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/boardTab/eventTab.jsp"></c:import>
<div class="board_contents">
<span class="tit">이벤트 수정하기</span><br><br>
<form action="eventUpdate" method="post" id="frm" enctype="multipart/form-data">
   <input type="hidden" name="num" value="${view.num }">
<table>
	<tr>
	<th>제목</th>
	<td>
    <input type="text" name="title" id="title" value="${view.title }"></td>
    </tr>
    
    <tr>
    
    <th class="date">
        <span>기간: </span></th>
     <td>
        <input type="date" name="s_date" class="dateInput" value="${view.s_date }"> &nbsp; <strong>~</strong>&nbsp;
        <input type="date" name="e_date" class="dateInput" value="${view.e_date }">
    </td>
</tr>

<tr>
<th>내용</th>
<td>

<textarea id="contents" name="contents" rows="10" cols="30"> ${view.contents}</textarea>

</td>
</tr>

<tr>
<th>파일수정</th>
<td>
현재 파일: ${view.oriName }<br>
<input type="file" name="file">
</td>
</tr>
 </table>
<input type="hidden" name="fileName" value="${view.fileName }">
<input type="hidden" name="oriName" value="${view.oriName }">
<br>
<a id="btn1" href="eventList">cancel</a>
		
<input type="submit" id="updateBtn" value="update"> 
</form>	
</div>
			</div><!--게시판 내용  -->
	
	
	</div>
	
	
	<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	
</div>
</body>
</html>