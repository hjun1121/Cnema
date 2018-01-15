<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>위시리스트 &lt;무비로그&gt;</title>
</head>
<body>
<h3>위시 리스트 ${fn:length(wList)}건</h3>
	<form action="wishList" method="POST">
		<c:forEach items="${wList}" var="wishList">
			<input type="hidden" name="wish_num" value="${wishList.wish_num }">
			<a href="../movie/movie_view?movie_num?${wishList.movieDTO.movie_num}">사진 : ${wishList.movieDTO.fileName}</a><br>
			영화명 : ${wishList.movieDTO.movie_name}<br>
			개봉일 : ${wishList.movieDTO.open_date} 개봉<br>
			좋아요수 :${wishList.movieDTO.wish}<br>
			<button>예매</button><br>
			<input type="submit" value="X"><br>
			----<br>
		</c:forEach>
	</form> 
</body>
</html>