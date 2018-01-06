<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>나의 쿠폰</title>
<script type="text/javascript">
	$(function() {
		var type = '${type}';
		
		$(".type").each(function() {
			if($(this).val() == type) {
				$(this).attr("selected", true);
			}
		});
	});
</script>
</head>
<body>
	<h3>MY COUPON</h3>
	<form action="couponHistory" method="POST">
		<select id="type" name="type">
			<option class = "type" value="11">사용가능</option>
			<option class = "type" value="10">사용완료</option>
			<option class = "type" value="12">기간만료</option>
		</select>
	<input type="submit" value="GO">

	</form>
	<table>
		<tr>
			<td>쿠폰이름</td>
			<td>쿠폰번호</td>
			<td>발행일</td>
			<td>사용일</td>
		</tr>
		<c:forEach items="${mcList }" var="mCouponList">
			<tr>
				<td>${mCouponList.name }</td>
				<td>${mCouponList.num }</td>
				<td>${mCouponList.publish_date }</td>
				<td>${mCouponList.use_date }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>