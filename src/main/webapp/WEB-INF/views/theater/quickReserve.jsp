<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

    <link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/common.css">
    <link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/reset.css">
    <link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/layout.css">
    <link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/module.css">
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
				<div class="step step1" style="height: 595px; display: block;">
					<div class="section section-movie" style="height: 593px;">
						<div class="col-head" id="skip_movie_list">
							<h3 class="sreader">영화</h3>
							<a href="#" class="skip_to_something" >영화선택 건너뛰기</a>
						</div>
						<div class="col-body" style="height: 560px;">
							<div class="movie-select">
								<div class="movie-list nano has-scrollbar has-scrollbar-y" id="movie_list" style="height: 462px;">
									<ul class="content scroll-y" onscroll="movieSectionScrollEvent();" style="right: -17px;">
										<li class="rating-12" >
											<a href="#">
												<span class="icon">&nbsp;</span>
												<span class="text">메이즈러너-데스큐어</span>
												<span class="sreader"></span>
											</a>
										</li>
										<li class="rating-all selected">
											<a href="#">
												<span class="icon">&nbsp;</span>
												<span class="text">코코</span>
												<span class="sreader">선택됨</span>
											</a>
										</li>
										<li class="rating-15" >
											<a href="#">
												<span class="icon">&nbsp;</span>
												<span class="text">그것만이내세상</span>
												<span class="sreader"></span>
											</a>
										</li>
									</ul>
									<div class="pane pane-y" style="display: block; opacity: 1; visibility: visible;">
										<div class="slider slider-y" style="height: 50px; top: 0px;"></div>
									</div>
									<div class="pane pane-x" style="display: none; opacity: 1; visibility: visible;">
										<div class="slider slider-x" style="width: 50px;"></div>
									</div>
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
									<div class="theater-area-list" id="theater_area_list">
										<ul>
											<li class="selected">
												<a href="#" >
													<span class="name">서울</span>
													<span class="count">(29)</span>
												</a>
												<div class="area_theater_list nano has-scrollbar has-scrollbar-y" style="height: 388px;">
													<ul class="content scroll-y" style="right: -17px;">
														<li class="selected" style="display: list-item;">
															<a href="#" >강남<span class="sreader">선택됨</span></a>
														</li>
														<li class="" style="display: list-item;">
															<a href="#">강동<span class="sreader"></span></a>
														</li>
													</ul>
													<div class="pane pane-y" style="display: block; opacity: 1; visibility: visible;">
														<div class="slider slider-y" style="height: 50px; top: 0px;"></div>
													</div>
													<div class="pane pane-x" style="display: none; opacity: 1; visibility: visible;">
														<div class="slider slider-x" style="width: 50px;"></div>
													</div>
												</div>
											</li>
											<li>
												<a href="#">
													<span class="name">서울</span>
													<span class="count">(29)</span>
												</a>
												<div class="area_theater_list nano has-scrollbar has-scrollbar-y" style="height: 388px;">
													<ul class="content scroll-y" style="right: -17px;">
														<li class="selected" style="display: list-item;">
															<a href="#">강남<span class="sreader">선택됨</span></a>
														</li>
														<li class="" style="display: list-item;">
															<a href="#" >강동<span class="sreader"></span></a>
														</li>
													</ul>
													<div class="pane pane-y" style="display: block; opacity: 1; visibility: visible;">
														<div class="slider slider-y" style="height: 50px; top: 0px;"></div>
													</div>
													<div class="pane pane-x" style="display: none; opacity: 1; visibility: visible;">
														<div class="slider slider-x" style="width: 50px;"></div>
													</div>
												</div>
											</li>
										</ul>
									</div>
									<div class="theater-cgv-list nano has-scrollbar" id="theater_cgv_list">
										<ul class="content scroll-y" style="right: -17px;"></ul>
										<div class="pane pane-y" style="display: none; opacity: 1; visibility: visible;">
											<div class="slider slider-y" style="height: 50px;"></div>
										</div>
										<div class="pane pane-x" style="display: none; opacity: 1; visibility: visible;">
											<div class="slider slider-x" style="width: 50px;"></div>
										</div>
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
							<div class="date-list nano has-scrollbar has-scrollbar-y" id="date_list" style="height: 522px;">
								<ul class="content scroll-y" tabindex="-1" style="right: -17px;">
									<div>
										<li class="month dimmed">
											<div>
												<span class="year">2018</span>
												<span class="month">1</span>
												<div></div>
											</div>
										</li>
										<li class="day">
											<a href="#" >
												<span class="dayweek">월</span>
												<span class="day">22</span>
												<span class="sreader"></span>
											</a>
										</li>
										<li class="day selected">
											<a href="#" onclick="return false;">
												<span class="dayweek">화</span>
												<span class="day">23</span>
												<span class="sreader">선택됨</span>
											</a>
										</li>
										<li class="day dimmed">
											<a href="#" >
												<span class="dayweek">목</span>
												<span class="day">25</span>
												<span class="sreader">선택불가</span>
											</a>
										</li>
										<li class="month dimmed">
											<div>
												<span class="year">2018</span>
												<span class="month">2</span>
												<div></div>
											</div>
										</li>
										<li class="day dimmed">
											<a href="#" onclick="return false;">
												<span class="dayweek">목</span>
												<span class="day">1</span>
												<span class="sreader">선택불가</span>
											</a>
										</li>
									</div>
								</ul>
								<div class="pane pane-y" style="display: block; opacity: 1; visibility: visible;">
									<div class="slider slider-y" style="height: 50px; top: 0px;"></div>
								</div>
								<div class="pane pane-x" style="display: none; opacity: 1; visibility: visible;">
									<div class="slider slider-x" style="width: 50px;"></div>
								</div>
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
							<div class="time-option">
								<span class="morning">조조</span>
								<span class="night">심야</span>
							</div>
							<div class="placeholder hidden">영화, 극장, 날짜를 선택해주세요.</div>
							<div class="time-list nano has-scrollbar">
								<div class="content scroll-y" style="right: -17px;">
									<div class="theater"  style="border: none;">
										<span class="title">
											<span class="name">2D(자막)</span>
											<span class="floor">3관 8층</span>
											<span class="seatcount">(총172석)</span>
										</span>
										<ul>
											<li class="morning">
												<a class="button" href="#">
													<span class="time"><span>07:30</span></span>
													<span class="count">151석</span>
													<div class="sreader">종료시간 09:47</div>
													<span class="sreader mod"> 조조</span>
												</a>
											</li>
											<li class="selected">
												<a class="button" href="#" title="">
													<span class="time"><span>23:30</span></span>
													<span class="count">154석</span>
													<div class="sreader">종료시간 25:47</div>
													<span class="sreader mod"></span>
												</a>
											</li>
										</ul>
									</div>
								</div>
								<div class="pane pane-y" style="display: none; opacity: 1; visibility: visible;">
									<div class="slider slider-y" style="height: 50px;"></div>
								</div>
								<div class="pane pane-x" style="display: none; opacity: 1; visibility: visible;">
									<div class="slider slider-x" style="width: 50px;"></div>
								</div>
							</div>
						</div>
					</div>
				<!-- //step1 -->
			</div>
			<!-- <div class="tnb_area" style="height: 193px;">
				<div class="tnb_container" style="top: 669px; bottom: auto;">
				<div class="tnb_reset_btn"><a href="#" onmousedown="javascript:logClick('옵션/예매다시하기');" onclick="ticketRestart();return false;">예매 다시하기</a></div>
				<div class="tnb step1">
					btn-left
					<a class="btn-left" href="#" onclick="OnTnbLeftClick(); return false;" title="영화선택">이전단계로 이동</a>
					<div class="info movie">
						<span class="movie_poster"><img src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000080/80397/80397_185.JPG" alt="영화 포스터" style="display: inline;"></span>
						<div class="row movie_title colspan2" style="display: block;">
							<span class="data letter-spacing-min ellipsis-line2"><a href="http://www.cgv.co.kr/movies/detail-view/?midx=80397" target="_blank" onmousedown="javascript:logClick('SUMMARY/영화상세보기');" title="코코">코코</a></span>
						</div>
						<div class="row movie_type" style="display: block;">
							<span class="data ellipsis-line1" title="2D(자막)">2D(자막)</span>
						</div>
						<div class="row movie_rating" style="display: block;">
							<span class="data" title="전체 관람가">전체 관람가</span>
						</div>
						<div class="placeholder" title="영화선택" style="display: none;"></div>
					</div>
					<div class="info theater">
						<div class="row name" style="display: block;">
							<span class="header">극장</span>
							<span class="data letter-spacing-min ellipsis-line1"><a href="http://www.cgv.co.kr/theaters/?theaterCode=0056" target="_blank" onmousedown="javascript:logClick('SUMMARY/극장상세보기');" title="CGV 강남">CGV 강남 &gt; </a></span>
						</div>
						<div class="row date" style="display: block;">
							<span class="header">일시</span>
							<span class="data" title="2018.1.23(화) 23:30">2018.1.23(화) 23:30</span>
						</div>
						<div class="row screen" style="display: block;">
							<span class="header">상영관</span>
							<span class="data" title="3관 8층">3관 8층</span>
						</div>
						<div class="row number" style="display: block;">
							<span class="header">인원</span>
							<span class="data"></span>
						</div>
						<div class="placeholder" title="극장선택" style="display: none;"></div>
					</div>
					<div class="info seat">
						<div class="row seat_name">
							<span class="header">좌석명</span>
							<span class="data">일반석</span>
						</div>
						<div class="row seat_no colspan3">
							<span class="header">좌석번호</span>
							<span class="data ellipsis-line3"></span>
						</div>
						<div class="placeholder" title="좌석선택"></div>
					</div>
					<div class="info payment-ticket">
						<div class="row payment-adult">
							<span class="header">일반</span>
							<span class="data"><span class="price"></span>원 x <span class="quantity"></span></span>
						</div>
						<div class="row payment-youth">
							<span class="header">청소년</span>
							<span class="data"><span class="price"></span>원 x <span class="quantity"></span></span>
						</div>
						<div class="row payment-child">
							<span class="header">어린이</span>
							<span class="data"><span class="price"></span>원 x <span class="quantity"></span></span>
						</div>						
						<div class="row payment-special">
							<span class="header">우대</span>
							<span class="data"><span class="price"></span>원 x <span class="quantity"></span></span>
						</div>
						<div class="row payment-final">
							<span class="header">총금액</span>
							<span class="data"><span class="price">0</span><span class="won">원</span></span>
						</div>
					</div>
					<div class="info path">
						<div class="row colspan4">
							<span class="path-step2" title="좌석선택">&nbsp;</span>
							<span class="path-step3" title="결제">&nbsp;</span>
						</div>
					</div>
					btn-right
					<div class="tnb_step_btn_right_before" id="tnb_step_btn_right_before"></div>
					<a class="btn-right on" id="tnb_step_btn_right" href="#" onclick="OnTnbRightClick(); return false;" title="좌석선택">다음단계로 이동 - 레이어로 서비스 되기 때문에 가상커서를 해지(Ctrl+Shift+F12)한 후 사용합니다.</a>
				</div>
			</div>
			</div> -->
		</div>
	</div>
   
   <!-- ////////////////////////////////////////// -->
   
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
					<a href="#" class="area"  title="서울" onclick="return false;" style="background-color: red;">서울</a>
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
				<c:forEach items="${areaList }" var="area">
					<li>
						<a href="#" class="area"  title="${area }" onclick="return false;">${area}</a>
					</li>
				
				</c:forEach>

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
			<input type="text" id="movie_num" name="movie_num" value="${movie_num }">
			<input type="text" id="areaName" name="areaName" value="${areaName }">
			<input type="text" id="theater_num" name="theater_num" value="${theater_num }">
			<input type="text" id="day_num" name="day_num" value="${day_num }">
			<input type="text" id="schedule_num" name="schedule_num" value="${schedule_num }">
		</form>
	</div>
	

			<!-- 내용 끝 -->
			</div>
			</div>
			<!-- ///////////////////////////////// -->
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	</div>
	
</body>
</html>