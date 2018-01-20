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
		var movieNum = $("#movie_num").val();
		var areaName = $("#areaName").val();
		var theaterNum = $("#theater_num").val();
		var dayNum = $("#day_num").val();
		var scheduleNum = $("#schedule_num").val();
		/*  */
		$(".movies").each(function() {
			if($(this).attr("title") == movieNum) {
				var num = $(this).attr("title");
				$(this).css("background-color","red");
				$.ajax({
					url:"../ajax/qrMovie",
					type:"post",
					data:{
						movie_num:num
					},
					success:function(data){
						$("#qrMovie").html(data);
					}
				});
			}
		});
		
		$(".area").each(function(){
			if($(this).attr("title") == areaName){
				var area = $(this).attr("title");
				$(".area").css("background-color","");		
				$(this).css("background-color","red");
				
				$.ajax({
					url:"../ajax/locationList",
					type:"post",
					data:{
						area:area,
						location:theaterNum
					},
					success:function(data){
						$("#list").html(data);
					}
				});
			}
		});
		
		$(".days").each(function(){
			if($(this).attr("title") == dayNum){
				$(this).css("background-color","red");
				
				$.ajax({
					url:"../ajax/qrScheduleList",
					type:"post",
					data:{
						theater_num:theaterNum,
						movie_num:movieNum,
						day_num:dayNum,
						schedule_num:scheduleNum
					},
					success:function(data){
						$("#scheduleList").html(data);
					}
				});
				
				$.ajax({
					url:"../ajax/qrSchedule",
					type:"post",
					data:{
						theater_num:theaterNum,
						day_num: dayNum,
						schedule_num:scheduleNum
					},
					success:function(data){
						$("#qrTheater").html(data);
					}
				});
				
			}
		});
		
		
		/*  */
		$(".area").click(function(){
			$(".area").css("background-color","");
			$(this).css("background-color","red");
			var area = $(this).attr("title");
			$("#areaName").val(area);
			$.ajax({
				url:"../ajax/locationList",
				type:"post",
				data:{
					area:area
				},
				success:function(data){
					//$(".locationList").html("");
					$("#list").html(data);
				}
			});
		});
		/*  */
		$(".movies").click(function(){
			$(".movies").css("background-color","");
			$(this).css("background-color","red");
			
			var num = $(this).attr("title");
			$("#movie_num").val(num);
			$.ajax({
				url:"../ajax/qrMovie",
				type:"post",
				data:{
					movie_num:num
				},
				success:function(data){
					$("#qrMovie").html(data);
				}
			});
		});
		/*  */
		$("#list").on("click", ".location" , function(){
			$(".location").css("background-color","");
			$(this).css("background-color","red");
			var theater_num = $(this).attr("title");
			$("#theater_num").val(theater_num);
			$("#schedule_num").val("");
			var day = $("#day_num").val();
			$.ajax({
				url:"../ajax/qrDay",
				type:"post",
				data:{
					theater_num:theater_num,
					day: day
				},
				success:function(data){
					$("#qrTheater").html(data);
				}
			});
		});
		/*  */
		$(".days").click(function(){
			$(".days").css("background-color","");
			$(this).css("background-color","red");
			var day = $(this).attr("title");
			var theater_num = $("#theater_num").val();
			$("#day_num").val(day);
			$("#schedule_num").val("");
			$.ajax({
				url:"../ajax/qrDay",
				type:"post",
				data:{
					theater_num:theater_num,
					day:day
				},
				success:function(data){
					$("#qrTheater").html(data);
				}
			});
			
		})
		/*  */
		//$(".time").click(function(){
		$("#all").on("click", ".time" , function(){
			var movie_num = $("#movie_num").val();
			var theater_num = $("#theater_num").val();
			var day_num = $("#day_num").val();
			
			if(movie_num == '' || theater_num=='' || day_num==''){
			}else{
				$.ajax({
					url:"../ajax/qrScheduleList",
					type:"post",
					data:{
						theater_num:theater_num,
						movie_num:movie_num,
						day_num:day_num
					},
					success:function(data){
						$("#scheduleList").html(data);
					}
				});
			}
		});
		/*  */
		$("#scheduleList").on("click", ".schedules" , function(){
			$(".schedules").css("background-color","");
			$(this).css("background-color","red");
			var schedule_num = $(this).attr("title");
			$("#schedule_num").val(schedule_num);
			var theater_num = $("#theater_num").val();
			var day_num = $("#day_num").val();
			$.ajax({
				url:"../ajax/qrSchedule",
				type:"post",
				data:{
					theater_num:theater_num,
					day_num: day_num,
					schedule_num:schedule_num
				},
				success:function(data){
					$("#qrTheater").html(data);
				}
			});
			
		});
		/* seatBtn */
		$("#rightBtn1").click(function(){
			var movie_num = $("#movie_num").val();
			var theater_num = $("#theater_num").val();
			var day_num = $("#day_num").val();
			var schedule_num = $("#schedule_num").val();
			if(movie_num == ''){
				alert("영화를 선택해주세요");
			}else if(theater_num==''){
				alert("극장을 선택해주세요");
			}else if(day_num==''){
				alert("날짜를 선택해주세요");
			}else if(schedule_num==''){
				alert("시간을 선택해주세요");
			}else{
				document.reserve.submit();
			}
		});

		/*  */
	});
