<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 캘린더 추가 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
<title>나의 쿠폰</title>
<script type="text/javascript">
	$(function() {
		var type = '${type}';
		
		$(".type").each(function() {
			if($(this).val() == type) {
				$(this).attr("selected", true);
			}
		});
		$("#cBtn").click(function(){
			var cType = $("#type").val();
			location.href="./couponHistory?type="+cType;
		});
		
		$("#testDatepicker1").val('${testDatepicker1}');
		$("#testDatepicker2").val('${testDatepicker2}');
		
		$( "#testDatepicker1" ).datepicker({
	    	changeMonth: true, 
	        changeYear: true,
	        nextText: '>',
	        prevText: '<',
	        dateFormat : 'yy-mm-dd',
	        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	        dayNamesMin: ['일','월','화','수','목','금','토'],
	   	 	changeMonth: true,
	        changeYear: true,
	   		showMonthAfterYear: true,
	    });
	    $( "#testDatepicker2" ).datepicker({
	    	changeMonth: true, 
	        changeYear: true,
	        nextText: '>',
	        prevText: '<',
	        dateFormat : 'yy-mm-dd',
	        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	        dayNamesMin: ['일','월','화','수','목','금','토'],
	   	 	changeMonth: true,
	        changeYear: true,
	   		showMonthAfterYear: true,
	    });
	});
</script>
</head>
<body>
	<h3>MY COUPON</h3>
	<form action="couponHistory">
		<select id="type" name="type">
			<option class = "type" value="11">사용가능</option>
			<option class = "type" value="10">사용완료</option>
			<option class = "type" value="12">기간만료</option>
		</select>
		<input type="button" id="cBtn" value="GO">
	</form>
	<table>
		<tr>
			<td>쿠폰이름</td>
			<td>쿠폰번호</td>
			<td>사용일</td>
			<td>상태</td>
		</tr>
		<c:forEach items="${mcList }" var="mCouponList">
			<tr>
				<td>${mCouponList.name }</td>
				<td>${mCouponList.num }</td>
				<td>${mCouponList.publish_date }</td>
				<td>${mCouponList.use_date }</td>
				<c:if test="${mCouponList.type eq 11 }">
					<td>사용가능</td>
				</c:if>
				<c:if test="${mCouponList.type eq 10 }">
					<td>사용만료</td>
				</c:if>
				<c:if test="${mCouponList.type eq 12 }">
					<td>기간만료</td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
	
	
	<form name="frm" action="couponHistory" method="get">
		<input type="text" name="testDatepicker1" id="testDatepicker1">~
		<input type="text" name="testDatepicker2" id="testDatepicker2"> 
		<input type="submit" id="cBtn" value="조회하기">
	</form>
	<table>
		<tr>
			<td>쿠폰이름</td>
			<td>쿠폰번호</td>
			<td>사용일</td>
		</tr>
		<c:forEach items="${cdList }" var="mCouponList">
			<tr>
				<td>${mCouponList.name }</td>
				<td>${mCouponList.num }</td>
				<td>${mCouponList.use_date }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>