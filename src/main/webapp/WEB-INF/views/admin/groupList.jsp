<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>그룹 리스트(관리자용)${fn:length(groupList)}개</title>
<script type="text/javascript">
$(function(){
	$(".rBtn").click(function(){
		var group_num = $(this).attr("title");
		location.href="./groupRemove?group_num="+group_num;
	});
	$("#aBtn").click(function(){
		location.href="./groupRemove?group_num=-1";
	});
});
</script>
</head>
<body>
<h3>그룹 목록</h3>
<form>
	<table>
		<tr>
			<td>그룹이름</td>
			<td>명수</td>
			<td><input type="button" name="aBtn" id="aBtn" value="전체삭제"></td>
		</tr>
		<c:forEach items="${groupList }" var="gList" varStatus="gc" >
		<input type="hidden" class="gnClass" title="${gList.group_num }">
		<tr>
			<td>${gList.group_num }</td>
			<td>${groupCountList[gc.index] }</td>
			<td><input type="button" class="rBtn" title="${gList.group_num }" value="X"></td>
		</tr>
		</c:forEach>
	</table>
</form>
</body>
</html>