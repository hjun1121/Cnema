<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	alert('sd'+'${message}');
	$(function(){
		$("#seatName").val("${reserve2.seatName}");
		document.frm.submit();
	});
	//location.href="../member/memberLogin?path=${path}";
</script>
</head>
<body>
	<form action="../member/memberLogin" id="frm" name="frm" method="get">
		<input type="text" name="path" value="${path }">	
		<input type="text" name="movie_num" value="${reserve.movie_num }">	
		<input type="text" name="theater_num" value="${reserve.theater_num }">	
		<input type="text" name="day_num" value="${reserve.day_num }">	
		<input type="text" name="schedule_num" value="${reserve.schedule_num }">	
		<input type="text" name="adult_num" value="${reserve2.adult_num }">	
		<input type="text" name="teen_num" value="${reserve2.teen_num }">	
		<input type="text" name="people" value="${reserve2.people }">	
		<input type="text" name="pCount" value="${reserve2.pCount }">	
		<input type="text" name="price" value="${reserve2.price }">	
		<c:forEach items="${seat_num }" var="seat">
			<input type="text" name="seat_num" value="${seat }">	
		</c:forEach>
		
		<input type="text" id="seatName" name="seatName">
	</form>
</body>
</html>