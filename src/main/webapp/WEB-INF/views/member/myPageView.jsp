<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/headerBar.css">
<title>MY CNEMA HOME</title>
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
				<input type="hidden" id="isTown" name="isTown" value="Y">
				<input type="hidden" id="userTownMemberInfo" name="userTownMemberInfo" value="">
    			<div class="mycgv-info-wrap">
					<div class="skipnaiv">
						<a href="#menu" id="skipPersoninfo">개인화영역 건너띄기</a>
					</div>
       				<div class="sect-person-info">
        				<h2 class="hidden">개인화 영역</h2> 
        					<div class="box-image">
								<span class="thumb-image">
									<img src="http://img.cgv.co.kr/R2014/images/common/default_profile.gif" alt="장희성님 프로필 사진">
									<span class="profile-mask"></span>
								</span>
        					</div>
        					<div class="box-contents newtype">
				        		<div class="person-info">
				        			<strong>장희성님</strong>
				        			<em>hsung0228</em>
				        			<span>닉네임 : <i>닉네임을 설정해주세요.</i> </span>
				        			<button id="go_edit_page" type="button" title="새창열림">나의 정보 변경</button>
				        		</div>
        					<div class="grade-info">
                    			<p style="margin-bottom:4px;color: #342929;font-family: 'NanumBarunGothicBold', '맑은 고딕', '돋움', Dotum, sans-serif;font-size: 20px;line-height: 20px;">
                         			 고객님은  2017년 2월 <strong class="txt-purple">VIP</strong> 입니다.             
                   			 	</p>
        						<button type="button" id="view_usergrade" class="round black"><span>MY 지난등급이력 보기</span></button>
        						<a href="#" class="round inblack"><span> VIP라운지 바로가기</span></a>
                    			<div class="mycgv_btn_special2">
                       				<h5 class="special_tit">SPECIAL MEMBERSHIP</h5>
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
			        				<strong>CJ ONE 사용가능 포인트</strong>
			        				<span><em class="txt-maroon">801</em> 점</span>
			        			</li>
			        		    <li class="tooltip_list cf">
			        				<strong>VIP선정 포인트</strong><a href="#" class="mycgv_tooltip"><img src="http://img.cgv.co.kr/R2014/images/common/mycgv_tooltip/ico_tooltip.png" alt="i"></a>
			
			                        <div class="tooltip_con tc2"><span><img src="http://img.cgv.co.kr/R2014/images/common/mycgv_tooltip/tooltip_con2.png" alt=""></span></div>
			        				<span><em>9,020</em> 점</span>
			        			</li>
			        		</ul>
			        	</div>
			        	<div class="col-favorite-theater">
			        		<h3 class="hidden">자주가는 CGV</h3>
				    		<div class="sect-favorite">
					            <ul id="favoriteTheaters">
			                            <li><a href="#" data-regioncode="02" data-theatercode="0049"><span>1<em>순위</em></span>CGV북수원</a></li>
			                            <li><a href="#" data-regioncode="02" data-theatercode="0012"><span>2<em>순위</em></span>CGV수원</a></li>
			                            <li><a href="#" data-regioncode="02" data-theatercode="0073"><span>3<em>순위</em></span>CGV시흥</a></li>
			                            <li><a href="#" data-regioncode="" data-theatercode=""><span>4<em>순위</em></span></a></li>
			                            <li><a href="#" data-regioncode="" data-theatercode=""><span>5<em>순위</em></span></a></li>
					            </ul>
					            <button id="btn_set_my_favorite" title="새창" type="button" class="setting">자주가는 CGV<br>설정하기</button>
					        </div>
				        </div>
			            <div class="cols-point-wrap"></div>
			        </div>
			    </div>
			</div>

			<div class="cols-content" id="menu">
    			<div class="col-aside">
					<div class="skipnaiv">
						<a href="#" id="skipMycgvMenu">MYCGV 서브메뉴 건너띄기</a>
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
		                        <li>
		                        	<a href="#">내가 본 영화</a>
		                        </li>
			                    <li>
		                            <a href="#">위시 리스트</a>
		                        </li>
	                        </ul>
                	</li>
	            	<li>
	                	<a href="#">나의 쿠폰 관리 <i></i></a>
	                	<ul>                      
	                        <li>
	                        	<a href="#">나의 VIP쿠폰</a>
	                        </li>
		                    <li>
	                            <a href="#">CGV 영화관람권</a>
	                        </li>
	                	</ul>
	           		</li>
	            	<li>
                    	<a href="#">CJ ONE 포인트 <i></i></a>
	                	<ul>
	                    	<li>                         
                               <a href="#">매점이용 포인트 적립</a>  
                        	</li>
                        	<li>                        
                                <a href="#">포인트 적립/사용내역</a>                            
                        	</li>
	                	</ul>
	            	</li>

	            	<li>
                    	<a href="#">회원정보<i></i></a>
	                	<ul>
                         <li>
                            <a href="#">회원정보수정</a>
                        </li>

	                    <li>
                            <a href="#">프로필관리</a>
                        </li>
	                    <li>
                            <a href="#">회원탈퇴</a>
                        </li>
                        
	                	</ul>
	            	</li>
		            <li>
	                    <a href="#">나의 문의내역 <i></i></a>
		                <ul>
		                    <li>
	                            <a href="#">1:1 문의</a>
	                        </li>
		                </ul>
		            </li>
	        	</ul>
	    		</div>
    </div>
	<div class="col-detail" id="mycgv_contents">

