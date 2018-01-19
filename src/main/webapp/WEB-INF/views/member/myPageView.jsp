<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/headerBar.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/member/myPageView.css">

<title>MY CNEMA HOME</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

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
                                <a href="#">회원서비스</a>
                            </li>
                            <li class="last">
                            	마이페이지
                            </li>
                    	</ul>
                	</div>
            	</div>
        	</div>
        	<!-- 상단바 끝 -->
        	
        	
        	<!-- 내용 시작 -->
        	
        	<!-- //////////////////////////////////////////// -->
        	
        	<div id="contents" class="">
            
            <!-- Contents Start -->

			<div class="sect-common">
    			<div class="mycgv-info-wrap">
					<div class="skipnaiv">
						<a href="#" id="skipPersoninfo">개인화영역 건너띄기</a>
					</div>
       				<div class="sect-person-info">
        				<h2 class="hidden">개인화 영역</h2> 
        					<div class="box-image">
								<span class="thumb-image">
									<img src="${pageContext.request.contextPath }/resources/images/myPageView/default_profile.gif" alt="프로필 사진">
									<span class="profile-mask"></span>
								</span>
        					</div>
        					<div class="box-contents newtype">
				        		<div class="person-info">
				        			<strong>${myInfo.name}님</strong>
				        			<em>${myInfo.id}</em>
				        			
				        		</div>
        					<div class="grade-info">
	        					<c:set var="now" value="<%=new java.util.Date()%>" />
								<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy년MM월dd일" /></c:set> 
                    			<p style="margin-bottom:4px;color: #342929;font-family: 'NanumBarunGothicBold', '맑은 고딕', '돋움', Dotum, sans-serif;font-size: 20px;line-height: 20px;">
                         			 고객님은 <c:out value="${sysYear}" /> 
                         			<strong class="txt-purple">
                         			<c:if test="${myInfo.type eq 10}">
                         				일반 회원
                         			</c:if>
                         			<c:if test="${myInfo.type eq 20}">
                         				관리자
                         			</c:if>
                         			<c:if test="${myInfo.type eq 11}">
                         				VIP 회원
                         			</c:if>
                         			</strong>입니다.             
                   			 	</p>
        						
                    			<div class="mycgv_btn_special2">
                       				<h5 class="special_tit">SPECIAL MEMBERSHIP</h5><!-- special_tit (X) -->
				    			</div>
			        		</div>
			        	</div>
			        </div>
        			<div class="cols-benefit-info">
			        	<div class="col-my-coupon">
			        		<h3>MY COUPON</h3>
			        		<ul>
			        			<li>
			        				<strong>VIP쿠폰</strong>
			        				<span><em>7</em> 개</span>
			        			</li>
			        			<li>
			        				<strong>CGV 할인쿠폰</strong>
			        				<span><em>0</em> 개</span>
			        			</li>
			        			<li>
			        				<strong>영화관람권</strong>
			        				<span><em>0</em> 개</span>
			        			</li>
			        		</ul>
			        	</div>
			                <div class="col-one-point">
			               	<h3>CJ ONE POINT</h3>
			        		<a href="#">CJ ONE POINT 더보기</a>
			        		<ul>
			        			<li>
			        				<strong>사용가능 포인트</strong>
			        				<span><em class="txt-maroon">${myInfo.v_point}</em> 점</span>
			        			</li>
			        		    <li class="tooltip_list cf">
			        				<strong>누적 포인트</strong>
			
			                        <div class="tooltip_con tc2"><span></span></div>
			        				<span><em><fmt:formatNumber value="${myInfo.a_point}" type="number"/></em> 점</span>
			        			</li>
			        		</ul>
			        	</div>
			        	<div class="col-favorite-theater">
			        		<h3 class="hidden">자주가는 CGV</h3>
				    		<div class="sect-favorite">
					            <ul id="favoriteTheaters"><!-- ////////////////// -->
			                            <li><a href="#"><span>1<em>순위</em></span>CGV북수원</a></li>
			                            <li><a href="#"><span>2<em>순위</em></span>CGV수원</a></li>
			                            <li><a href="#"><span>3<em>순위</em></span>CGV시흥</a></li>
			                            <li><a href="#"><span>4<em>순위</em></span></a></li>
			                            <li><a href="#"><span>5<em>순위</em></span></a></li>
					            </ul>
					            <button id="btn_set_my_favorite" title="새창" type="button" class="setting">자주가는 극장<br>설정하기</button><!-- ///// -->
					        </div>
				        </div>
			          
			        </div>
			    </div>
			</div>

			<div class="cols-content" id="menu">
    			<div class="col-aside">
					<div class="skipnaiv">
						<a href="#" id="skipMycgvMenu">MYCGV 서브메뉴 건너띄기</a><!-- /////////// -->
					</div>
	    			<h2>MY CGV 서브메뉴</h2>
	    			<div class="snb">
	       			<ul>
	            	<li class="on">
	            		<a href="#" title="현재 선택">MY CNEMA HOME <i></i></a>
	            	</li>
	            	<li>
	            		<a href="#">나의 예매내역 <i></i></a>
	            			<ul>                      
		                        <li><a href="../myPage/movieHistory">내가 본 영화</a></li>
			                    <li><a href="../myPage/wishList">위시 리스트</a></li>
	                        </ul>
                	</li>
	            	<li>
	                	<a href="#">나의 쿠폰 관리 <i></i></a>
	                	<ul>                      
	                        <li><a href="../myPage/couponHistory">나의 쿠폰</a></li>
		                    <!-- <li><a href="#">영화관람권</a></li> -->
	                	</ul>
	           		</li>
	            	<li>
                    	<a href="#">나의 포인트 관리 <i></i></a>
	                	<ul>
	                    	<!-- <li><a href="#">매점이용 포인트 적립</a></li> -->
                        	<li><a href="../myPage/pointHistory">포인트 적립/사용내역</a></li>
	                	</ul>
	            	</li>

	            	<li>
                    	<a href="#">회원정보<i></i></a>
	                	<ul>
                        	<li><a href="../myPage/myInfoCheck">회원정보수정</a></li>
	                    	<!-- <li><a href="#">프로필관리</a></li> -->
	                    	<li><a href="../myPage/withdrawalCheck">회원탈퇴</a></li>
	                	</ul>
	            	</li>
		            <li>
	                    <a href="#">나의 문의내역 <i></i></a>
		                <ul>
		                    <li><a href="#">1:1 문의</a></li>
		                </ul>
		            </li>
		            <c:if test="${!empty member and member.type eq 20 }">
		            <li>
	                    <a href="#">관리자 <i></i></a>
		                <ul>
		                    <li><a href="../admin/movieList">무비 리스트</a></li>
		                    <li><a href="../admin/theaterList">극장 리스트</a></li>
		                    <li><a href="../admin/screenInsert">상영관 리스트</a></li>
		                    <li><a href="../admin/scheduleList">상영 리스트</a></li>
		                    <li><a href="../admin/couponList">쿠폰 리스트</a></li>
		                    <li><a href="../admin/memberList?group_num=-1">회원 리스트</a></li>
		                </ul>
		            </li>
		            
		            </c:if>
	        		</ul>
	    			</div>
    			</div>
			<div class="col-detail" id="mycgv_contents">
			<!-- /////// -->
			<div class="sect-mycgv-part">
			<div class="box-polaroid type1">
				<div class="box-inner">
		            <div class="tit-mycgv">
						<h3>MY 예매내역</h3>
						<p><em>2건</em> <a href="#">MY 예매내역 더보기</a></p>
					</div>
					<div class="col-myqna">
						<ul>
			                <li>
								<em>년월일</em>
								<a href="#"><strong>영화제목</strong></a>
								<span>
									지점
			                    </span>
							</li>
			                <li>
								<em>년월일</em>
								<a href="#"><strong>영화제목</strong></a>
								<span>
									지점
			                    </span>
							</li>
						</ul>
					</div>
		        </div>
		     </div>
		     </div>
		     <div style="margin-top: 30px;"></div>
		     <div class="sect-mycgv-part">
			 <div class="box-polaroid type1">
				<div class="box-inner">
		            <div class="tit-mycgv">
						<h3>MY Q&amp;A</h3>
						<p><em>2건</em> <a href="#">MY Q&amp;A 더보기</a></p>
					</div>
					<div class="col-myqna">
						<ul>
			                <li>
								<em>제안(문의유형)</em>
								<a href="#"><strong>제목</strong></a>
								<span>
									접수완료
			                    </span>
							</li>
			                <li>
								<em>제안</em>
								<a href="#">
				                <strong>1</strong>
				                </a>
								<span> 
									접수완료
				                </span>
							</li>
						</ul>
					</div>
		        </div>
		    </div>
		    </div>
			<!-- 내용에 따라 달라짐 -->
				
			</div>
		</div>
		</div>
        	
        	
        	<!-- /////////////////////////////////////////// -->
        	
			<%-- <h1>My Page</h1>
				<!-- 나의 정보 -->
				${myInfo.name}님  ${myInfo.id}<br>
				고객님은 sysdate ${myInfo.type}입니다.<br>
				
				<!-- 나의 포인트 -->
				CJ ONE 사용가능 포인트   ${myInfo.v_point}점<br>
				CJ ONE 누적 포인트 ${myInfo.a_point}점<br>
				
				<!-- 쿠폰내역 -->
				<h3>나의 쿠폰</h3>
				금액 할인 :
				할인률 :
				
				<!-- 나의 예매 내역 -->
				<h3>내가 본 영화</h3>
				<a href="../myPage/movieHistory">내가 본 영화</a>
				<h3>위시 리스트</h3>
				<a href="../myPage/wishList">위시 리스트</a>
				
				<!-- 쿠폰 및 포인트 사용 -->
				<h3>Point 내역</h3>
				<a href="../myPage/pointHistory">Point 내역</a>
				<h3>나의 쿠폰</h3>
				<a href="../myPage/couponHistory">나의 쿠폰</a>
			
				<!-- 정보 수정 -->
				<h3>정보 수정</h3>
				<a href="../myPage/myInfoCheck">정보 수정</a>
				<h3>회원 탈퇴</h3>
				<a href="../myPage/withdrawalCheck">회원 탈퇴</a>
				
				<!-- 나의 문의내역 -->
				<h3>나의 문의 내역</h3>
				<a href="">나의 문의 내역</a>
				
				<!-- Admin -->
				<h1>관리자</h1>
				<h3>무비 리스트</h3>
				<a href="../admin/movieList">무비 리스트</a>
				<h3>극장목록</h3>
				<a href="../admin/theaterList">극장 목록</a>
				<h3>상영시간표 </h3>
				<a href="../admin/scheduleList">상영시간표</a>
				<h3>회원 목록</h3>
				<a href="../admin/memberList">회원 목록</a>--%>
				
			<!-- 내용 끝 -->
			
			
			</div>
			<!-- ///////////////////////////////// -->
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	</div>
>>>>>>> 13adbde401e325d0d2219646807313c92dd2d67b
</body>
</html>