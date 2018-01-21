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
		var area = '${areaName}';
		var location = '${theater_num}';
		
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
			$("#scheduleList").html('<ul style="clear: both;"></ul>');
			$("#locationN").val("");
			var locationN = $("#locationN").val();
			$.ajax({
				url:"../ajax/locationList",
				type:"POST",
				data:{
					area : area,
					theater_num : locationN
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
			$("#frm").attr("action","../theater/scheduleList")
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
					theater_num : location,
					day : day
				},
				success:function(data){
					$("#scheduleList").html(data);
				}
			});
		});
		
		/*  */
		$("#scheduleList").on("click",".schedules",function(){
			var schedule_num = $(this).attr("title");
			var movie_num = $(this).attr("id");
			$("#movie_num").val(movie_num);
			$("#schedule_num").val(schedule_num);
			
			$("#frm").attr("action","../theater/quickReserve")
			document.frm.submit();
		});
		/*  */
		
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
				<a href="#" class="schedules" id="${movieDTO.movie_num }" onclick="return false;" title="${sc.schedule_num }">${sc.in_time }</a>
					<c:if test="${count.last }">
					<br>
					</c:if>
				</c:forEach>
			</c:forEach>
		</c:forEach>
	</ul>
</div>

<form action="../theater/scheduleList" id="frm" name="frm" method="get">
	<input type="text" id="movie_num" name="movie_num">
	<input type="text" id="areaN" name="areaName" value="${areaName }">
	<input type="text" id="locationN" name="theater_num" value="${theater_num }">
	<input type="text" id="dayN" name="day_num" value="${dayList[0].day_num }">
	<input type="text" id="schedule_num" name="schedule_num">
</form>
</body>
</html>