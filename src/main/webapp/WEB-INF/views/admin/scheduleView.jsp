<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>상영시간표 상세페이지(관리자용)</title>
<script type="text/javascript">
$(function(){
	$("#removeBtn").click(function(){
		var schedule_num = $("#schedule_num").val();
		location.href="./scheduleRemove?schedule_num="+schedule_num;
	});
});
</script>
</head>
<body>
<h3>상영시간표 상세페이지</h3>
	<form action="./scheduleRevision" method="POST">
	<input type="hidden" name="schedule_num" id="schedule_num" value="${scheduleDTO.schedule_num }">
	<table>
		<tr>
			<td>상영관번호</td>
			<td>영화번호</td>
			<td>시작시간</td>
			<td>종료시간</td>
			<td>상영날짜</td>
		</tr>
		<tr>
			<td><input type="text" name="screen_num" value="${scheduleDTO.screen_num }"></td>
			<td><input type="text" name="movie_num" value="${scheduleDTO.movie_num }"></td>
			<td><input type="time" name="in_time" value="${scheduleDTO.in_time }"></td>
			<td><input type="time" name="out_time" value="${scheduleDTO.out_time }"></td>
			<td><input type="text" name="day" value="${scheduleDTO.day }"></td>
		</tr>
	</table>
	<input type="submit" value="수정하기">
	<input type="button" id="removeBtn" value="삭제">
	</form>
</body>
</html>