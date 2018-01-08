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
		/*  */
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
		/*  */
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
		/*  */
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
		/*  */
		$(".days").click(function(){
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
		/*  */
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
		/*  */
		$("#seatBtn").click(function(){
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
				$.ajax({
					url:"../ajax/qrSeatBox",
					type:"post",
					data:{
						theater_num:theater_num,
						day_num: day_num,
						schedule_num:schedule_num
					},
					success:function(data){
						$("#all").html(data);
					}
				});
			}
		});
		/*  */
		$("#all").on("click", ".adult" , function(){
			var adult = $(this).attr("title");
			var teen = $("#teen_num").val();
			var newCount = (adult*1+teen*1);
			if(sCount>newCount){
				alert("인원수보다 선택 자리수가 더 많습니다")
			}else{
				var theater_num = $("#theater_num").val();
				var day_num = $("#day_num").val();
				var schedule_num = $("#schedule_num").val();
				$(".adult").css("background-color","");
				$(this).css("background-color","white");
				$("#adult_num").val(adult);
				if(adult=='0'){
					$("#adult_num").val("");
					if(teen == ''){
						$("#people").val("");
					}else{
						$("#people").val("청소년"+teen+"명");
					}
				}else{
					if(teen == ''){
						$("#people").val("성인"+adult+"명");
					}else{
						$("#people").val("성인"+adult+"명, 청소년"+teen+"명");
					}
				}
				var people = $("#people").val();
				$("#pCount").val(adult*1+teen*1);
				$.ajax({
					url:"../ajax/qrSchedule",
					type:"post",
					data:{
						theater_num:theater_num,
						day_num: day_num,
						schedule_num:schedule_num,
						people: people
					},
					success:function(data){
						$("#qrTheater").html(data);
					}
				});
			}
		});
		/*  */
		$("#all").on("click", ".teen" , function(){
			var teen = $(this).attr("title");
			var adult = $("#adult_num").val();
			var newCount = (adult*1+teen*1);
			if(sCount>newCount){
				alert("인원수보다 선택 자리수가 더 많습니다")
			}else{
				var theater_num = $("#theater_num").val();
				var day_num = $("#day_num").val();
				var schedule_num = $("#schedule_num").val();
				$(".teen").css("background-color","");
				$(this).css("background-color","white");
				$("#teen_num").val(teen);
				if(teen=='0'){
					$("#teen_num").val("");
					if(adult==''){
						$("#people").val("");
					}else{
						$("#people").val("성인"+adult+"명");
					}
				}else{
					if(adult == ''){
						$("#people").val("청소년"+teen+"명");
					}else{
						$("#people").val("성인"+adult+"명, 청소년"+teen+"명");
					}
				}
				var people = $("#people").val();
				$("#pCount").val(adult*1+teen*1);
				$.ajax({
					url:"../ajax/qrSchedule",
					type:"post",
					data:{
						theater_num:theater_num,
						day_num: day_num,
						schedule_num:schedule_num,
						people: people
					},
					success:function(data){
						$("#qrTheater").html(data);
					}
				});
			}
		});
		/*  */
		$("#all").on("click", ".seat" , function(){
			var pCount = $("#pCount").val();
			$.ajax({
				url:"../ajax/qrSeatList",
				type:"post",
				data:{
					pCount:pCount
				},
				success:function(data){
					$("#seatList").html(data);
				}
			});
		});
		/*  */
		var sCount = 0;
		$("#all").on("click", ".seats" , function(){
			var pCount = $("#pCount").val();
			if(sCount < pCount){
				$(this).attr("class","seatOn");
				$(this).css("background-color","pink")
				var seat_num = $(this).attr("title");
				$("#seat1").val(seat_num);
				sCount++;
			}else{
				alert("인원보다 많은자리입니다");
			}
		});
		/*  */
		$("#all").on("click", ".seatOn" , function(){
			if(confirm("이 좌석을 취소하시겠습니까?")){
				$(this).attr("class","seats");
				$(this).css("background-color","")
				sCount--;
			}else{
				
			}
			var seat_num = $(this).attr("title");
			var seatList = $("#seat_num").val();
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
					<li><h4> 영화, 극장, 날짜를 선택해주세요</h4></li>
				</ul>
		</div>
	</div>
	<div id="bottom_area">
		<form action="">
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
			<table border="1" style="float: left; margin-left: 10px" id="qrSeat">
				<tr>
					<td>좌석선택</td>
				</tr>											
			</table>
			<input type="button" id="seatBtn" value="좌석선택">
			
		</form>
		<form action="" style="clear: both;">
			m<input type="text" id="movie_num" name="movie_num">
			t<input type="text" id="theater_num" name="theater_num">
			d<input type="text" id="day_num" name="day_num">
			sc<input type="text" id="schedule_num" name="schedule_num">
			ad<input type="text" id="adult_num" name="adult_num">
			te<input type="text" id="teen_num" name="teen_num">
			pe<input type="text" id="people" name="people">
			pC<input type="text" id="pCount" name="pCount" value="0">
			<div id="seatList">
			
			</div>
		</form>
	</div>
</body>

</html>






