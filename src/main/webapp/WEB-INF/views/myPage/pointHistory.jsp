<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<title>포인트 적립/사용내역</title>
<script type="text/javascript">
$(function() {
	$( "#testDatepicker1" ).val('${testDatepicker1}');
	$( "#testDatepicker2" ).val('${testDatepicker2}');
	
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
                                <a href="#">나의 포인트 관리</a>
                            </li>
                            <li class="last">
                            	포인트적립/사용내역
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
	            		<a href="../myPage/myPageView" title="현재 선택">MY CNEMA HOME <i></i></a>
	            	</li>
	            	<li>
	            		<a href="../myPage/movieHistory">나의 예매내역 <i></i></a>
	            			<ul>                      
		                        <li><a href="../myPage/movieHistory">내가 본 영화</a></li>
			                    <li><a href="../myPage/wishList">위시 리스트</a></li>
	                        </ul>
                	</li>
	            	<li>
	                	<a href="../myPage/couponHistory">나의 쿠폰 관리 <i></i></a>
	                	<ul>                      
	                        <li><a href="../myPage/couponHistory">나의 쿠폰</a></li>
	                        <li><a href="../myPage/couponHistory2">사용 내역</a></li>
	                	</ul>
	           		</li>
	            	<li class="on">
                    	<a href="../myPage/pointHistory">나의 포인트 관리 <i></i></a>
	                	<ul>
                        	<li class="on"><a href="../myPage/pointHistory">포인트 적립/사용내역</a></li>
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
	                    <a href="../admin/myQnaList">나의 문의내역 <i></i></a>
		                <ul>
		                    <li><a href="../admin/myQnaList">1:1문의</a></li>
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

				<div class="tit-mycgv">
					<h3>나의 포인트 관리</h3>
				</div>
				 
				
				<form id="form1" novalidate="novalidate">
				<div class="tit-mycgv" style="padding-bottom: 10px;">
					<h4>나의 포인트 사용/적립 내역&nbsp;&nbsp;</h4>
					<form name="frm" action="pointHistory" method="get">
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
				                <th scope="col">포인트 적립일</th>
				                <th scope="col">포인트 금액</th>
				                <th scope="col">구분</th>
				            </tr>
				        </thead>
				        <tbody>
				       <c:if test="${fn:length(pList) ne 0}">
				       <c:forEach items="${pList}" var="pointList">
							<tr>
								<td>${pointList.use_day }</td>
								<td>${pointList.point_price }점</td>
								<c:if test="${pointList.type eq 20}">
									<td>적립</td>
								</c:if>
								<c:if test="${pointList.type eq 10}">
									<td>사용</td>
								</c:if>
							</tr>
						</c:forEach>
						</c:if>
							<c:if test="${fn:length(pList) eq 0}">           
					            <tr>
					                <td colspan="3" class="nodata">포인트가 존재하지 않습니다.</td>
					            </tr>
				            </c:if>  
				        </tbody>
				    </table>
				    <div class="paging">
					<ul id="paging_point" style="text-align: center;">
						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							<li style="text-decoration: none; display: inline-block; padding: 0 8px; color: #333333; font-family: Verdana, Geneva, sans-serif; font-size: 14px; font-weight: bold; line-height: 28px;" class=" on">
								<a href="pointHistory?curPage=${i}&kind=${kind}" title="${i}페이지 선택">${i}</a>
							</li>
						</c:forEach>
						<c:if test="${pager.curBlock lt pager.totalBlock}">
							<li class="paging-side">
								<a href="pointHistory?curPage=${pager.lastNum+1}&kind=${kind}"><button style="line-height: 26px; color: inherit; text-decoration: none;margin-top: 30px;" class="btn-paging next" type="button">다음</button></a>
							</li>
						</c:if>
					</ul>
				</div>
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
				<!-- ///////////// -->
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