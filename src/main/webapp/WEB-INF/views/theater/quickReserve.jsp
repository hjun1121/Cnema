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
		$(".area").click(function(){
			var area = $(this).attr("title");
			
			$.ajax({
				url:"../ajax/locationList",
				type:"post",
				data:{
					area:area
				},
				success:function(data){
					$(".locationList").html("");
					$("#list").html(data);
				}
			});
			
		});
		$(".movies").click(function(){
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
		
		$("#list").on("click", ".location" , function(){
			var num = $(this).attr("title");
			$("#theater_num").val(num);
			var day = $("#day_num").val();
			$.ajax({
				url:"../ajax/qrDay",
				type:"post",
				data:{
					theater_num:num,
					day: day
				},
				success:function(data){
					$("#qrTheater").html(data);
				}
			});
			
		});
		
		$(".days").click(function(){
			var day = $(this).attr("title");
			var theater_num = $("#theater_num").val();
			$("#day_num").val(day);
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
		
		$(".time").click(function(){
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
		
		$("#scheduleList").on("click", ".schedules" , function(){
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
		background-color: yellow;
		width: 290px;
		float: left;
		margin-left: 2px;
	}
	#theater{
		background-color: yellow;
		width: 290px;
		float: left;
		margin-left: 2px;
	}
	#day{
		background-color: yellow;
		width: 100px;
		float: left;
		margin-left: 2px;
	}
	#schedule{
		background-color: yellow;
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
		height: 200px;
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
			<ul>
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
					<a href="#" class="area" id="area" title="서울" onclick="return false;">서울</a>
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
					<div class="locationList" id="경기">
					</div>
				</li>
				<li>
					<a href="#" class="area" title="인천" onclick="return false;">인천</a>
					<div class="locationList" id="인천">
					</div>
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
				</ul>
		</div>
	</div>
	<div id="bottom_area">
		<form action="">
			<table border="1" style="float: left;" id="qrMovie">
				<tr>
					<td>빈칸</td>
				</tr>
			</table>
			<table border="1" style="float: left; margin-left: 10px" id="qrTheater">
				<tr>
					<td>빈칸</td>
				</tr>											
			</table>
		</form>
		<form action="" style="clear: both;">
			<input type="text" id="movie_num" name="movie_num">
			<input type="text" id="theater_num" name="theater_num">
			<input type="text" id="day_num" name="day_num">
			<input type="text" id="schedule_num" name="schedule_num">
		</form>
	</div>
</body>
</html>