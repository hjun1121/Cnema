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
		window.open("movieReview?movie_num="+movie_num,"평점작성","width=720,height=394,toolbar=no");
	});
	$(".reSeeBtn").click(function(){
		var movie_num = $(this).attr("title");
		window.open("movieReviewView?movie_num="+movie_num,"평점보기","width=811,height=320,toolbar=no");
	});
	$(".btn-del").click(function(){
		var tp_num = $(this).attr("title");
		location.href="./movieRemove?tp_num="+tp_num;
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
        	<div id="contents">
            
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
				                <a href="../myPage/wishList">
				                    <em>${wishLeftbar}</em>
				                    <strong>위시리스트</strong>
				                </a>
				            </div>
				        </div>
				    </div>
				    <div class="box-round-on">
				        <div class="box-round-inner">
				            <div class="inner-contents-log">
				                <a href="../myPage/movieHistory">
				                    <em>${reserveLeftbar }</em>
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
				            <%-- <p><em>${fn:length(rList)}건</em></p> --%>
				            <div class="set-combo">
				                <label for="year">내가 본 영화 년도별 정렬</label>
				                <select id="kind" name="year">
				                    <option class = "kind" value="0000" selected="selected">전체</option>
		                            <option class = "kind" value="2014">2014</option>
		                            <option class = "kind" value="2015">2015</option>
		                            <option class = "kind" value="2016">2016</option>
		                            <option class = "kind" value="2017">2017</option>
		                            <option class = "kind" value="2018">2018</option>
				                </select>
				                <button type="button" id="date_search" class="round gray"><span>GO</span></button>
				            </div>
				        </div>
            		
		    		<div class="sect-movielog-lst">
			    		<ul>
			    		<c:forEach items="${rList}" var="reserveList" varStatus="count">
			    		<input type="hidden" id="movie_num" name="movie_num" value="${reserveList.movieDTO.movie_num }">
			    		<input type="hidden" id="tp_num" name="tp_num" value="${reserveList.tp_num }">
                            <li class="movie_info_78316">
                                <div class="article-movie-info" style="margin-bottom: 15px;">
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
				                        </div>
                                        <p class="date"> ${reserveList.scheduleDTO.day} / ${reserveList.scheduleDTO.in_time } ~ ${reserveList.scheduleDTO.out_time }</p>
				                        <p class="theater">CGV${reserveList.theaterDTO.location } ${reserveList.screenDTO.room_num }관/ ${reserveList.ticketPriceDTO.people}명</p>
                                        <ul class="writerinfo">              
                                        	<c:if test="${reserveList.count eq 0 }">                        
	                                        <li class="writer-opinion">
	                                        	<input type="button" style="line-height: 23px; font-family: 'NanumBarunGothicBold'; text-align: center;  vertical-align: middle; border: 2px solid #7b7b7b; color: #7b7b7b; padding: 3px;" class="reviewBtn" title="${reserveList.movieDTO.movie_num }" value="이 영화를 평가해 주세요">
                                            </li>
                                            </c:if>
                                            <c:if test="${reserveList.count ne 0 }">  
                                            	<c:if test="${reserveList.reviewDTO.r_type eq 10}">                      
			                                        <li class="writer-opinion">
			                                        	<input type="button" style="line-height: 23px; font-family: 'NanumBarunGothicBold'; text-align: center;  vertical-align: middle; border: 2px solid #7b7b7b; color: #7b7b7b; padding: 3px;" class="reSeeBtn" title="${reserveList.movieDTO.movie_num }" value="평가 완료">
		                                            </li>
                                          	 	</c:if>
	                                          	<c:if test="${reserveList.reviewDTO.r_type eq 11}">                      
				                                        <li class="writer-opinion">
				                                        	<input type="button"  style="line-height: 23px; font-family: 'NanumBarunGothicBold'; text-align: center;  vertical-align: middle; border: 2px solid #7b7b7b; color: #7b7b7b; padding: 3px;" class="reSeeBtn" title="${reserveList.movieDTO.movie_num }" value="평가 삭제하셨습니다">
			                                            </li>
	                                          	</c:if>
                                            </c:if>  
                                        </ul>
				                    </div>
				                   
				                    <button class="btn-del" title="${reserveList.tp_num }" type="button">
				                    	<img src="${pageContext.request.contextPath }/resources/images/common/btn/btn_del.gif" alt="삭제">
				                    </button>
				                </div>
			                </li>
			            </c:forEach>
			    		</ul> 
		    		</div>
		    		</form>
		    		 <div class="paging">
						<ul id="paging_point" style="text-align: center;">
						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							<li style="text-decoration: none; display: inline-block; padding: 0 8px; color: #333333; font-family: Verdana, Geneva, sans-serif; font-size: 14px; font-weight: bold; line-height: 28px;" class=" on">
								<a href="movieHistory?curPage=${i}&testDatepicker1=${testDatepicker1}&testDatepicker2=${testDatepicker2}" title="${i}페이지 선택">${i}</a>
							</li>
						</c:forEach>
						<c:if test="${pager.curBlock lt pager.totalBlock}">
							<li class="paging-side">
								<a href="movieHistory?curPage=${pager.lastNum+1}&testDatepicker1=${testDatepicker1}&testDatepicker2=${testDatepicker2}"><button style="line-height: 26px; color: inherit; text-decoration: none;margin-top: 30px;" class="btn-paging next" type="button">다음</button></a>
							</li>
						</c:if>
						</ul>
					</div>
	    			</div>
					</div>
				</div>
				</div>
			</div>
			<!-- ///////////////////////////////// -->
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	</div>
</body>
</html>