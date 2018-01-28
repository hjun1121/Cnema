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

    <link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/reset.css">
    <link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/layout.css">
    <link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/module.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		var area = '${areaName}';
		var location = '${theater_num}';
		
		$(".areas").each(function(){
			 if($(this).attr("title") == area) {
				$(this).css("background-color","#e87676");
				$(this).css("border-radius","60%");
			 }
		});
		
	 	$(".location").each(function(){
			 if($(this).attr("title") == location) {
				 $(this).css("background-color","red");
			 }
		}); 
		
		$(".areas").click(function(){
			$(".areas").css("background-color","");
			$(this).css("background-color","#e87676");
			$(this).css("border-radius","60%");
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
/* li{
	float: left; 
	margin-left: 5px;
} */
</style>
</head>
<body>
	<div id="cgvwrap">
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/header.jsp"></c:import>
			<!-- //////////////////////////////// -->
			<div id="contaniner" class="bg-bricks">
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
                            	상영시간표
                            </li>
                    	</ul>
                	</div>
            	</div>
        	</div>
        	<!-- 상단바 끝 -->
        	
        	<!-- 내용시작 -->
  
<!-- //////////////////////////// -->
<div id="contents" >
	<div class="sect-common"> 
    	<div class="favorite-wrap">
        	<h3 class="hidden">극장별 상영시간표</h3>
        	<div class="sect-city">
      			<div class="area" style="margin-left: 61px; margin-top: 30px;">
        			<ul>
        			<c:forEach items="${areaList }" var="DTO" varStatus="count">
	        			<li>
	        				<a href="#" class="areas" onclick="return false;" title="${DTO.area }">${DTO.area }</a>
	        			</li>
        			</c:forEach>
	        		</ul>
    			</div>
	        				
				<div id="locationList" style="margin-top: 60px;">
      					<ul>
						<c:forEach items="${locationList }" var="DTO">
       						<li>
       							<a href="#" onclick="return false;" class="location time" title="${DTO.theater_num }">${DTO.location }</a>
       						</li>
       						
       					</c:forEach>
      					</ul>
     			</div>
        	</div>
    	</div>
	</div>
	<div class="cols-content">
    	<h4 class="tit-showtime">CGV강남</h4>
    	<div class="col-detail"> 
			<div class="showtimes-wrap">
        		<div class="sect-schedule">
            		<div id="slider" class="slider">
                        <div class="item-wrap">
                        	<ul class="item" style="width: 800px; height: 108px;">
                        		<li>
                            		<div class="day">
                                		<a href="#">
                                    		<span>01월</span> <em>토</em> <strong>27</strong>
                                		</a>
                            		</div>
                        		</li>
                        		<li class="on">
                            		<div class="day">
                                		<a href="#" title="현재 선택">
                                    		<span>01월</span> <em> 일</em> <strong>28</strong>
                                		</a>
                            		</div>
                        		</li>
                        		<li>
                            		<div class="day">
                                		<a href="#">
                                    		<span>01월</span> <em>월</em> <strong>29</strong>
                                		</a>
                            		</div>
                        		</li>
                        	</ul>
                        </div>
                		<button type="button" class="btn-prev">이전 날자보기</button>
                		<button type="button" class="btn-next">다음 날자보기</button>
            			</div>
        			</div>
        			<div class="sect-guide">
            			<div class="descri-timezone">
                			<p>* 시간을 클릭하시면 빠른 예매를 하실 수 있습니다.</p>
            			</div>
        			</div>
        			<div class="sect-showtimes">
            			<ul>
                        	<li>
                            	<div class="col-times">
                                	<div class="info-movie">
                                    	<span class="ico-grade grade-12">12세 이상</span> 
                                    	<a href="#"><strong>신과함께-죄와 벌</strong></a>
                                    	<i>드라마,&nbsp;환타지</i>/ <i>139분</i>/ <i>2017.12.20개봉</i>
                                	</div>
                                    <div class="type-hall">
                                    	<div class="info-hall">
                                         	<ul>
                                            	<li>2D</li>
                                                <li>2관 6층</li>
                                                <li>총124석</li>
                                            </ul>
                                         </div>
                                         <div class="info-timetable">
                                         	<ul>
                                            	<li>
                                            		<a href="#">
                                            		<em>27:30</em>
                                            		<span class="midnight txt-lightblue">
                                            			<span class="hidden">잔여좌석</span>113석
                                            		</span>
                                            		</a>
                                            	</li>
                                            </ul>
                                         </div>
                                     </div>
                                     <div class="type-hall">
                                     	<div class="info-hall">
                                        	<ul>
                                            	<li>2D</li>
                                                <li>6관 10층</li>
                                                <li>총124석</li>
                                            </ul>
                                         </div>
                                         <div class="info-timetable">
                                         	<ul>
                                            	<li>
                                            		<a href="#">
                                            			<em>08:00</em>
                                            			<span class="early txt-lightblue">
                                            				<span class="hidden">잔여좌석</span>89석
                                            			</span>
                                            		</a>
                                            	</li>
                                                <li>
                                                	<a href="#">
                                               			<em>13:20</em>
                                               			<span class="txt-lightblue">
                                               				<span class="hidden">잔여좌석</span>18석
                                               			</span>
                                               		</a>
                                               	</li>
                                                <li>
                                                	<a href="#">
                                                		<em>21:50</em>
                                                		<span class="txt-lightblue">
                                                			<span class="hidden">잔여좌석</span>98석
                                                		</span>
                                                	</a>
                                                </li>
                                             </ul>
                                         </div>
                                      </div>
                            		</div>
                       		 	</li>
           					 </ul>
        				</div>
        			<p class="info-noti"></p>
    			</div>   
    		</div>
		</div>
 

            <!--/ Contents End -->

		</div>
<!-- //////////////////////////// -->
<%--   
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
</div> --%>

<form action="../theater/scheduleList" id="frm" name="frm" method="get">
	<input type="text" id="movie_num" name="movie_num">
	<input type="text" id="areaN" name="areaName" value="${areaName }">
	<input type="text" id="locationN" name="theater_num" value="${theater_num }">
	<input type="text" id="dayN" name="day_num" value="${dayList[0].day_num }">
	<input type="text" id="schedule_num" name="schedule_num">
</form>




			<!-- 내용 끝 -->
			</div>
			<!-- ///////////////////////////////// -->
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	</div>
</body>
</html>