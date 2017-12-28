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