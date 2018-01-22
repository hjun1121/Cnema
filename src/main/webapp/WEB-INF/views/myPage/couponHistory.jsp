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
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/myPage/couponHistory.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 캘린더 추가 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
<title>나의 쿠폰</title>
<script type="text/javascript">
	$(function() {
		var type = '${type}';
		
		$(".type").each(function() {
			if($(this).val() == type) {
				$(this).attr("selected", true);
			}
		});
		$("#cBtn").click(function(){
			var cType = $("#type").val();
			location.href="./couponHistory?type="+cType;
		});
		
		$("#testDatepicker1").val('${testDatepicker1}');
		$("#testDatepicker2").val('${testDatepicker2}');
		
		$( "#testDatepicker1" ).datepicker({
	    	changeMonth: true, 
	        changeYear: true,
	        nextText: '>',
	        prevText: '<',
	        dateFormat : 'yy-mm-dd',
	        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	        dayNamesMin: ['일','월','화','수','목','금','토'],
	   	 	changeMonth: true,
	        changeYear: true,
	   		showMonthAfterYear: true,
	   		showOn:"both",
	   		buttonImage:"${pageContext.request.contextPath }/resources/images/common/ico/ico_datapicker.gif",
	   		buttonImageOnly:true
	    });
	    $( "#testDatepicker2" ).datepicker({
	    	changeMonth: true, 
	        changeYear: true,
	        nextText: '>',
	        prevText: '<',
	        dateFormat : 'yy-mm-dd',
	        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	        dayNamesMin: ['일','월','화','수','목','금','토'],
	   	 	changeMonth: true,
	        changeYear: true,
	   		showMonthAfterYear: true,
	   		showOn:"both",
	   		buttonImage:"${pageContext.request.contextPath }/resources/images/common/ico/ico_datapicker.gif",
	   		buttonImageOnly:true
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
                                <a href="#">나의 쿠폰 관리</a>
                            </li>
                            <li class="last">
                            	나의 쿠폰
                            </li>
                    	</ul>
                	</div>
            	</div>
        	</div>
        	<!-- 상단바 끝 -->
        	
        	
        	<!-- 내용 시작 -->
        	
        	
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
                    			<p style="margin-bottom:4px;color: #342929;font-family: 'NanumBarunGothicBold', '맑은 고딕', '돋움', Dotum, sans-serif;font-size: 20px;line-height: 20px;">
                         			 고객님은${tooday}
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
	            	<li class="on">
	                	<a href="#">나의 쿠폰 관리 <i></i></a>
	                	<ul>                      
	                        <li class="on"><a href="../myPage/couponHistory">나의 쿠폰</a></li>
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
		                    <li><a href="../admin/theaterList">극장목록</a></li>
		                    <li><a href="../admin/scheduleList">상영 시간표</a></li>
		                    <li><a href="../admin/couponList">쿠폰 목록</a></li>
		                    <li><a href="../admin/memberList?group_num=-1">회원 목록</a></li>
		                </ul>
		            </li>
		            
		            </c:if>
	        		</ul>
	    			</div>
    			</div>
			<div class="col-detail" id="mycgv_contents">
			<!-- /////// -->
			
				<div class="tit-mycgv">
					<h3>나의 쿠폰 관리</h3>
				</div>
				 <div class="tit-mycgv" style="padding-bottom: 10px;">
					<h4>나의 쿠폰 ${fn:length(mcList)}개 &nbsp;&nbsp;</h4>
					<form action="couponHistory">
						<select id="type" name="type" class="f">
							<option class = "type" value="11">사용가능</option>
							<option class = "type" value="10">사용완료</option>
							<option class = "type" value="12">기간만료</option>
						</select>
						<input type="button" class="btnType3" id="cBtn" value="GO">
					</form>
				</div>
				
				<form id="form1" novalidate="novalidate">
				
				<div class="tbl-data">
				    <table summary="">
				        <caption></caption>
				        <colgroup>
						    <col width="30%">
						    <col width="30%">
						    <col width="20%">
						    <col width="30%">
						</colgroup>
				        <thead>
				            <tr>
				                <th scope="col">쿠폰이름</th>
				                <th scope="col">쿠폰번호</th>
				                <th scope="col">사용기간</th>
				                <th scope="col">상태</th>
				            </tr>
				        </thead>
				        <tbody>
				        <c:if test="${fn:length(mcList) ne 0}">
				        <c:forEach items="${mcList }" var="mCouponList">
							<tr>
								<td>${mCouponList.name }</td>
								<td>${mCouponList.num }</td>
								<td>${mCouponList.publish_date }~${mCouponList.v_date }</td>
								<c:if test="${mCouponList.type eq 11 }">
									<td>사용가능</td>
								</c:if>
								<c:if test="${mCouponList.type eq 10 }">
									<td>사용완료</td>
								</c:if>
								<c:if test="${mCouponList.type eq 12 }">
									<td>기간만료</td>
								</c:if>
							</tr>
						</c:forEach>
						</c:if>
                       <!--  <tr>
                            <td>
                                <label for="chkItem1025668"><em>2</em></label>
                            </td>
                            <td>CGV본사</td>
                            <td>제안</td>
                            <td>
                                <a href="#">
                                    22
                                </a>
                            </td>
                            
                        </tr> -->
							<c:if test="${fn:length(mcList) eq 0}">           
					            <tr>
					                <td colspan="4" class="nodata">쿠폰이 존재하지 않습니다.</td>
					            </tr>
				            </c:if>  
				        </tbody>
				    </table>
				</div>
				<div style="margin-top: 30px;"></div>
				
				<div class="tit-mycgv" style="padding-bottom: 10px;">
					<h4>나의 쿠폰 사용내역&nbsp;&nbsp;</h4>
					<form action="couponHistory" method="get">
						<input type="text" name="testDatepicker1" id="testDatepicker1">~
						<input type="text" name="testDatepicker2" id="testDatepicker2"> 
						<input type="submit" id="cBtn" class="btnType3" value="조회하기">
					</form>
				</div>
				<div class="tbl-data">
				    <table summary="">
				        <caption></caption>
				        <colgroup>
						    <col width="30%">
						    <col width="30%">
						    <col width="30%">
						    
						</colgroup>
				        <thead>
				            <tr>
				                <th scope="col">쿠폰이름</th>
				                <th scope="col">쿠폰번호</th>
				                <th scope="col">사용일</th>
				            </tr>
				        </thead>
				        <tbody>
				        <c:forEach items="${cdList }" var="mCouponList">
							<tr>
								<td>${mCouponList.name }</td>
								<td>${mCouponList.num }</td>
								<td>${mCouponList.use_date }</td>
							</tr>
						</c:forEach>
							<c:if test="${fn:length(cdList) eq 0}">           
					            <tr>
					                <td colspan="3" class="nodata">사용한 쿠폰이 존재하지 않습니다.</td>
					            </tr>
				            </c:if>  
				        </tbody>
				    </table>
				</div>
					<div class="sect-box-descri">
					    <h4>CGV 예매 관련 정책 안내</h4>
					    <div class="box-polaroid">
					        <div class="box-inner" style="padding-bottom: 20px;">
					            <ul>
					            	<li>
					            		<dl>
					            			<dt>이용안내</dt>
					            			<dd>
					            				<ul>
					            					<li>쿠폰은 멤버십 카드에 적립되어 출력하실 필요가 없습니다.</li>
					            					<li>쿠폰 사용시에는 반드시 멤버십 카드를 지참하셔야 하며, 주문 전에 제시하여 주세요.</li>
					            					<li>자세한 사용 방법은 쿠폰마다 상이하며, &lt;상세 안내&gt;를 반드시 참조해 주시기 바랍니다.</li>
					            					<li>유효기간이 경과된 쿠폰은 자동으로 소멸됩니다.</li>
					            				</ul>
					            			</dd>
					            		</dl>
					            	</li>
					            </ul>
					        </div>
					    </div>
					</div>
				</form>
			<!-- ////// -->
			
			<%-- 
			<h3>MY COUPON ${fn:length(mcList)}개</h3>
			<form action="couponHistory">
				<select id="type" name="type">
					<option class = "type" value="11">사용가능</option>
					<option class = "type" value="10">사용완료</option>
					<option class = "type" value="12">기간만료</option>
				</select>
				<input type="button" id="cBtn" value="GO">
			</form>
			<table>
				<tr>
					<td>쿠폰이름</td>
					<td>쿠폰번호</td>
					<td>사용기간</td>
					<td>상태</td>
				</tr>
				<c:forEach items="${mcList }" var="mCouponList">
					<tr>
						<td>${mCouponList.name }</td>
						<td>${mCouponList.num }</td>
						<td>${mCouponList.publish_date }~${mCouponList.v_date }</td>
						<c:if test="${mCouponList.type eq 11 }">
							<td>사용가능</td>
						</c:if>
						<c:if test="${mCouponList.type eq 10 }">
							<td>사용완료</td>
						</c:if>
						<c:if test="${mCouponList.type eq 12 }">
							<td>기간만료</td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
			
			
			<form name="frm" action="couponHistory" method="get">
				<input type="text" name="testDatepicker1" id="testDatepicker1">~
				<input type="text" name="testDatepicker2" id="testDatepicker2"> 
				<input type="submit" id="cBtn" value="조회하기">
			</form>
			<table>
				<tr>
					<td>쿠폰이름</td>
					<td>쿠폰번호</td>
					<td>사용일</td>
				</tr>
				<c:forEach items="${cdList }" var="mCouponList">
					<tr>
						<td>${mCouponList.name }</td>
						<td>${mCouponList.num }</td>
						<td>${mCouponList.use_date }</td>
					</tr>
				</c:forEach>
			</table> --%>
			
						<!-- //내용에 따라 바뀜// -->
				</div>
				</div>
				</div>
       
		<!-- 내용 끝 -->
			</div>
			<!-- ///////////////////////////////// -->
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	</div>
</body>
</html>