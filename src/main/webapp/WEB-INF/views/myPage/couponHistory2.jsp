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
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/paging.css">
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
			location.href="./couponHistory2?type="+cType;
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
				<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/info.jsp"></c:import>
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
	            		<a href="../member/myPageView" title="현재 선택">MY CNEMA HOME <i></i></a>
	            	</li>
	            	<li>
	            		<a href="../myPage/movieHistory">나의 예매내역 <i></i></a>
	            			<ul>                      
		                        <li><a href="../myPage/movieHistory">내가 본 영화</a></li>
			                    <li><a href="../myPage/wishList">위시 리스트</a></li>
	                        </ul>
                	</li>
	            	<li class="on">
	                	<a href="../myPage/couponHistory">나의 쿠폰 관리 <i></i></a>
	                	<ul>                      
	                        <li><a href="../myPage/couponHistory">나의 쿠폰</a></li>
	                        <li class="on"><a href="../myPage/couponHistory2">사용 내역</a></li>
	                	</ul>
	           		</li>
	            	<li>
                    	<a href="../myPage/pointHistory">나의 포인트 관리 <i></i></a>
	                	<ul>
                        	<li><a href="../myPage/pointHistory">포인트 적립/사용내역</a></li>
	                	</ul>
	            	</li>

	            	<li>
                    	<a href="../myPage/myInfoCheck">회원정보<i></i></a>
	                	<ul>
                        	<li><a href="../myPage/myInfoCheck">회원정보수정</a></li>
	                    	<li><a href="../myPage/withdrawalCheck">회원탈퇴</a></li>
	                	</ul>
	            	</li>
		            <li>
	                    <a href="../myPage/qnaHistory">나의 문의내역 <i></i></a>
		                <ul>
		                    <li><a href="../myPage/qnaHistory">1:1문의</a></li>
		                </ul>
		            </li>
		            <c:if test="${!empty member and member.type eq 20 }">
		            <li>
	                    <a href="#">관리자 <i></i></a>
		                <ul>
		                    <li><a href="../admin/movieList">무비 리스트</a></li>
		                    <li><a href="../admin/theaterList">극장 리스트</a></li>
		                    <li><a href="../admin/screenList?theater_num=-1">상영관 리스트</a></li>
		                    <li><a href="../admin/scheduleList">상영 리스트</a></li>
		                    <li><a href="../admin/myQnaList">문의 리스트</a></li>
		                    <li><a href="../admin/couponList">쿠폰 리스트</a></li>
		                    <li><a href="../admin/memberList?group_num=-1&sort=-1">회원 리스트</a></li>
		                </ul>
		            </li>
		            
		            </c:if>
	        		</ul>
	    			</div>
    			</div>
			<div class="col-detail" id="mycgv_contents">
			<!-- /////// -->
				<div class="tit-mycgv" style="padding-bottom: 10px;">
					<h4>나의 쿠폰 사용내역&nbsp;&nbsp;</h4>
					<form action="couponHistory2" method="get">
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
				    <c:if test="${fn:length(cdList) > 0}">
				    
				<div class="paging">
					<ul id="paging_point">
						<c:if test="${pager.curBlock gt 1}">
							<li class="paging-side">
								<a href="couponHistory2?curPage=${pager.startNum-1}&testDatepicker1=${testDatepicker1}&testDatepicker2=${testDatepicker2}"><button style="line-height: 26px;" class="btn-paging prev" type="button">이전</button></a>
							</li>						
						</c:if>
						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							<li style="text-decoration: none;" class=" on">
								<a href="couponHistory2?curPage=${i}&testDatepicker1=${testDatepicker1}&testDatepicker2=${testDatepicker2}" title="${i}페이지 선택">${i}</a>
							</li>
						</c:forEach>
						<c:if test="${pager.curBlock lt pager.totalBlock}">
							<li class="paging-side">
								<a href="couponHistory2?curPage=${pager.lastNum+1}&testDatepicker1=${testDatepicker1}&testDatepicker2=${testDatepicker2}"><button style="line-height: 26px;" class="btn-paging next" type="button">다음</button></a>
							</li>
						</c:if>
					</ul>
				</div>
				</c:if>  
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