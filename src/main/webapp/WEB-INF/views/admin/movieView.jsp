<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>영화 상세보기</title>
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
                                <a href="#">영화 목록</a>
                            </li>
                            <li class="last">
                            	영화 상세/수정
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
	            		<a href="../member/myPageView" title="현재 선택">MY CNEMA HOME <i></i></a>
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
	                    <a href="../myPage/qnaHistory">나의 문의내역 <i></i></a>
		                <ul>
		                    <li><a href="../myPage/qnaHistory">1:1문의</a></li>
		                </ul>
		            </li>
		            <c:if test="${!empty member and member.type eq 20 }">
		            <li class="on">
	                    <a href="#">관리자 <i></i></a>
		                <ul>
		                    <li class="on"><a href="../admin/movieList">무비 리스트</a></li>
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
				
			<!-- ///내용에따라 바뀜//// -->

			<div class="tit-mycgv">
			    <h3>영화 상세/수정</h3>
			</div>
			<p class="info-com">&nbsp;</p>
			<form action="./movieRevision" method="POST" enctype="multipart/form-data">		
			<input type="hidden" name="movie_num" value="${movieDTO.movie_num }">	
				<table  class="revisionTable">
					<tr>
						<td>영화제목</td>
						<td><input type="text" name="movie_name" class="noneBorder" value="${movieDTO.movie_name }" readonly="readonly"></td>
					</tr>
					<tr>
						<td>포스터</td>
						<td>
						<img alt="${movieDTO.movie_name} 포스터" src="../resources/movie_poster/${movieDTO.fileName}" style="width: 60px; height: 70px;">
						</td>
					</tr>
					<tr>
						<td>티저영상</td>
						<td><input type="text" name="teaser_url" class="noneBorder" value="${movieDTO.teaser_url }" size="80"></td>
					</tr>
					<tr>
						<td>개봉일</td>
						<td><input type="date" name="open_date" class="noneBorder" value="${movieDTO.open_date }"></td>
					</tr>
					<tr>
						<td>상영시간</td>
						<td><input type="text"  name="run_time" class="noneBorder" value="${movieDTO.run_time }" size="10"></td>
					</tr>
					<tr>
						<td>장르</td>
						<td><input type="text" name="type" class="noneBorder" value="${movieDTO.type }"></td>
					</tr>
					<tr>
						<td>영화설명</td>
						<td><input type="text" name="contents" class="noneBorder" value="${movieDTO.contents }" size="80"></td>
					</tr>
					<tr>
						<td>나이제한</td>
						<td><input type="text" name="age_limit" class="noneBorder" value="${movieDTO.age_limit }" size="10"></td>
					</tr>
					<tr>
						<td>출연배우</td>
						<td><input type="text" name="actor" class="noneBorder" value="${movieDTO.actor }" size="50"></td>
					</tr>
					<tr>
						<td>상영중</td>
						<td><input type="number" name="show" class="noneBorder" value="${movieDTO.show }" size="10"> (10:상영중 / 20:상영종료)</td>
					</tr>
				</table>
				<div class="set-btn">
					<input type="submit" class="round inred on" style="width: 58px;" value="수정">
			        <a href="../admin/movieList" class="round gray"><span>목록</span></a>
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