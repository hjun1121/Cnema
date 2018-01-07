<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>위시리스트</title>
</head>
<body>
<h3>위시 리스트</h3>
	<c:forEach items="${mwList}" var="mList">
		사진 : ${mList.fileName}<br>
		영화명 : ${mList.movie_name}<br>
		개봉일 : ${mList.open_date}<br>
		좋아요수 :${mList.wish}<br>
		<button>예매</button><br>
		----<br>
	</c:forEach>
</body>
</html>