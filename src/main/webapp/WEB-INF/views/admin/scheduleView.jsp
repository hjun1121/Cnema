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
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/member/myPageView.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/myPage/myInfo.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>상영시간표 상세페이지(관리자용)</title>
<script type="text/javascript">
$(function(){
	var selectDay='${selectDay}';
	
	$(".selectList").each(function(){
		if($(this).val()==selectDay){
			$(this).attr("selected",true);
		}
	});
	
	$("#removeBtn").click(function(){
		var schedule_num = $("#schedule_num").val();
		location.href="./scheduleRemove?schedule_num="+schedule_num;
	});
	
	$("#in_time").change(function(){
		var in_time = $("#in_time").val();
		var movie_num = $("#movie_num").val();
		var day = $("#day").val();
		$.ajax({
			url:"../ajax/inTime",
			type:"POST",
			data:{		
				movie_num:movie_num,
				in_time:in_time,
				day:day
			},
			success:function(data){
				$("#out_time").val(data.trim());
			}
		});
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
                            <li>
                            	<a href="#">상영 시간표</a>
                            </li>
                            <li class="last">
                            	상영시간표 상세페이지
                            </li>
                    	</ul>
                	</div>
            	</div>
        	</div>
        	<!-- 상단바 끝 -->
        	
        	
        	<!-- 내용 시작 -->
        	
        	
        	<div id="contents">
            
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
	                        <li><a href="../myPage/couponHistory">나의 쿠폰</a></li>
	                        <li><a href="../myPage/couponHistory2">사용 내역</a></li>
	                	</ul>
                	</li>
	            	<li>
	                	<a href="../myPage/couponHistory">나의 쿠폰 관리 <i></i></a>
	                	<ul>                      
	                        <li><a href="../myPage/couponHistory">나의 쿠폰</a></li>
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
			            <li class="on">
		                    <a href="#">관리자 <i></i></a>
			            <ul>
		                    <li><a href="../admin/movieList">무비 리스트</a></li>
		                    <li><a href="../admin/theaterList">극장 리스트</a></li>
		                    <li><a href="../admin/screenList?theater_num=-1">상영관 리스트</a></li>
		                    <li class="on"><a href="../admin/scheduleList">상영 리스트</a></li>
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
			    
			<div class="tit-mycgv">
			    <h3>상영시간표 상세페이지</h3>
			</div>
			<p class="info-com">&nbsp;</p>
			<form action="./scheduleRevision" method="POST">		
			<input type="hidden" name="schedule_num" id="schedule_num" value="${scheduleDTO.schedule_num }">
				<table  class="revisionTable">
					<tr>
						<td>상영관번호</td>
						<td><input type="text" name="screen_num" value="${scheduleDTO.screen_num }" class="noneBorder" readonly="readonly"></td>
					</tr>
					<tr>
						<td>영화번호</td>
						<td><input type="text" name="movie_num" id="movie_num" value="${scheduleDTO.movie_num }" class="noneBorder" readonly="readonly"></td>
					</tr>
					<tr>
						<td>시작시간</td>
						<td><input type="time" name="in_time" id="in_time" value="${scheduleDTO.in_time }" class="noneBorder"></td>
					</tr>
					<tr>
						<td>종료시간</td>
						<td><input type="time" name="out_time" id="out_time" value="${scheduleDTO.out_time }" class="noneBorder"></td>
					</tr>
					<tr>
						<td>상영날짜</td>
						<td>
							<select id="day" name="day" class="selectList" style="width: 100px; height: 30px; color: #666; border: 1px solid #e6e6e6; background-color: #fff; line-height: 29px;">
								<c:forEach items="${dayList }" var="dayDTO">
									<option value="${dayDTO.day_num }" class="selectList">${dayDTO.day_num }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
				</table>
				<div class="set-btn">
					<input type="submit"  class="round inred on" style="width: 58px;" value="수정">
					<input type="button" class="round gray" style="width:58px; background-color:#fdfcf0;" id="removeBtn" value="삭제">
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