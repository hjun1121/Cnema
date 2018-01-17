<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/headerBar.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/myPage/movieHistory.css">
<link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/content_prepaid_card_170421.css">
<link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/module.css">
    <link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/reset.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>나의 예매 내역</title>
<script type="text/javascript">
$(function(){
	var kind='${kind}';
	$(".kind").each(function(){
		if($(this).val()==kind){
			$(this).attr("selected",true);
		}
	});
	$("#date_search").click(function(){
		var sKind = $("#kind").val();
		location.href="./movieHistory?kind="+sKind;
	});
	$(".reviewBtn").click(function(){
		var movie_num = $(this).attr("title");
		window.open("movieReview?movie_num="+movie_num,"평점작성","width=800,height=700,toolbar=no");
	});
});
</script>
</head>
<body>
<div id="cgvwrap">
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/header.jsp"></c:import>

			<!-- //////////////////////////////// -->
			
			<div id="contaniner" class="bg-bricks main bg-bricks">
        	<!-- 상단바 시작 -->
        	<div class="linemap-wrap">
           		<div class="sect-linemap">
                	<div class="sect-bcrumb">
                    	<ul>
                        	<li>
                        		<a href="#"><img alt="home" src="${pageContext.request.contextPath }/resources/images/common/btn/btn_home.png"></a>
                        	</li>
                            <li>
                                <a href="#">회원정보</a>
                            </li>
                            <li class="last">
                            	내가 본 영화
                            </li>
                    	</ul>
                	</div>
            	</div>
        	</div>
        	<!-- 상단바 끝 -->
        	
        	
        	<!-- 내용 시작 -->
        	<div id="contents" class="">
            
            <!-- Contents Start -->
			
				<div class="cols-content">
				<div class="col-aside">
					<h2>프로필 및 서브메뉴</h2>
					<div class="box-round-dgray">
				        <div class="box-round-inner">
				            <div class="inner-contents-profile">
				                <div class="box-image">
				                	<div class="thumb-image">
				                        <img src="${pageContext.request.contextPath }/resources/images/myPageView/default_profile.gif">
				                        <span class="profile-mask"></span>
				                    </div>
				                </div>
				                <div class="box-contents">
					        		<strong>${member.name }님</strong>
					        		<em></em>
						        </div>
				            </div>
				        </div>
				    </div>
				    <div class="box-round-wgray">
				        <div class="box-round-inner">
				            <div class="inner-contents-log">
				                <a href="#">
				                    <em>${fn:length(wList)}</em>
				                    <strong>위시리스트</strong>
				                </a>
				            </div>
				        </div>
				    </div>
				    <div class="box-round-on">
				        <div class="box-round-inner">
				            <div class="inner-contents-log">
				                <a href="#">
				                    <em>${fn:length(rList)}</em>
				                    <strong>내가 본 영화</strong>
				                </a>
				            </div>
				        </div>
				    </div>
				</div>
					<div class="col-detail">
					    
					<div class="movielog-detail-wrap">
            		<form id="movieHistory" method="POST">
	            		<div class="tit-mycgv">
				            <h3>내가 본 영화</h3>
				            <p><em>${fn:length(rList)}건</em></p>
				            <div class="set-combo">
				                <label for="year">내가 본 영화 년도별 정렬</label>
				                <select id="kind" name="year">
				                    <option class = "kind" value="" selected="selected">전체</option>
		                            <option class = "kind" value="2014">2014</option>
		                            <option class = "kind" value="2015">2015</option>
		                            <option class = "kind" value="2016">2016</option>
		                            <option class = "kind" value="2017">2017</option>
		                            <option class = "kind" value="2018">2018</option>
				                </select>
				                <button id="date_search" class="round gray"><span>GO</span></button>
				            </div>
				        </div>
            		</form>
		    		<div class="sect-movielog-lst">
			    		<ul>
			    		<c:forEach items="${rList}" var="reserveList" varStatus="count">
			    		
			    		<c:if test="${count.first }">
			    		
			    		
			    		<input type="hidden" id="movie_num" name="movie_num" value="${reserveList.movieDTO.movie_num }">
                            <li class="movie_info_78316">
                                <div class="article-movie-info">
				            		<div class="box-image"> 
				                    	    <a href="#">
				                        	<span class="thumb-image"> 
				                                <img alt='${reserveList.movieDTO.movie_name}' src='${pageContext.request.contextPath }/resources/movie_poster/${reserveList.movieDTO.fileName}'>
                                                <span class="ico-grade grade-15">15세 이상</span>
                                                    <i></i>
				                            </span> 
				                        </a> 
				                    </div>
				                    <div class="box-contents">
				                    	<div class="title"> 
				                        	<a href="../movie/movie_view?movie_num=${reserveList.movieDTO.movie_num }">
                                                <strong>${reserveList.movieDTO.movie_name}</strong>
                                            </a>
                                            <p>예약번호: ${reserveList.reserve_num}</p>
				                        </div>
                                        <p class="date"> ${reserveList.scheduleDTO.day} / ${reserveList.scheduleDTO.in_time } ~ ${reserveList.scheduleDTO.out_time }</p>
				                        <p class="theater">${reserveList.theater_num } / ${reserveList.ticketPriceDTO.people}명</p>
                                        <ul class="writerinfo">                                        
	                                        <li class="writer-opinion">
	                                        	<input type="button" class="reviewBtn" title="${reserveList.movieDTO.movie_num }" value="이 영화를 평가해 주세요">
                                            </li>
                                        </ul>
				                    </div>
				                   
				                    <button class="btn-del">
				                    	<img src="${pageContext.request.contextPath }/resources/images/common/btn/btn_del.gif" alt="삭제">
				                    </button>
				                </div>
			                </li>
						</c:if>			                
			            </c:forEach>
			    		</ul> 
		    		</div>
		    		
	    			</div>
					</div>
				</div>
			</div>
        	
        	<!-- ///////////////// -->
	<%-- <h3>나의 예매 내역${fn:length(rList)}건</h3> 
	<form action="movieHistory" method="POST">
		<div>
			<select id="kind">
				<option class = "kind" value="2013">2013</option>
				<option class = "kind" value="2014">2014</option>
				<option class = "kind" value="2015">2015</option>
				<option class = "kind" value="2016">2016</option>
				<option class = "kind" value="2017">2017</option>
				<option class = "kind" value="2018" selected="selected">2018</option>
			</select>
			<input type="button" id="date_search" value="GO">
		</div>
		<c:forEach items="${rList}" var="reserveList">
			<input type="hidden" id="movie_num" name="movie_num" value="${reserveList.movieDTO.movie_num }">
			<input type="text" id="reserve_num" name="reserve_num" value='${reserveList.reserve_num}'>
			사진 : <img alt='${reserveList.movieDTO.movie_name}' src='${pageContext.request.contextPath }/resources/movie_poster/${reserveList.movieDTO.fileName}'><br>
			<a href="../movie/movie_view?movie_num=${reserveList.movieDTO.movie_num }">영화명: ${reserveList.movieDTO.movie_name}<br></a>
			날짜 : ${reserveList.scheduleDTO.day}<br>
			시간 :<input type="text" id="in_time" name="in_time" value="${reserveList.scheduleDTO.in_time }">
			~<input type="text" id="out_time" name="out_time" value="${reserveList.scheduleDTO.out_time }"><br>
			지점 : ${reserveList.theater_num }<br>
			상영관 번호 : ${reserveList.screen_num }<br>
			몇명 : ${reserveList.ticketPriceDTO.people}<br>
			<button>x</button><br>
			<input type="button" class="reviewBtn" title="${reserveList.movieDTO.movie_num }" value="이 영화를 평가해 주세요"><br>
			------ <br>
		</c:forEach>
	</form> --%>
	<!-- 내용 끝 -->
			</div>
			<!-- ///////////////////////////////// -->
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	</div>
</body>
</html>