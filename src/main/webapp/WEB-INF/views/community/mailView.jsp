<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/community/mailBox.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/movie/movie.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>${mail.title}</title>
<script type="text/javascript">

	$(function() {
		$("#reply_btn").click(function() {
			alert("답장");
		});
		$("#delete_btn").click(function() {
			alert("삭제");
		});
	});

</script>
</head>
<body>

	<table>
		<tr>
			<td>제목</td>
			<td>${mail.title }</td>
		</tr>
		<tr>
			<td>보내는 사람</td>
			<td>${mail.send_id }</td>
		</tr>
		<tr>
			<td>보낸 날짜</td>
			<td>${mail.send_date }</td>
		</tr>
		<tr>
			<td>${mail.contents }</td>
		</tr>
	</table>
	
	<button id="reply_btn">답장</button>
	<button id="delete_btn">삭제</button>
	
</body>
</html>