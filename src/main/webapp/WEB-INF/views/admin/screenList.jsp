<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/headerBar.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/member/myPageView.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/myPage/myInfoCheck.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/myPage/myInfo.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/myPage/couponHistory.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>상영관 리스트</title>
<script type="text/javascript">
$(function(){
	$("#schBtn").click(function(){
		location.href="screenInsert?theater_num=-1";
	});
	$("#schBtn2").click(function(){
		var theater_num = $("#schBtn2").attr("title");
		location.href="screenInsert?theater_num="+theater_num;
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
                            <li>
                                <a href="#">관리자</a>
                            </li>
                            <li class="last">
                            	상영 시간표
                            </li>
                    	</ul>
                	</div>
            	</div>
        	</div>
        	<!-- 상단바 끝 -->
        	
        	
        	<!-- 내용 시작 -->
        	
        	
        	<div id="contents"><!-- ////////////////////////////////////////////////////////////////// -->
            
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
                    			<p style="margin-bottom:4px;color: #342929;font-family: 'NanumBarunGothicBold', '맑은 고딕', '돋움', Dotum, sans-serif;font-size: 20px;line-height: 20px;">
                         			 고객님은 ${today}
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
			        				<strong>전체 쿠폰</strong>
			        				<span><em>${count }</em> 개</span>
			        			</li>
			        			<li>
			        				<strong>사용 가능 쿠폰</strong>
			        				<span><em>${aCount }</em> 개</span>
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
	            	<li>
	            		<a href="../myPage/myPageView" title="현재 선택">MY CNEMA HOME <i></i></a>
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
	                	</ul>
	           		</li>
	            	<li>
                    	<a href="#">나의 포인트 관리 <i></i></a>
	                	<ul>
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
			            <li class="on">
		                    <a href="#">관리자 <i></i></a>
			                <ul>
			                    <li><a href="../admin/movieList">무비 리스트</a></li>
			                    <li><a href="../admin/theaterList">극장 리스트</a></li>
			                    <li class="on"><a href="../admin/screenList">상영관 리스트</a></li>
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
			
				<div class="tit-mycgv">
					<h3>상영관 리스트</h3>
				</div>
				<form id="form1" novalidate="novalidate">
				<div class="tit-mycgv" style="padding-bottom: 10px;">
					<h4>상영관 리스트 ${fn:length(sList)}개</h4>
				</div>
				<div class="tbl-data">
				    <table>
				        <caption></caption>
				        <colgroup>
						    <col width="20%">
						    <col width="20%">
						    <col width="20%">
						    <col width="20%">
						    <col width="20%">
						</colgroup>
				        <thead>
				            <tr>
				                <th scope="col">지역</th>
				                <th scope="col">극장</th>
				                <th scope="col">관</th>
				                <th scope="col">층</th>
				                <th scope="col">좌석수</th>
				            </tr>
				        </thead>
				        <tbody>
				       <c:if test="${fn:length(sList) ne 0}">
				       <c:forEach items="${sList }" var="screenList">
							<tr>
								<td>${screenList.theaterDTO.area }</td>
								<td><a href="./screenView?screen_num=${screenList.screen_num }">${screenList.theaterDTO.location }</a></td>
								<td>${screenList.room_num}관</td>
								<td>${screenList.floor}층</td>
								<td>${screenList.x_num * screenList.y_num}개</td>
							</tr>
						</c:forEach>
						</c:if>
							<c:if test="${fn:length(sList) eq 0}">           
					            <tr>
					                <td colspan="3" class="nodata">상영관이 존재하지 않습니다.</td>
					            </tr>
				            </c:if>  
				        </tbody>
				    </table>
				    <div class="set-btn">
				   		 <c:if test="${theater_num eq -1 }">
				         	<input type="button" id="schBtn" class="round inred on" style="width: 58px;" value="등록">
				         </c:if>
						<c:if test="${theater_num ne -1 }">
				         	<input type="button" id="schBtn2" class="round inred on" title="${theater_num}" style="width: 58px;" value="등록">
				         </c:if>
			   		</div>
				</div>
				</form>
			
			<!-- //내용에 따라 바뀜// -->
		</div>
		</div>
		</div>
			</div>
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	</div>
</body>
</html>