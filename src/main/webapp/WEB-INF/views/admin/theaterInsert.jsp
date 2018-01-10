<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>극장 글쓰기</title>
</head>
<body>
<h3>극장 글쓰기</h3>
	<form action="./theaterInsert" method="POST">
	<table>
		<tr>
			<td>지역</td>
			<td>지점</td>
			<td>위도</td>
			<td>경도</td>
		</tr>
		<tr>
			<td><input type="text" name="area" id="area"></td>
			<td><input type="text" name="location" id="location"></td>
			<td><input type="text" name="x_position" id="x_position"></td>
			<td><input type="text" name="y_position" id="y_position"></td>
		</tr>
	</table>
	<input type="submit" value="확인">
	</form>
</body>
</html>