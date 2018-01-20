<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>영화 등록하기</title>
<script type="text/javascript">
$(function(){
	$("#iBtn").click(function(){
		if($("#movie_name").val()==""){
			$("#movie_name").focus();
		}else if($("#file").val()==""){
			$("#file").focus();
		}else if($("#teaser_url").val()==""){
			$("#teaser_url").focus();
		}else if($("#open_date").val()==""){
			$("#open_date").focus();
		}else if($("#run_time").val()==""){
			$("#run_time").focus();
		}else if($("#type").val()==""){
			$("#type").focus();
		}else if($("#mcontents").val()==""){
			$("#mcontents").focus();
		}else if($("#age_limit").val()==""){
			$("#age_limit").focus();
		}else if($("#actor").val()==""){
			$("#actor").focus();
		}else if($("#show").val()==""){
			$("#show").focus();
		}else{
			document.frm.submit();
		}
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
                                <a href="#">영화 목록</a>
                            </li>
                            <li class="last">
                            	영화 등록
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
                         			 고객님은 sysdate <strong class="txt-purple">${myInfo.type}</strong>회원 입니다.             
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
		                    <li class="on"><a href="../admin/movieList">무비 리스트</a></li>
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
				
			<!-- ///내용에따라 바뀜//// -->
			
			<div class="tit-mycgv">
			    <h3>영화 등록</h3>
			</div>
			<p class="info-com">&nbsp;</p>
			<form action="movieInsert" method="post" name="frm" enctype="multipart/form-data">				
				<table  class="revisionTable">
					<tr>
						<td>영화제목</td>
						<td><input type="text" id="movie_name" name="movie_name" class="noneBorder"></td>
					</tr>
					<tr>
						<td>포스터</td>
						<td><input type="file" name="file" class="noneBorder"></td>
					</tr>
					<tr>
						<td>티저영상</td>
						<td><input type="text" id="teaser_url" name="teaser_url" class="noneBorder"></td>
					</tr>
					<tr>
						<td>개봉일</td>
						<td><input type="date" id="open_date" name="open_date" class="noneBorder"></td>
					</tr>
					<tr>
						<td>상영시간</td>
						<td><input type="number" id="run_time" name="run_time" class="noneBorder"></td>
					</tr>
					<tr>
						<td>장르</td>
						<td><input type="number" id="type" name="type" class="noneBorder"></td>
					</tr>
					<tr>
						<td>영화설명</td>
						<td><input type="text" id="mcontents" name="contents" class="noneBorder" style="width: 500px;"></td>
					</tr>
					<tr>
						<td>나이제한</td>
						<td><input type="number" id="age_limit" name="age_limit" class="noneBorder"></td>
					</tr>
					<tr>
						<td>출연배우</td>
						<td><input type="text" id="actor" name="actor" class="noneBorder"></td>
					</tr>
					<tr>
						<td>상영유무</td>
						<td><input type="number" id="show" name="show" class="noneBorder"></td>
					</tr>
				</table>
				<div class="set-btn">
					<input type="button" id="iBtn" class="round inred on" style="width: 58px;" value="등록">
			        <a href="../admin/movieList" class="round gray"><span>취소</span></a>
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