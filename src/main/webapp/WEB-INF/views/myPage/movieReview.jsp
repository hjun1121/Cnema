<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>평점 작성</title>
<script type="text/javascript">
$(function(){
	$("#reBtn").click(function(){
		document.rFrm.submit();
	});
	
	var good = $("#good").val();
	var bad = $("#bad").val();
	$("#good").click(function(){
		$("#review").val(good);
	});
	$("#bad").click(function(){
		$("#review").val(bad);
	});
});
</script>
</head>
<body>
<h3>평점주기</h3>
<h2>${movieDTO.movie_name }</h2>
<input type="button" id="good" value="좋았어요~^^">
<input type="button" id="bad" value="흠~좀 별로였어요;;;">

<form action="movieReview" name="rFrm" method="POST">
	<input type="hidden" name="movie_num" value="${movieDTO.movie_num }">
	<textarea name="review" id="review"></textarea>
	<input type="button" id="reBtn" value="작성완료">
</form>
</body>
</html>