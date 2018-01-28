<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/movie/movie.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>쪽지 쓰기</title>
<script type="text/javascript">
	$(function() {
		
		$("#cancel_btn").click(function() {
			window.close();
		});
		
	});
</script>
</head>
<body>

	<form action="mailWriteForm" method="POST">
	<table>
		<tr>
			<td>받는 사람</td>
			<td><input type="text" name="receive_id" value="${receive_id }" readonly="readonly"></td>
		</tr>
		<tr>
			<td>보내는 사람</td>
			<td><input type="text" name="send_id" value="${member.id }" readonly="readonly"></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name = "title"></td>
		</tr>
		<tr>
			<td><input type="text" name="contents"></td>
		</tr>
	</table>
	<input type="submit" value="확인">
	<input id="cancel_btn" type="button" value="취소">
	</form>

</body>
</html>