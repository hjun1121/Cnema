<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>영화관목록(관리자용)${fn:length(theaterList)}개</title>
<script type="text/javascript">
$(function(){
	var kind='${kind}';
	var search='${search}';
	$("#search").val(search);
	$(".kind").each(function(){
		if($(this).val()==kind){
			$(this).attr("selected",true);
		}
	});
	$("#sBtn").click(function(){
		var sKind = $("#kind").val();
		var search = $("#search").val();
		location.href="./theaterList?kind="+sKind+"&search="+search;
	});
});
</script>
</head>
<body>
<h3>영화관목록</h3>
	<select id="kind">
		<option class="kind" value="location">지점</option>
		<option class="kind" value="area">지역</option>
	</select>
	<input type="text" name="search" id="search">
	<input type="button" id="sBtn" value="GO">
	<table>
		<tr>
			<td>지역</td>
			<td>지점</td>
		</tr>
		<c:forEach items="${theaterList }" var="tList">
		<tr>
			<td>${tList.area }</td>
			<td><a href="./theaterView?theater_num=${tList.theater_num}">${tList.location }</a></td>
		</tr>
		</c:forEach>
	</table>
	<a href="./theaterInsert"><Button>글쓰기</Button></a>
</body>
</html>