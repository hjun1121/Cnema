<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화 리스트</title>
</head>
<body>
<h3>영화 리스트${fn:length(movieList)}개</h3>
<table>
	<tr>
		<td>사진</td>
		<td>영화 제목</td>
		<td>감독및출연진</td>
		<td>개봉일</td>
		<td>상영시간</td>
		<td>나이제한</td>
	</tr>
	<c:forEach items="${movieList }" var="mList">
	<tr>
		<td>${mList.fileName }</td>
		<td><a href="./movieView?movie_num=${mList.movie_num }">${mList.movie_name }</a></td>
		<td>${mList.actor }</td>
		<td>${mList.open_date }</td>
		<td>${mList.run_time }</td>
		<td>${mList.age_limit }</td>
	</tr>
	</c:forEach>
</table>
<a href="./movie_insert"><input type="button" value="글쓰기"></a>
</body>
</html>