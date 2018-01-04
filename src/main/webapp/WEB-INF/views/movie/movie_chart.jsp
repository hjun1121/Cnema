<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>무비차트</title>
<script type="text/javascript">

	$(function() {
		
		var kind = '${kind}';
		
		$("#kind").each()
		
	});
	
</script>
</head>
<body>

<h1>무비차트_${board}순</h1>
<form action="movie_chart">
	<select id="kind">
		<option class = "kind" value="reserve_rate">예매율순</option>
		<option class = "kind" value="grade">평점순</option>
		<option class = "kind" value="open_date">개봉일순</option>
	</select>
	<input type="button" id="kind_btn">

	<c:forEach items="${movie_list}" var = "movie">
	<table>
		<tr><td><img alt="${movie.movie_name} 포스터" src='../resources/movie_poster/${movie.fileName}'></td></tr>
		<tr><td>${movie.movie_name}</td></tr>
		<tr><td>예매율 : ${movie.reserve_rate}</td></tr>
		<tr><td>장르 : ${movie.type}</td></tr>
		<tr><td>개봉일 : ${movie.open_date}</td></tr>
		<tr><td>♡ ${movie.wish}</td></tr>
		<tr><td><input type="button" id="reserveBtn" value="예매"></td></tr>
		<tr><td>${movie.contents}</td></tr>
		<tr><td><iframe width="560" height="315" src="${movie.teaser_url}"></iframe></td></tr>
		<tr><td>평점 : ${movie.grade}</tr>
	</table>
	<hr>
	</c:forEach>

</form>


</body>
</html>