<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>극장 상세페이지(관리자용)</title>
<script type="text/javascript">
$(function(){
	$("#removeBtn").click(function(){
		var theater_num = $("#theater_num").val();
		location.href="./theaterRemove?theater_num="+theater_num;
	});
});
</script>
</head>
<body>
<h3>극장 상세페이지</h3>
	<form action="./theaterRevision" method="POST">
	<input type="hidden" name="theater_num" id="theater_num" value="${theaterDTO.theater_num }">
	<table>
		<tr>
			<td>지역</td>
			<td>지점</td>
			<td>위도</td>
			<td>경도</td>
		</tr>
		<tr>
			<td><input type="text" name="area" value="${theaterDTO.area }"></td>
			<td><input type="text" name="location" value="${theaterDTO.location }"></td>
			<td><input type="text" name="x_position" value="${theaterDTO.x_position }"></td>
			<td><input type="text" name="y_position" value="${theaterDTO.y_position }"></td>
		</tr>
	</table>
	<input type="submit" value="수정">
	<input type="button" id="removeBtn" value="삭제">
	</form>
</body>
</html>