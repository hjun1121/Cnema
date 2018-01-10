<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>멤버리스트</title>
</head>
<body>
<h3>멤버리스트</h3>
<table>
	<tr>
		<td>ID</td>
		<td>NAME</td>
		<td>BIRTH</td>
		<td>TYPE</td>
		<td>V_POINT</td>
		<td>A_POINT</td>
	</tr>
	<c:forEach items="${memList }" var="mList">
	<tr>
		<td><a href="">${mList.id }</a></td>
		<td>${mList.name }</td>
		<td>${mList.birth }</td>
		<td>${mList.type }</td>
		<td>${mList.v_point }</td>
		<td>${mList.a_point }</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>