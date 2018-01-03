<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>영화 insert</h1>
<form action="movie_chart" method="post" name="frm" enctype="multipart/form-data">
		<p>name <input type="text" id="movie_name" name="movie_name"></p>
		포스터<input type="file" name="file">
		<p>티저영상<input type="text" id="teaser_url" name="teaser_url"></p>
		<p>개봉일<input type="date" id="open_date" name="open_date"></p>
		<p>상영시간<input type="text" id="run_time" name="run_time"></p>
		<p>장르<input type="text" id="type" name="type"></p>
		<p>영화설명<input type="text" id="contents" name="contents"></p>
		<p>나이제한<input type="text" id="age_limit" name="age_limit"></p>
		<input type="submit" id="insertBtn" value="insert">
</form>
<br>
<h1>무비차트</h1>
<hr>
<table>
	<tr>
		<td>포스터</td>
		<td>제목</td>
		<td>예매율</td>
		<td>개봉일</td>
		<td>♡</td>
		<td><button>예매</button></td>
	</tr>
	<c:forEach items="${movie}" var = "movie">
		<tr>
			<td>사진</td>
			<td>${movie.title}</td>
			<td>${movie.reserve_rate}</td>
			<td>${movie.open_date}</td>
			<td>♡</td>
		</tr>
	</c:forEach>
</table>
<hr>


</body>
</html>