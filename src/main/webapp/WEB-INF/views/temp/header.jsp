<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
	<!-- Header -->
	
	<script type="text/javascript">
	
		$(function(){
			$(".headbtn").mouseenter(function(){
				var a = $(this).attr("title");  //booking
				$(this).attr("class", a+" on");
			})
			$(".headbtn").mouseleave(function(){
				var a = $(this).attr("title");  //booking
				$(this).attr("class", a);
			})
		});
		
	</script>
	
	<div id="header">
		<div class="head">
			<h1><a href="${pageContext.request.contextPath }/"><img src="${pageContext.request.contextPath }/resources/images/common/title/CnemaLogo.png" alt="CNEMA"></a></h1>
			<div class="sect-service">
				<h2>서비스 메뉴</h2>
				<ul class="util">
					<li><a href="#" class="like" target="_blank" title="Facebook 좋아요! 새창"><span>Facebook 좋아요!</span></a></li>
				    <li><a href="#" class="insta" target="_blank" title="Instagram Follow"><span>Instagram Follow</span></a></li>
                	
				</ul>
				<ul class="gnb">
				<c:if test="${empty member }">
                    <li><a href="${pageContext.request.contextPath }/member/memberLogin"  class="login" >로그인</a></li>
					<li><a href="${pageContext.request.contextPath }/member/joinAgree" class="join">회원가입</a></li>
				</c:if>
				<c:if test="${!empty member }">
					<li><a href="${pageContext.request.contextPath }/member/memberLogout" class="join">로그아웃</a></li>
					<li><a href="${pageContext.request.contextPath }/member/myPageView" class="myPage">마이페이지</a></li>
				</c:if>
					<li><a href="#" class="vip">찾아오시는 길</a></li>
				</ul>
			</div>
            
            <div class="im-wrap"> 
            <!-- Important wrap -->
				<h2><img src="${pageContext.request.contextPath }/resources/images/common/title/h2_cultureplex.png" alt="CULTUREPLEX"></h2>
				<div class="lnb">
					<h2>CGV 주메뉴</h2>
					<ul id="gnb_list">
						<li class="movie headbtn" title="movie headbtn"><a href="${pageContext.request.contextPath}/movie/movie_chart">영화</a>
							<div class="sub-wrap">
								<i></i>
								<div class="smenu">
									<ul>
										<li><a href="${pageContext.request.contextPath}/movie/movie_chart">무비차트</a></li>
										<li><a href="${pageContext.request.contextPath}/community/pageInsert">페이지생성</a></li>
										<li class="last"><a href="${pageContext.request.contextPath}/community/communityMain">씨네마그램</a></li>
									</ul>
								</div>
							</div>
						</li>
						<li class="booking headbtn" title="booking headbtn"><a href="${pageContext.request.contextPath}/theater/quickReserve">예매</a>
							<div class="sub-wrap">
								<i></i>
								<div class="smenu">
									<ul>
										<li><a href="${pageContext.request.contextPath}/theater/quickReserve">빠른예매</a></li>
										<li><a href="${pageContext.request.contextPath}/theater/scheduleList">상영시간표</a></li>
									</ul>
								</div>
							</div>
						</li>
						<li class="theaters headbtn" title="theaters headbtn"><a href="#">극장</a>
							<div class="sub-wrap">
								<i></i>
								<div class="smenu">
									<ul>
										<li><a href="#">CGV 극장</a></li>
										<li><a href="#">특별관</a></li>
										<li class="last"><a href="#" title="새창" class="specialclub">Club서비스</a></li>
									</ul>
								</div>
							</div>
						</li>

                        <li class="culture headbtn" title="culture headbtn"><a href="${pageContext.request.contextPath}/board/park">이벤트&amp;컬쳐</a>
							<div class="sub-wrap">
								<i></i>
								<!-- <div class="smenu">
									<ul>
										<li><a href="#">이벤트</a></li>
										<li><a href="#">티켓·팝콘스토어</a></li>
										<li><a href="#">매거진</a></li>
									</ul>
								</div> -->
							</div>
						</li>
<!-- 						씨네마그램 -->
<%--                         <li class="culture headbtn" title="culture headbtn"><a href="${pageContext.request.contextPath}/community/communityMain">CnemaGram</a> --%>
					</ul>
				</div>
			</div>
		</div>
   
        <!-- 띄움 -->
        <!-- <div id="ctl00_sect_txt_banner" class="sect_txt_banner">
            <div class="inner">
            </div>
        </div> -->
		<!-- 띄움 -->
		
	</div>
	<!-- /Header -->

