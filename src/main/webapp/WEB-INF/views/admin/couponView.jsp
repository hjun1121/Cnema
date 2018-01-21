<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>쿠폰 수정하기</title>
<script type="text/javascript">
$(function(){
	var type='${type}';
	$(".type").each(function(){
		if($(this).val()==type){
			$(this).attr("selected",true);
		}
	});
	
});
</script>
</head>
<body>
<h3>쿠폰 쿠폰 수정하기</h3>
	<form action="./couponRevision" method="POST">
	<input type="hidden" name="c_num" value="${couponDTO.c_num }">
	<table>
		<tr>
			<td>쿠폰 이름</td>
			<td><input type="text" name="name" value="${couponDTO.name }"></td>
		</tr>
		<tr>
			<td>쿠폰 타입</td>
			<td>
			<select id="type">
				<option class="type" value="11">금액</option>
				<option class="type" value="10">할인율</option>
			</select>
			</td>
		</tr>
		<tr>
			<td>금액</td>
			<td><input type="text" name="price" value="${couponDTO.price }"></td>
		</tr>
		<tr>
			<td>유효기간</td>
			<td><input type="number" name="v_day" value="${couponDTO.v_day }"></td>
		</tr>
	</table>
	<input type="submit" value="확인">
	</form>
</body>
</html>