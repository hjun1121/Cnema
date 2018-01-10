<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상영시간표(관리자용)</title>
</head>
<body>
<h3>상영시간표${fn:length(sList)}개</h3>
	<table>
		<tr>
			<td>상영관번호</td>
			<td>영화번호</td>
			<td>시작시간</td>
			<td>종료시간</td>
			<td>상영날짜</td>
		</tr>
		<c:forEach items="${sList }" var="scheduleList">
			<tr>
				<td><a href="./scheduleView?schedule_num=${scheduleList.schedule_num }">${scheduleList.screen_num }</a></td>
				<td>${scheduleList.movie_num }</td>
				<td>${scheduleList.in_time }</td>
				<td>${scheduleList.out_time }</td>
				<td>${scheduleList.day }</td>
			</tr>
		</c:forEach>
	</table>
	<input type="button" value="등록하기">
</body>
</html>