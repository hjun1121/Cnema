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
	$(function(){
		$("#day1").css("background-color","red");
		
		$(".days").click(function(){
			$(".days").css("background-color","");
			$(this).css("background-color","red");
			
			var day = $(this).attr("title");
			alert(day);
		});
		
	});
</script>
<style type="text/css">
ul{
	list-style: none;
}
li{
	float: left; 
	margin-left: 5px;
}
</style>
</head>
<body>
	<h2>상영 시간표</h2>
	
<ul>
	<c:forEach items="${areaList }" var="DTO" varStatus="count">
		<li>
			<a href="#" class="areas" onclick="return false;" title="${DTO.area }">${DTO.area }</a>
		</li>
	</c:forEach>
</ul>

<ul style="clear: both;">
	<c:forEach items="${locationList }" var="DTO">
		<li>${DTO.location }</li>
	</c:forEach>
</ul>	

<ul style="clear: both;">
<c:forEach items="${dayList }" var="DTO" varStatus="count">
	<li id="day${count.count }" class="days" title="${DTO.day_num }"  >
		<a href="#"  onclick="return false;">${DTO.week} ${DTO.day }</a>
	</li>
</c:forEach>	
</ul>

</body>
</html>