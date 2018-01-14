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
	
	
	$("#group").click(function(){
		var groupVal = [];
		
		$("input[name='group']:checked").each(function(){
			groupVal.push($(this).val());
			$.ajax({
				url:"./groupInsert",
				type:"post",
				data:{
					groupVal:groupVal
				},
			});
		});
	});
	
	$("#groudAdmin").click(function(){
		location.href="groupList";
	});
	
	$("#91182").click(function(){
		var number = $("#91182").val();
		alert(number);
		location.href="memberList?group_num=91182";
	});
	
	$("#allMember").click(function(){
		location.href="memberList?group_num=-1";
	});
});
</script>
</head>
<body>
<h3>멤버리스트</h3>
<!-- <input type="button" id="birth" value="생일쿠폰">
<input type="button" id="vip" value="VIP쿠폰"> -->

<input type="button" id="groudAdmin" value="그룹관리"><br>
<input type="button" id="group" value="그룹만들기">

<input type="button" id="allMember" value="모든멤버">
<c:forEach items="${groupList }" var="gList">
	<input type="button" id="${gList.group_num }" value="${gList.group_num }">
</c:forEach>

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