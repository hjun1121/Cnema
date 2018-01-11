<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>영화 리스트</title>
<script type="text/javascript">
$(function(){
	var kind='${kind}';
	$(".kind").each(function(){
		if($(this).val()==kind){
			$(this).attr("selected",true);
		}
	});
	var search='${search}';
	$("#search").val(search);
	
	$("#sBtn").click(function(){
		var sKind = $("#kind").val();
		var search = $("#search").val();
		location.href="./movieList?kind="+sKind+"&search="+search;
	});
});
</script>
</head>
<body>
<h3>영화 리스트${fn:length(movieList)}개</h3>

<select id="kind">
		<option class="kind" value="title">제목</option>
		<option class="kind" value="type">장르</option>
		<option class="kind" value="actor">감독및출연진</option>
	</select>
<input type="text" name="search" id="search">
<input type="button" id="sBtn" value="GO">
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