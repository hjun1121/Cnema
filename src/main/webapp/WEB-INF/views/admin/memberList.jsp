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
		});
		
		location.href="./groupInsert?groupVal[]="+groupVal;
	});
	
	$("#groudAdmin").click(function(){
		location.href="groupList";
	});
	
	$(".gList").click(function(){
		var number = $(this).val();
		location.href="memberList?group_num="+number+"&sort=-1";
	});
	
	$("#allMember").click(function(){
		location.href="memberList?group_num=-1&sort=-1";
	});
	
	$("#bSort").click(function(){
		location.href="memberList?group_num=-1&sort=10";
	});
	
	$("#tSort").click(function(){
		location.href="memberList?group_num=-1&sort=20";
	});
	
	$("#sBtn").click(function(){
		var c_num = $("#kind").val();
		var groupVal = [];
		$("input[name='group']:checked").each(function(){
			groupVal.push($(this).val());
		});
		location.href="./couponGive?c_num="+c_num+"&groupVal[]="+groupVal;
	});
	 
	$("#pBtn").click(function(){
		var price = $("#price").val();
		var groupVal = [];
		$("input[name='group']:checked").each(function(){
			groupVal.push($(this).val());
		});
		location.href="./pointGive?price="+price+"&groupVal[]="+groupVal;
	});
});
</script>
</head>
<body>
<h3>멤버리스트</h3>

<input type="button" id="groudAdmin" value="그룹관리"><br>

<input type="button" id="group" value="그룹만들기">
<br>
<input type="button" id="allMember" value="모든멤버">
<c:forEach items="${groupList }" var="gList">
	<input type="button" class="gList" id="${gList.group_num }" value="${gList.group_num }">
</c:forEach>

<br>
<select id="kind" name="kind">
	<c:forEach items="${cList}" var="couponList">
		<option class="kind" value="${couponList.c_num }">${couponList.name }</option>
	</c:forEach>
</select>
<input type="button" id="sBtn" value="쿠폰주기"><br>
<input type="number" id="price">
<input type="button" id="pBtn" value="포인트주기">
	
<table>
	<tr>
		<td><input type="checkbox" name="groupAll" id="groupAll" value="all"></td>
		<td>ID</td>
		<td>NAME</td>
		<td>BIRTH<input type="button" id="bSort"value="^"></td>
		<td>TYPE<input type="button" id="tSort"value="^"></td>
		<td>쿠폰갯수</td>
	</tr>
	<c:forEach items="${memList }" var="mList" varStatus="status">
	<c:set var="value">result${status.count }</c:set>
	<tr>
		<td><input type="checkbox" name="group" value="${mList.id }"></td>
		<td>${mList.id }</td>
		<td>${mList.name }</td>
		<td>${mList.birth }</td>
		<td>${mList.type }</td>
		<td>${requestScope[value]}</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>