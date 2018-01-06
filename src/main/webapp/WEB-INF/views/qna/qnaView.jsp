<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Qna View Page</h1>
	<div>
		<table class="table table-hover">
			<tr>
				<td>지역</td>
				<td>영화관</td>
				<td>문의유형</td>
				<td>제목</td>
				<td>등록일</td>
			</tr>
			<tr>
				<td>${list.area}</td>
				<td>${list.location }</td>
				<td>${list.type}</td>
				<td>${list.title }</td>
				<td>${list.reg_date }</td>
			</tr>
		</table>
		<textarea class="form-control" rows="5">${list.contents }</textarea>
		<c:forEach items="${list.ar }" var="file">
			<a href="../util/download?fileName=${file.fileName}&oriName=${file.oriName}">${file.oriName}</a>
		</c:forEach>
		
		<a href="./qnaDelete?num=${list.num }" class="btn btn-default">DELETE</a>
		<a href="./qnaList" class="btn btn-default">List</a>
		
	</div>
	<c:if test="${member.type == 20}">
	<div id="reply">
	<form action="qnaUpdate">
		<h3>답변 달기</h3>
		<textarea name="reply" rows="5" cols="30"></textarea>
		<button type="submit">답변 달기</button>
		</form>
	</div>
	</c:if>
</body>
</html>