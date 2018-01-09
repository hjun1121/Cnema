<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화 상세보기(관리자용)</title>
</head>
<body>
<h3>영화 수정하기</h3>
	<form action="movieRevision" method="POST" enctype="multipart/form-data">
		<p>name <input type="text" name="movie_name" value="${movieDTO.movie_name }" ></p>
		<p>티저영상<input type="text" name="teaser_url" value="${movieDTO.teaser_url }"></p>
		<p>개봉일<input type="date" name="open_date" value="${movieDTO.open_date }"></p>
		<p>상영시간<input type="text"  name="run_time" value="${movieDTO.run_time }"></p>
		<p>장르<input type="text" name="type" value="${movieDTO.type }"></p>
		<p>영화설명<input type="text" name="contents" value="${movieDTO.contents }"></p>
		<p>나이제한<input type="text" name="age_limit" value="${movieDTO.age_limit }"></p>
		<p>출연배우<input type="text" name="actor" value="${movieDTO.actor }"></p>
		<input type="submit" value="수정완료"> 
	</form>
</body>
</html>