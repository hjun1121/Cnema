<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>그룹 리스트(관리자용)${fn:length(groupList)}개</title>
</head>
<body>
<h3>그룹 목록</h3>
<form action="./groupRemove" method="POST">
	<table>
		<tr>
			<td>그룹이름</td>
			<td>명수</td>
			<td></td>
		</tr>
		<c:forEach items="${groupList }" var="gList" varStatus="gc" >
		<tr>
			<input type="hidden" name="group_num" value="${gList.group_num }">
			<td>${gList.group_num }</td>
			<td>${groupCountList[gc.index] }</td>
			<td><input type="submit" value="X"></td>
		</tr>
		</c:forEach>
	</table>
</form>
</body>
</html>