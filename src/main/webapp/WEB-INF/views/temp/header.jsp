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

			$("#tab1").click(function(){
				location.href="${pageContext.request.contextPath}/movie/movie_chart";
			});
			$("#tab2").click(function(){
				location.href="${pageContext.request.contextPath}/theater/quickReserve";
			});
			$("#tab3").click(function(){
				location.href="${pageContext.request.contextPath}/board/park";
			});
			$("#tab4").click(function(){
				location.href="${pageContext.request.contextPath}/community2/communityMain";
			});
			$("#page_insert").click(function() {
				window.open('${pageContext.request.contextPath}/community/pageInsert', '페이지생성', 'width=550,height=250');
			})
		});
		
	</script>
	
	<div id="header">
		<div class="head">
			<h1><a href="${pageContext.request.contextPath }/"><img src="${pageContext.request.contextPath }/resources/images/common/title/CnemaLogo.png" alt="CNEMA"></a></h1>
			<div class="sect-service">
				<h2>서비스 메뉴</h2>
				<ul class="util">
					<li><a href="https://www.facebook.com/Cnema-329387590895060" class="like" target="_blank" title="Facebook 좋아요! 새창"><span>Facebook 좋아요!</span></a></li>
				    <li><a href="http://instagram.com/hseong_" class="insta" target="_blank" title="Instagram Follow"><span>Instagram Follow</span></a></li>
                	
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
					<li><a href="${pageContext.request.contextPath }/common/map" class="vip">찾아오시는 길</a></li>
				</ul>
			</div>
            
            <div class="im-wrap"> 
            <!-- Important wrap -->
				<h2><img src="${pageContext.request.contextPath }/resources/images/common/title/h2_cultureplex.png" alt="CULTUREPLEX"></h2>
				<div class="lnb">
					<h2>CENEMA 주메뉴</h2>
					<ul id="gnb_list">
						<li class="movie headbtn" title="movie headbtn" style="font-size: 17px;width: 60px;font-family: -webkit-pictograph;font-weight: 900;">
						<span id="tab1" style="cursor: pointer;">영화</span>
							<div class="sub-wrap">
								<i></i>
								<div class="smenu">
									<ul>
										<li><a href="${pageContext.request.contextPath}/movie/movie_chart">무비차트</a></li>
									</ul>
								</div>
							</div>
						</li>
						<li class="booking headbtn" title="booking headbtn"style="font-size: 17px;width: 60px;font-family: -webkit-pictograph;font-weight: 900;">
							<span id="tab2" style="cursor: pointer;">예매</span>
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
						<li class="culture headbtn" title="culture headbtn"style="font-size: 17px;width: 60px;font-family: -webkit-pictograph;font-weight: 900;">
						<span id="tab3" style="cursor: pointer;">소식지</span>
							<div class="sub-wrap">
								<i></i>
								<div class="smenu">
									<ul>
										<li><a href="${pageContext.request.contextPath}/notice/noticeList">공지사항</a></li>
										<li><a href="${pageContext.request.contextPath}/event/eventList">이벤트</a></li>
										<li><a href="${pageContext.request.contextPath}/qna/qnaWrite">이메일문의</a></li>
										
									</ul>
								</div>
							</div>
						</li>
						<li class="theaters headbtn" title="theaters headbtn"style="font-size: 17px;font-family: -webkit-pictograph;font-weight: 900;">
						<span id="tab4" style="cursor: pointer;">씨네마그램</span>
							<div class="sub-wrap">
								<i></i>
								<div class="smenu">
									<ul>
										<li><a href="#">CGV 극장</a></li>
										<li><a href="#" id="page_insert" onclick="return false">페이지생성</a></li>
										<li class="last"><a href="${pageContext.request.contextPath}/community2/communityMain">씨네마그램</a></li>
									</ul>
								</div>
							</div>
						</li>
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

