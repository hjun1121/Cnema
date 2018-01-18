<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>영화 등록하기</title>
<script type="text/javascript">
$(function(){
	$("#iBtn").click(function(){
		if($("#movie_name").val()==""){
			$("#movie_name").focus();
		}else if($("#file").val()==""){
			$("#file").focus();
		}else if($("#teaser_url").val()==""){
			$("#teaser_url").focus();
		}else if($("#open_date").val()==""){
			$("#open_date").focus();
		}else if($("#run_time").val()==""){
			$("#run_time").focus();
		}else if($("#type").val()==""){
			$("#type").focus();
		}else if($("#contents").val()==""){
			$("#contents").focus();
		}else if($("#age_limit").val()==""){
			$("#age_limit").focus();
		}else if($("#actor").val()==""){
			$("#actor").focus();
		}else if($("#show").val()==""){
			$("#show").focus();
		}else{
			document.frm.submit();
		}
	});
});
</script>
</head>
<body>
<h1>영화 등록하기</h1>
<form action="movie_insert" method="post" name="frm" enctype="multipart/form-data">
	<p>name <input type="text" id="movie_name" name="movie_name"></p>
	포스터<input type="file" name="file">
	<p>티저영상<input type="text" id="teaser_url" name="teaser_url"></p>
	<p>개봉일<input type="date" id="open_date" name="open_date"></p>
	<p>상영시간<input type="text" id="run_time" name="run_time"></p>
	<p>장르<input type="text" id="type" name="type"></p>
	<p>영화설명<input type="text" id="contents" name="contents"></p>
	<p>나이제한<input type="text" id="age_limit" name="age_limit"></p>
	<p>출연배우<input type="text" id="actor" name="actor"></p>
	<p>상영유무(상영작 : 10 / 상영마감 : 20)<input type="text" id="show" name="show"></p>
	<input type="button" id="iBtn" value="등록하기">
</form>
</body>
</html>