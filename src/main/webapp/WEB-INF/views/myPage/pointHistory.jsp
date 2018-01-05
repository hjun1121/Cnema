<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>포인트 적립/사용내역</title>
</head>
<body>
	<h3>Point 내역</h3>
	<c:forEach items="${pList}" var="pointList">
		<table>
			<tr>
				<td>구매 구분</td>
				<td>구매극장</td>
				<td>적립일</td>
				<td>적립</td>
			</tr>
			<tr>
				<td>${pointList.theater }</td>
				<td>${pointList.use_day }</td>
				<td>${pointList.point_price }</td>
				<td>${pointList.type }점</td>
			</tr>
		</table>
	</c:forEach>
</body>
</html>