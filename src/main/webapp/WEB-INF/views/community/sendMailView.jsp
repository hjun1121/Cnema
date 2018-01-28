<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/community/mailView.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>${mail.title}</title>
<script type="text/javascript">

	$(function() {
		$("#write_btn").click(function() {
			location.href="mailWriteForm?receive_id=${mail.receive_id}"
		});
		$("#delete_btn").click(function() {
			alert("삭제");
		});
		
		function goBack() {
		    window.history.back();
		}
		
	});


</script>
</head>
<body>

	<table>
		<tr>
			<td class="title">제목</td>
			<td>${mail.title }</td>
		</tr>
		<tr>
			<td class="title">받는 사람</td>
			<td>${mail.receive_id }</td>
		</tr>
		<tr>
			<td class="title">보낸 날짜</td>
			<td>${mail.send_date }</td>
		</tr>
		<tr>
			<td class="title">내용</td>
			<td class="contents">${mail.contents }</td>
		</tr>
	</table>
	
	<button class="mailView_btns" id="write_btn">쪽지쓰기</button>
	<button class="mailView_btns" id="delete_btn">삭제</button>
	<button class="mailView_btns" id="list_btn" onclick="goBack()">목록</button>
</body>
</html>