</script>
<style type="text/css">
	*{
		margin: 0px;
		padding: 0px;
	}
	div{
		height: 600px;
	}

	#all{
		background-color: red;
		width: 1000px;
	}
	
	#movie{
		background-color: #f0f0f0;
		width: 290px;
		float: left;
		margin-left: 2px;
	}
	#theater{
		background-color: #f0f0f0;
		width: 290px;
		float: left;
		margin-left: 2px;
	}
	#day{
		background-color: #f0f0f0;
		width: 100px;
		float: left;
		margin-left: 2px;
	}
	#schedule{
		background-color: #f0f0f0;
		width: 310px;
		float: left;
		margin-left: 2px;
	}
	
	.head{
		height: 35px;
		background-color: black;
		
	}
	
	.head h2{
		color: white;
		text-align: center;
	}
	ul{
		list-style: none;
	}
	.locationList{
		float: right;
		overflow: auto;
		height: 500px;
	}
</style>
</head>
<body>
	<h2>Quick Reserve</h2>
	<div id="all">
		<div id="movie">
			<div class="head">
				<h2>영화</h2>
			</div>
			<ul style="height: 500px; overflow: auto;">
				<c:forEach items="${movie }" var="DTO">
					<li>
						<a href="#" onclick="return false;" class="movies time" title="${DTO.movie_num }">
							<span>${DTO.age_limit }</span>
							<span>${DTO.movie_name }</span>
						</a>
					</li>
				</c:forEach>
			</ul>
		</div>
		
		<div id="theater">
			<div class="head">
				<h2>극장</h2>
			</div>
			<ul>
				<li>
					<a href="#" class="area" id="area" title="서울" onclick="return false;" style="background-color: red;">서울</a>
					<div class="locationList" id="list">
						<ul>
							<c:forEach items="${location }" var="DTO">
								<li>
									<a href="#" onclick="return false;" class="location time" title="${DTO.theater_num }" >
										${DTO.location }
									</a>
								</li>
							</c:forEach>
						</ul>
					</div>
				</li>
				<li>
					<a href="#" class="area" title="경기" onclick="return false;">경기</a>
				</li>

			</ul>

		</div>
		
		<div id="day">
			<div class="head">
				<h2>날짜</h2>
			</div>
				<ul>
					<c:forEach items="${dayList }" var="DTO">
						<p><a href="#" class="days time" title="${DTO.day_num }" onclick="return false;">${DTO.week} ${DTO.day }</a></p>
					</c:forEach>
				</ul>
			<ul>
			</ul>
		</div>
		
		<div id="schedule">
			<div class="head">
				<h2>시간</h2>
			</div>
				<ul id="scheduleList">
					<li><h4> 영화, 극장, 날짜를 선택해주세요</h4></li>
				</ul>
		</div>
	</div>
	<div id="bottom_area">
		
		<form action="">
		<input type="hidden" id="leftBtn1" value="이전" style="float: left;">
			<table border="1"  style="float: left; width: 217px; height: 118px;" id="qrMovie">
				<tr>
					<td>영화선택</td>
				</tr>
			</table>
			<table border="1" style="float: left; margin-left: 10px; width: 214px; height: 120px;" id="qrTheater">
				<tr>
					<td>극장선택</td>
				</tr>											
			</table>
			<table border="1" style="float: left; margin-left: 10px; width: 214px; height: 120px;" id="qrSeat">
				<tr>
					<td>좌석선택</td>
				</tr>											
			</table>
		<input type="button" id="rightBtn1" value="다음">
		<input type="hidden" id="rightBtn2" value="결제">	
		</form>
		<form action="./quickReserve2" method="post" name="reserve" style="clear: both;">
			<input type="hidden" id="movie_num" name="movie_num" value="${movie_num }">
			<input type="hidden" id="areaName" name="areaName" value="${areaName }">
			<input type="hidden" id="theater_num" name="theater_num" value="${theater_num }">
			<input type="hidden" id="day_num" name="day_num" value="${day_num }">
			<input type="hidden" id="schedule_num" name="schedule_num" value="${schedule_num }">
		</form>
	</div>
</body>

</html>






