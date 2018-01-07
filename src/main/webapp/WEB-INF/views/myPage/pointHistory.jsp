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

<title>포인트 적립/사용내역</title>
<script type="text/javascript">
$(function() {
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
	<h3>Point 내역</h3>
	<form name="frm" action="pointHistory" method="post">
		<input type="text" name="testDatepicker1" id="testDatepicker1">~
		<input type="text" name="testDatepicker2" id="testDatepicker2"> 
		<input type="submit" value="조회하기">
	</form>
	<c:forEach items="${pList}" var="pointList">
		<table>
			<tr>
				<td>구매 구분</td>
				<td>적립일</td>
				<td>적립</td>
			</tr>
			<tr>
				<c:if test="${pointList.type eq 10}">
					<td>적립</td>
				</c:if>
				<c:if test="${pointList.type eq 11}">
					<td>사용</td>
				</c:if>
				<td>${pointList.use_day }</td>
				<td>${pointList.point_price }점</td>
			</tr>
		</table>
	</c:forEach>
</body>
</html>