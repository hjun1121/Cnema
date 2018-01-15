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
		var area = '${area}';
		var location = '${location}';
		
		$(".areas").each(function(){
			 if($(this).attr("title") == area) {
				 $(this).css("background-color","red");
			 }
		});
		
	 	$(".location").each(function(){
			 if($(this).attr("title") == location) {
				 $(this).css("background-color","red");
			 }
		}); 
		

		$(".areas").click(function(){
			$(".areas").css("background-color","");
			$(this).css("background-color","red");
			area = $(this).attr("title");
			$("#areaN").val(area);
			var locationN = $("#locationN").val();
			$.ajax({
				url:"../ajax/locationList",
				type:"POST",
				data:{
					area : area,
					location : locationN
				},
				success:function(data){
					$("#locationList").html(data);
				}
			});
		});
		$("#locationList").on("click",".location",function(){
			$(".location").css("background-color","");
			$(this).css("background-color","red");
			$("#locationN").val($(this).attr("title"));
			$("#dayN").val("${dayList[0].day_num }");

			var theaterName = $(this).html().trim();
			$("#theaterName").html(theaterName);
			document.frm.submit();
		});
		
		$("#day1").css("background-color","red");
		
		$(".days").click(function(){
			$(".days").css("background-color","");
			$(this).css("background-color","red");
			
			var day = $(this).attr("title");
			var location = $("#locationN").val();
			$("#dayN").val(day);
			
			$.ajax({
				url:"../ajax/slScheduleList",
				type:"POST",
				data:{
					location : location,
					day : day
				},
				success:function(data){
					$("#scheduleList").html(data);
				}
			});
		});
		
	});
</script>
<style type="text/css">
ul{
	list-style: none;
}
#locationList ul{
	clear: both;
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
<div id="locationList">
	<ul>
		<c:forEach items="${locationList }" var="DTO">
			<li>
				<a href="#" onclick="return false;" class="location time" title="${DTO.theater_num }" >
				${DTO.location }
				</a>
			</li>
		</c:forEach>
	</ul>	
</div>
<div id="dayList">
	<ul style="clear: both;">
	<c:forEach items="${dayList }" var="DTO" varStatus="count">
		<li id="day${count.count }" class="days" title="${DTO.day_num }"  >
			<a href="#"  onclick="return false;">${DTO.week} ${DTO.day }</a>
		</li>
	</c:forEach>	
	</ul>
</div>

<div id="scheduleList">
	<ul style="clear: both;">
		<c:forEach items="${movieList }" var="movieDTO">
			<li style="float: none;">${movieDTO.movie_name }</li>
			<c:forEach items="${movieDTO.sList}" var="sList" varStatus="count">
				<c:forEach items="${sList }" var="sc" varStatus="count">
					<c:if test="${count.first }">
					${sc.screen_num }관
					</c:if>
				<a href="#" onclick="return false;" title="${sc.schedule_num }">${sc.in_time }</a>
					<c:if test="${count.last }">
					<br>
					</c:if>
				</c:forEach>
			</c:forEach>
		</c:forEach>
	</ul>
</div>

<form action="../theater/scheduleList" name="frm" method="get">
	<input type="text" id="areaN" name="area" value="${area }">
	<input type="text" id="locationN" name="location" value="${location }">
	<input type="text" id="dayN" name="day" value=${dayList[0].day_num }>
</form>
</body>
</html>