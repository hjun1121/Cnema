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
	                    <a href="../admin/myQnaList">나의 문의내역 <i></i></a>
		                <ul>
		                    <li><a href="../admin/myQnaList">1:1문의</a></li>
		                </ul>
		            </li>
		            <c:if test="${!empty member and member.type eq 20 }">
			            <li class="on">
		                    <a href="#">관리자 <i></i></a>
			                <ul>
		                    <li><a href="../admin/movieList">무비 리스트</a></li>
		                    <li><a href="../admin/theaterList">극장 리스트</a></li>
		                    <li class="on"><a href="../admin/screenList?theater_num=-1">상영관 리스트</a></li>
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
			
				<div class="tit-mycgv">
					<h3>상영관 리스트</h3>
				</div>
				<form id="form1" novalidate="novalidate">
				<div class="tit-mycgv" style="padding-bottom: 10px;">
					<%-- <h4>상영관 리스트 ${fn:length(sList)}개</h4> --%>
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
					                <td colspan="5" class="nodata">상영관이 존재하지 않습니다.</td>
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
			   		<c:if test="${fn:length(sList) > 0}">
			   		<div class="paging">
					<ul id="paging_point" style="text-align: center;">
						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							<li style="text-decoration: none; display: inline-block; padding: 0 8px; color: #333333; font-family: Verdana, Geneva, sans-serif; font-size: 14px; font-weight: bold; line-height: 28px;" class=" on">
								<a href="screenList?curPage=${i}" title="${i}페이지 선택">${i}</a>
							</li>
						</c:forEach>
						<c:if test="${pager.curBlock lt pager.totalBlock}">
							<li class="paging-side">
								<a href="screenList?curPage=${pager.lastNum+1}"><button style="line-height: 26px; color: inherit; text-decoration: none;margin-top: 30px;" class="btn-paging next" type="button">다음</button></a>
							</li>
						</c:if>
					</ul>
				</div>
				</c:if>
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