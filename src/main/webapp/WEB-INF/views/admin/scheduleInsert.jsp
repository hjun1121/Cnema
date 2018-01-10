<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상영시간표 글쓰기(관리자용)</title>
</head>
<body>
<h3>상영시간표 글쓰기</h3>
	<form action="./scheduleInsert" method="POST">
	<table>
		<tr>
			<td>상영관번호</td>
			<td>영화번호</td>
			<td>시작시간</td>
			<td>종료시간</td>
			<td>상영날짜</td>
		</tr>
		<tr>
			<td><input type="text" name="screen_num"></td>
			<td><input type="text" name="movie_num"></td>
			<td><input type="date" name="in_time"></td>
			<td><input type="date" name="out_time"></td>
			<td><input type="date" name="day"></td>
		</tr>
	</table>
	<input type="submit" value="확인">
	</form>
</body>
</html>