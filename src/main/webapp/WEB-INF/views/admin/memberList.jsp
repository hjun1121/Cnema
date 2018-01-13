<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>멤버리스트</title>
<script type="text/javascript">
$(function(){
	$("#groupAll").click(function(){
		if($("input[name='groupAll']").prop("checked")){
			$("input[name='group']").prop("checked",true);
		}else{
			$("input[name='group']").prop("checked",false);
		}
	});
	
	$("input:checkbox[name='group']").change(function(){
		var totalCount = $('input:checkbox[name="group"]').length;
		var count = $('input:checkbox[name="group"]:checked').length;
		if(totalCount==count){
			$("input[name='groupAll']").prop("checked",true);
		}
		if(totalCount!=count){
			$("input[name='groupAll']").prop("checked",false);
		}
	});
});
</script>
</head>
<body>
<h3>멤버리스트</h3>
<input type="button" id="birth" value="생일쿠폰">
<input type="button" id="vip" value="VIP쿠폰">
<table>
	<tr>
		<td><input type="checkbox" name="groupAll" id="groupAll" value="all"></td>
		<td>ID</td>
		<td>NAME</td>
		<td>BIRTH</td>
		<td>TYPE</td>
		<td>쿠폰갯수</td>
	</tr>
	<c:forEach items="${memList }" var="mList" varStatus="status">
	<c:set var="value">result${status.count }</c:set>
	<tr>
		<td><input type="checkbox" name="group" value="${mList.id }"></td>
		<td><a href="">${mList.id }</a></td>
		<td>${mList.name }</td>
		<td>${mList.birth }</td>
		<td>${mList.type }</td>
		<td>${requestScope[value]}</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>