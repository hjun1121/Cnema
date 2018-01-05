<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화 insert</title>
</head>
<body>
<h1>영화 insert</h1>
<form action="movie_insert" method="post" name="frm" enctype="multipart/form-data">
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
</body>
</html>