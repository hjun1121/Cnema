<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>박세나꺼</h2>
	

	<a href="../notice/noticeList">Notice List</a>
	<hr>
	
	<!--member  --> 
	<form action="../qna/qnaMyList" method="post">
	<input type="hidden" name="id" value="${member.id }">
	<input type="submit" value="QnaList(MEMBER)">	
	</form>
	<!-- Admin -->
	<a href="../qna/qnaList">Qna(Admin)</a>
	
	<a href="../qna/qnaList">Qna(확인용)</a>
	
	<a href="../qna/qnaWrite">문의하기</a>
	
	
	<hr>
	<a href="../event/eventList">Event List</a>
	
	<br>
	<a href="../">home</a>
</body>
</html>