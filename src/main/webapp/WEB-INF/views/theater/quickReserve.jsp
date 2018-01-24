<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/headerBar.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/theater/quickReserve.css">
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
						theater_num:theaterNum
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
		/* 포인터 */
		$(".pointer").click(function(){
			$(".pointer").attr("class","pointer");
			$(this).attr("class","pointer selected");
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
					$("#list").html(data);
					$("#scheduleList").html("<li><h4> 영화, 극장, 날짜를 선택해주세요</h4></li>");
					$("#schedule_num").val("");
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

</head>
<body>
	<div id="cgvwrap">
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/header.jsp"></c:import>
			<!-- //////////////////////////////// -->
			<div id="contaniner" class="">
        	<!-- 상단바 시작 -->
        	<div class="linemap-wrap">
           		<div class="sect-linemap">
                	<div class="sect-bcrumb">
                    	<ul>
                        	<li>
                        		<a href="#"><img alt="home" src="${pageContext.request.contextPath }/resources/images/common/btn/btn_home.png"></a>
                        	</li>
                            <li>
                                <a href="#">예매</a>
                            </li>
                            <li class="last">
                            	빠른예매
                            </li>
                    	</ul>
                	</div>
            	</div>
        	</div>
        	<!-- 상단바 끝 -->
        	
        	<!-- 내용시작 -->
  
	<div id="contents">
		<div id="ticket" class="ticket ko">
			<div class="navi">
			</div>
			<div class="steps">
				<div id="all" class="step step1" style="height: 595px; display: block;">
					<div class="section section-movie" style="height: 593px;">
						<div class="col-head" id="skip_movie_list">
							<h3 class="sreader">영화</h3>
							<a href="#" class="skip_to_something" >영화선택 건너뛰기</a>
						</div>
						<div class="col-body" style="height: 560px;">
							<div id="movie" class="movie-select">
								<div class="movie-list nano has-scrollbar has-scrollbar-y" id="movie_list" style="height: 462px;">
									<ul class="content scroll-y" onscroll="movieSectionScrollEvent();" style="right: -17px;">
									<c:forEach items="${movie }" var="DTO">
									

										<c:choose>
											<c:when test="${DTO.age_limit eq 12 }">
												<li class="rating-12" >
													<a href="#" onclick="return false;" class="movies time" title="${DTO.movie_num }">
														<span class="icon">&nbsp;</span>
														<span class="text">${DTO.movie_name }</span>
													</a>
												</li>
											</c:when>
											<c:when test="${DTO.age_limit eq 15 }">
												<li class="rating-15" >
													<a href="#" onclick="return false;" class="movies time" title="${DTO.movie_num }">
														<span class="icon">&nbsp;</span>
														<span class="text">${DTO.movie_name }</span>
													</a>
												</li>
											</c:when>											
											<c:when test="${DTO.age_limit eq 19 }">
												<li class="rating-18" >
													<a href="#" onclick="return false;" class="movies time" title="${DTO.movie_num }">
														<span class="icon">&nbsp;</span>
														<span class="text">${DTO.movie_name }</span>
													</a>
												</li>
											</c:when>											
											
											<c:otherwise>
												<li class="rating-all">
													<a href="#" onclick="return false;" class="movies time" title="${DTO.movie_num }">
														<span class="icon">&nbsp;</span>
														<span class="text">${DTO.movie_name }</span>
													</a>
												</li>
											</c:otherwise>
										</c:choose>																								

									</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<!-- THEATER 섹션 -->
					<div class="section section-theater" style="height: 593px;">
						<div class="col-head" id="skip_theater_list">
							<h3 class="sreader">극장</h3>
							<a href="#" class="skip_to_something">극장선택 건너뛰기</a>
						</div>
						<div class="col-body" style="height: 560px;">
							<div class="theater-select">
								<div class="theater-list" style="height: 388px;">
									<div id="theater" class="theater-area-list">
										<ul>
											<li class="pointer selected">
												<a href="#" class="area"  title="서울" onclick="return false;" style="background-color: red;">
													<span class="name">서울</span>
													<span class="count">(${fn:length(location)})</span>
												</a>
												<div class="locationList area_theater_list nano has-scrollbar has-scrollbar-y" id="list" style="height: 388px;">
													<ul class="content scroll-y" style="right: -17px;">
														<c:forEach items="${location }" var="DTO">
															<li class="selected" style="display: list-item;">
																<a href="#" onclick="return false;" class="location time" title="${DTO.theater_num }" >
																	${DTO.location }
																</a>
															</li>
														</c:forEach>
													</ul>
												</div>
											</li>
											<c:forEach items="${areaList }" var="area">
												<li class="pointer">
													<a href="#" class="area"  title="${area }" onclick="return false;">
														<span class="name">${area}</span>
														<span class="count">(${fn:length(area)})</span>
													</a>
												</li>
											</c:forEach>
											
										</ul>
									</div>
									<div class="theater-cgv-list nano has-scrollbar" id="theater_cgv_list">
										<ul class="content scroll-y" style="right: -17px;"></ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- DATE 섹션 -->
					<div class="section section-date" style="height: 593px;">
						<div class="col-head" id="skip_date_list">
							<h3 class="sreader">날짜</h3>
							<a href="#" class="skip_to_something">날짜 건너뛰기</a>
						</div>
						<div class="col-body" style="height: 560px;">
							<!-- 날짜선택 -->
							<div id="day" class="date-list nano has-scrollbar has-scrollbar-y" style="height: 522px;">
								<ul class="content scroll-y" tabindex="-1" style="right: -17px;">
									<div>
									<c:forEach items="${dayList }" var="DTO">
										<li class="day">
											<a href="#" class="days time" title="${DTO.day_num }" onclick="return false;">
												<span class="dayweek">${DTO.week}</span>
												<span class="day">${DTO.day }</span>
												<span class="sreader"></span>
											</a>
										</li>
									</c:forEach>
									</div>
								</ul>
							</div>
						</div>
					</div>
					<!-- TIME 섹션 -->
					<div class="section section-time" style="height: 593px;">
						<div class="col-head" id="skip_time_list">
							<h3 class="sreader">시간</h3>
							<a href="#" class="skip_to_something" >시간선택 건너뛰기</a>
						</div>
						<div class="col-body" style="height: 560px;">
							<!-- 시간선택 -->
							<div class="placeholder hidden">영화, 극장, 날짜를 선택해주세요.</div>
							<div id="schedule" class="time-list nano has-scrollbar">
								<div class="content scroll-y" style="right: -17px;">
									<div class="theater"  style="border: none;">
										<ul id="scheduleList">
											<h4> 영화, 극장, 날짜를 선택해주세요</h4>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				<!-- //step1 -->
			</div>
		</div>
	</div>
   
   <!-- ////////////////////////////////////////// -->
   
	
	<div id="bottom_area" style="width: 996px; height: 128px; background-color: black; font-weight: bold;">
		<form action="">
			<input type="hidden" id="leftBtn1" value="이전" style="float: left;">
				<table border="1"  style="float: left; width: 217px; height: 118px; margin-left: 20px; font-size: 13px;" id="qrMovie">
					<tr>
						<td>영화선택</td>
					</tr>
				</table>
				<table border="1" style="float: left; margin-left: 10px; width: 214px; height: 120px; font-size: 13px;" id="qrTheater">
					<tr>
						<td>극장선택</td>
					</tr>											
				</table>
				<table border="1" style="float: left; margin-left: 10px; width: 214px; height: 120px; font-size: 13px;" id="qrSeat">
					<tr>
						<td>좌석선택</td>
					</tr>											
				</table>
			<input type="button" id="rightBtn1" value="다음" style="float: right; width:106px; height:108px; margin-top: 10px; margin-right: 20px;">
			
		</form>
	</div>
	<div style="display: none;">
		<form action="./quickReserve2" method="post" name="reserve" style="clear: both;">
			<input type="text" id="movie_num" name="movie_num" value="${movie_num }">
			<input type="text" id="areaName" name="areaName" value="${areaName }">
			<input type="text" id="theater_num" name="theater_num" value="${theater_num }">
			<input type="text" id="day_num" name="day_num" value="${day_num }">
			<input type="text" id="schedule_num" name="schedule_num" value="${schedule_num }">
		</form>
	</div>
<%-- 	
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
			<input type="text" id="movie_num" name="movie_num" value="${movie_num }">
			<input type="text" id="areaName" name="areaName" value="${areaName }">
			<input type="text" id="theater_num" name="theater_num" value="${theater_num }">
			<input type="text" id="day_num" name="day_num" value="${day_num }">
			<input type="text" id="schedule_num" name="schedule_num" value="${schedule_num }">
		</form>
	</div>
	 --%>

			<!-- 내용 끝 -->
			</div>
			</div>
			<!-- ///////////////////////////////// -->
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	</div>
	
</body>
</html>