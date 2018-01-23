<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>평점 보기</title>
</head>
<body>
<h3>평점보기</h3>

<h2>${movieDTO.movie_name }</h2>

<form action="movieReviewDel" method="POST">
	<input type="hidden" id="movie_num" name="movie_num" value="${movieDTO.movie_num }">
	<textarea name="review" id="review">${reviewDTO.contents }</textarea>
	<input type="text" name="id" value="${myInfo.id }">
	<input type="text" name="reg_date" value="${reviewDTO.reg_date }">
	<c:if test="${reviewDTO.r_type eq 10 }">
		<input type="submit" value="X삭제">
	</c:if>
	<c:if test="${reviewDTO.r_type ne 10 }">
		<input type="button" value="삭제된 리뷰">
	</c:if>
</form>
</body>
</html>