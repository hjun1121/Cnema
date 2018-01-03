<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	
</script>
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

<h1>무비차트_${board}순</h1>
<select id="">
	<option>예매율순</option>
	<option>평점순</option>
	<option>개봉일순</option>
</select>


<h1>무비차트_평점순</h1>
<hr>
<table>
	<c:forEach items="${movie_list}" var = "movie">
		<tr>
			<td>사진</td>
			<td>${movie.title}</td>
			<td>예매율 : ${movie.reserve_rate}</td>
			<td>장르 : ${movie.type}</td>
			<td>개봉일 : ${movie.open_date}</td>
			<td>♡ ${movie.wish}</td>
			<td><input type="button" id="reserveBtn" value="예매"></td>
			<td>${movie.contents}</td>
			<td><iframe width="560" height="315" src="${movie.teaser_url}"></iframe></td>
			<td>평점 : ${movie.grade}</td>
		</tr>
	</c:forEach>
</table>
<br>
<hr>
<br>
<h1>무비차트_개봉일순</h1>
<hr>
<table>
	<c:forEach items="${movie_list}" var = "movie">
		<tr>
			<td>사진</td>
			<td>${movie.title}</td>
			<td>예매율 : ${movie.reserve_rate}</td>
			<td>장르 : ${movie.type}</td>
			<td>개봉일 : ${movie.open_date}</td>
			<td>♡ ${movie.wish}</td>
			<td><input type="button" id="reserveBtn" value="예매"></td>
			<td>${movie.contents}</td>
			<td>${movie.teaser_url}</td>
			<td>평점 : ${movie.grade}</td>
		</tr>
	</c:forEach>
</table>
<hr>
<h1>영화리뷰</h1>
<table>
	<tr>
		<td>id : ${review.id}</td>
		<td>${review.contents}</td>
		<td>작성일 : ${review.reg_date}</td>
		<td>좋아요 : ${review.hit}</td>
	</tr>
</table>
</body>
</html>