<div class="tit-mycgv">
	<h3>MY 예매내역</h3>
	<p><em>1건</em> <a href="#">예매내역 더보기</a></p>
	<span>예매번호로만 티켓을 찾을 수 있으니 반드시 확인 부탁드립니다.</span>
</div>

<form name="aspnetForm" method="post" action="./default.aspx" id="aspnetForm" novalidate="novalidate">
<div>
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="">
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMjAzNjI1MTIzN2Rkb61/wKC2wl92h7iknOS3c2nC6AQ=">
</div>




<div>

	<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="F268F2D4">
	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEdAANEBwag/p6Cyp7NqgHffiIrAAaiyC+ogOIlg3pscMtiP2lKUwCIH8TI/sjrTPJzW34iVv8t0sMzGIw9AmgL9DZ3cbnRDQ==">
</div>

	    <!-- MY 예매내역 -->
	    <input type="hidden" id="hidCancelReserveNo" name="hidCancelReserveNo">
	    <div class="sect-base-booking">
		    <div class="box-polaroid">
		        <div class="box-inner">
	                
	                
		                <div class="lst-item">
		            	    <div class="box-number">
		            		    <em>예매번호</em>
		            		    <strong>0049-<i>0109-0334-401</i></strong>
		            		    <span>(2018.01.09)</span>
		            	    </div>
			                <div class="box-image">
			            	    <a href="/movies/detail-view/?midx=80320">
				            	    <span class="thumb-image"> 
				                        <img src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000080/80320/80320_126.jpg" alt="1987 포스터" onerror="errorImage(this)">
				                    </span>
				                </a>
			                </div>
			                <div class="box-contents">
			            	    <dl>
			            		    <dt>
	                                    <a href="#">1987</a>
	                                                                       
	                                </dt>
	                            
				        		    <dd>
	                                    <em>관람극장</em> 
	                                    <strong>CGV 북수원</strong> 
	                                    <a href="#">[극장정보]</a>
	                                </dd>
				        		    <dd>
	                                    <em>관람일시</em>
	                                    <strong>2018.01.11(목) 10:35</strong>
	                                </dd>
			            	    </dl>
			                </div>
			                <div class="box-detail">
			            	    <div class="account-info">
				            	    <dl>
				            		    <dt>  일반 2</dt>
	                                            <dd>
	                                                <em>VIP 쿠폰북 결제</em> 
	                                                <strong class="txt-lightblue">12,000원</strong>
	                                            </dd>
				            	    </dl>
			            	    </div>
			            	    <div class="set-btn">
	                                <input type="hidden" class="reserve-no" name="reserve-no" value="xKF/GnI3PR6dsZdJMm16rA9tQa3ARxK1iCtIEkCAy/0=">
	                                <button type="button" title="새창" class="round inblack sendsmspopup"><span>문자보내기</span></button>
	                                <button type="button" data-status="94" class="round black cancel" onclick="noshowYN('N', '20180111' , '00' )"><span>예매취소</span></button>
			            	    </div>
			                </div>
		                </div>
	                    
	                    
		        </div>
		    </div>
	    </div>
	</form>
	<!-- //MY 예매내역 -->

		<h3><img src="http://img.cgv.co.kr/R2014/images/title/h3_vip_benefit.gif" alt="MY VIP BENEFIT"></h3>
		<div class="sect-com-info">
			<p><em>2017</em>년도 <strong>장희성</strong> 고객님의 <strong class="txt-purple">VIP</strong> 혜택 안내</p>
			<span>다양한 혜택과 풍성한 문화생활을 누리세요!</span>
		</div>


		<!-- MY 참여이력 -->
		<div class="sect-mycgv-part">
		    <div class="box-polaroid type1">
		        <div class="box-inner">
		            <div class="tit-mycgv">
						<h3>MY Q&amp;A</h3>
						<p><em>0건</em> <a href="#">MY Q&amp;A 더보기</a></p>
					</div>
					<div class="col-myqna">
		                
		                    <ul><li>고객님의 1:1 문의내역이 존재하지 않습니다.</li></ul>
		                
					</div>
		        </div>
		    </div>
		</div>
	</div>
</div>
</div>
        	
        	
        	<!-- /////////////////////////////////////////// -->
        	
			<h1>My Page</h1>
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
				<a href="">정보 수정</a>
				<h3>프로필 관리</h3>
				<a href="">프로필 관리</a>
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
				<a href="">회원 목록</a>
				
			<!-- 내용 끝 -->
			
			
			</div>
			<!-- ///////////////////////////////// -->
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	</div>
</body>
</html>