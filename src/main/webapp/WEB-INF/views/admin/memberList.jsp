<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>멤버리스트</title>
<script type="text/javascript">
$(function(){
	$("#birth").click(function(){
		location.href="./couponGive?ctype=10";
	});
});
</script>
</head>
<body>
<h3>멤버리스트</h3>
<input type="button" id="birth" value="생일쿠폰">
<input type="button" id="vip" value="VIP쿠폰">
<table>
	<tr>
		<td>ID</td>
		<td>NAME</td>
		<td>BIRTH</td>
		<td>TYPE</td>
		<td>쿠폰갯수</td>
	</tr>
	<c:forEach items="${memList }" var="mList" varStatus="status">
	<tr>
		<td><a href="">${mList.id }</a></td>
		<td>${mList.name }</td>
		<td>${mList.birth }</td>
		<td>${mList.type }</td>
		<c:set var="value">result${status.count }</c:set>
		<td>${requestScope[value]}</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>