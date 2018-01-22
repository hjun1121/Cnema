<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>${movie.movie_name} &gt; 상세정보</title>

    <!-- <link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/reset.css">
    <link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/layout.css">
    <link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/module.css">
    <link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/eggupdate.css"> -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/script/main.js"></script>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/headerBar.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/movie/movie_view.css">

<script type="text/javascript">

	$(function() {
		
		$(".warning_btn").click(function() {
			var review_num = $(this).attr("title");
			alert(review_num);
			
			$.ajax({
				url:"../ajax/review_warning",
				type: "POST",
				data: {
					review_num:review_num,
					movie_num:'${movie_num}'
				},
				success: function(data) {
					alert(data);
					location.href="movie_view?movie_num=${movie_num}";
				}
			});
		});


		$(".wish_btn").click(function() {
			var movie_num = $(this).attr("name");
			var title = $(this).attr("title");

			if (title == 1) {
				$.ajax({
					url: "../ajax/movie_wish_return",
					type: "POST",
					data: {
						movie_num:movie_num
					},
					success: function(data) {
						alert(data);
						location.href="movie_view?movie_num=${movie_num}";
					}
				});

			} else if (title == 0) {
				$.ajax({
					url: "../ajax/movie_wish",
					type: "POST",
					data: {
						movie_num:movie_num
					},
					success: function(data) {
						alert(data);
						location.href="movie_view?movie_num=${movie_num}";
					}
				});
			}
			
		});
		
	});

</script>
</head>
<body>
<!-- 	<div id="cgvwrap"> -->
<%-- 		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/header.jsp"></c:import> --%>
<!-- 			<div id="contaniner" class=""> -->
<!--         	상단바 시작 -->
<!--         	<div class="linemap-wrap"> -->
<!--            		<div class="sect-linemap"> -->
<!--                 	<div class="sect-bcrumb"> -->
<!--                     	<ul> -->
<!--                         	<li> -->
<%--                         		<a href="#"><img alt="home" src="${pageContext.request.contextPath }/resources/images/common/btn/btn_home.png"></a> --%>
<!--                         	</li> -->
<!--                             <li> -->
<!--                                 <a href="#">영화</a> -->
<!--                             </li> -->
<!--                             <li class="last"> -->
<!--                             	영화상세 -->
<!--                             </li> -->
<!--                     	</ul> -->
<!--                 	</div> -->
<!--             	</div> -->
<!--         	</div> -->
<!--         	상단바 끝 -->
        	
<!--         	내용시작 -->
<!-- <div > -->
<!-- 	<div> -->
<%-- 		<img alt="${movie.movie_name} 포스터" src='../resources/movie_poster/${movie.fileName}'> --%>
<!-- 	</div> -->
<!-- 	<div> -->
<%-- 		<div class="title"><strong>${movie.movie_name}</strong></div> --%>
<!-- 	</div> -->
<!-- 	<div> -->
<!-- 		<strong > -->
<!-- 			예매율&nbsp; -->
<%-- 			<span>${movie.reserve_rate}%</span> --%>
<!-- 		</strong> -->
<!-- 	</div> -->
<!-- 	<br><br><br><br> -->
<!-- 	<div> -->
<%-- 		${movie.actor} --%>
<!-- 		<br> -->
<%-- 		장르 : ${movie.type} / 나이 :  --%>
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${movie.age_limit eq 0}">전체이용가</c:when> --%>
<%-- 			<c:when test="${movie.age_limit eq 20}">청소년 관람불가</c:when> --%>
<%-- 			<c:otherwise>${movie.age_limit}세 이상</c:otherwise> --%>
<%-- 		</c:choose> --%>
<!-- 		, -->
<%-- 		${movie.run_time}분 --%>
<!-- 		<br> -->
<%-- 		개봉 : ${movie.open_date} --%>
<!-- 	</div> -->
<!-- 	<div > -->
<!-- 	<span class="wish" > -->
<%-- 		<c:set var="heart1" value="0" ></c:set> --%>
<%-- 		<c:set var="heart2" value="0" ></c:set> --%>
<%-- 			<c:if test="${ not empty member }"><c:forEach items="${wish_list}" var="wish"> --%>
<%-- 				<c:if test="${wish.movie_num eq movie.movie_num}">										 --%>
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${heart1 == 0}"> --%>
<%-- 							<input type="button" class="wish_btn"  value="❤" name="${movie.movie_num}" title="1"  --%>
<!-- 							style="display: inline-block; width: 30px; height: 28px;"> -->
<%-- 							<c:set var="heart1" value="1" ></c:set> --%>
<%-- 							<c:set var="heart2" value="1" ></c:set> --%>
<%-- 						</c:when> --%>
<%-- 					</c:choose> --%>
<%-- 				</c:if> --%>
<%-- 			</c:forEach> --%>
<%-- 				<c:if test="${heart2 == 0}"> --%>
<%-- 					<input type="button" class="wish_btn" value="♡" name="${movie.movie_num}" title="0"> --%>
<%-- 				</c:if> --%>
<%-- 			</c:if> --%>
<%-- 			<c:if test="${empty member}"> --%>
<!-- 					<a href="../member/memberLogin"> -->
<%-- 						<input type="button" class="wish_btn" value="♡" name="${movie.movie_num}" title="0"> --%>
<!-- 					</a> -->
<%-- 			</c:if> --%>
<!-- 		<span> -->
<%-- 			<strong>${movie.wish}</strong> --%>
<!-- 		</span> -->
<!-- 		<a href="" ><input type="button" value="예매"></a> -->
<!-- 	</span> -->
<!-- 	</div> -->
<!-- </div> -->

<!-- <div> -->
<%-- 	${movie.contents} --%>
<!-- </div> -->

<!-- <div> -->
<!-- 	<h4>트레일러</h4> -->
<!-- </div> -->
<%-- <iframe width="560" height="315" src="${movie.teaser_url}"></iframe> --%>

<!-- <h3>REVIEW</h3> -->
<%-- <c:forEach items="${review}" var="review"> --%>
<!-- <div > -->
<!-- 	<ul> -->
<!-- 		<li> -->
<!-- 			<div id = "profile" > -->
<%-- 				<span><img style="width: 62px; height: 62px;" alt="사용자 프로필" src='../resources/profil/${review.fileName}'></span> --%>
<!-- 			</div> -->
<!-- 			<div id = "id" > -->
<!-- 				<ul > -->
<%-- 					<li>${review.id}</li> --%>
<!-- 					<li> -->
<%-- 						<span>${review.reg_date}</span> --%>
<!-- 						<span> -->
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${not empty member}"> --%>
<%-- 								<input type="button" class = "warning_btn" name = "warning" value = "신고" title="${review.review_num}"> --%>
<%-- 							</c:when> --%>
<%-- 							<c:otherwise> --%>
<!-- 								<a href = "../member/memberLogin"> -->
<%-- 									<input type="button" class = "warning_btn" name = "warning" value = "신고" title="${review.review_num}"> --%>
<!-- 								</a> -->
<%-- 							</c:otherwise> --%>
<%-- 						</c:choose> --%>
<%-- 							${review.warning} --%>
<!-- 						</span> -->
<!-- 					</li> -->
<!-- 				</ul> -->
<!-- 			</div> -->
<!-- 			<div id = "contents" > -->
<%-- 				<p>${review.contents}</p> --%>
<!-- 			</div> -->
<!-- 		</li> -->
<!-- 	</ul> -->
<!-- </div> -->
<%-- </c:forEach> --%>

<!-- <div ><a href="./movie_chart"><input type="button" value="무비차트"></a></div> -->



<!-- ///////////////////////////////////////// -->
<div id="cgvwrap">
<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/header.jsp"></c:import>
<div id="contents" class="">
	<div class="wrap-movie-detail">
		<div class="tit-heading-wrap">
    		<h3>영화상세</h3>
		</div>
		<div class="sect-base-movie">
		    <h3><strong>${movie.movie_name}</strong>기본정보</h3>
		    <div class="box-image">
		        <a href="#" title="포스터 크게 보기 새창" target="_blank">
		            <span class="thumb-image"> 
		                <img src="../resources/movie_poster/${movie.fileName}" alt="${movie.movie_name} 포스터" >
		            </span> 
		        </a> 
		    </div>
   			<div class="box-contents">
		        <div class="title"> 
		            <strong>${movie.movie_name}</strong>
		        </div>
		        <div class="score"> 
		            <strong class="percent">예매율&nbsp;<span>${movie.reserve_rate }%</span></strong>
		        </div>
		        <div class="spec">
		            <dl>
		                <dt></dt>
		                <dd>
		                	${movie.actor}
		                </dd>
		                <br>
<!-- 		                <dd> -->
<!-- 		                </dd> -->
<!-- 		                <dt>&nbsp;/ 배우 :&nbsp;</dt> -->
<!-- 		                <dd class="on"> -->
<!-- 			                <a href="#">딜런 오브라이언</a>                     -->
<!-- 			                ,&nbsp; -->
<!-- 			                <a href="#">토마스 브로디 생스터</a>                     -->
<!-- 			                ,&nbsp; -->
<!-- 			                <a href="#">카야 스코델라리오</a>                     -->
<!-- 			                ,&nbsp; -->
<!-- 			                <a href="#">이기홍(1)</a>                     -->
<!-- 		                </dd> -->
		                <dt>장르 :&nbsp;${movie.type}</dt> 
		                <dd></dd>
		                <dt>&nbsp;/ 기본 :&nbsp;
        	           		<c:choose>
								<c:when test="${movie.age_limit eq 0}">전체이용가</c:when>
								<c:when test="${movie.age_limit eq 20}"> 청소년 관람불가</c:when>
								<c:otherwise>${movie.age_limit}세 이상</c:otherwise>
							</c:choose>
							, ${movie.run_time}분
		                </dt>
		                <br>
		                <dt>개봉 :&nbsp;</dt>
		                <dd class="on">${movie.open_date}</dd>
		            </dl>
		        </div>
		        
		        <span class="like">
		        	<c:choose>
		        		<c:when test="">
		            		<button class="btn-like on wish_btn" value="80446">영화 찜하기</button>
		            	</c:when>
		            	<c:otherwise>
		            		<button class=".like .btn-like wish_btn" value="80446">영화 찜하기</button>
		            	</c:otherwise>
		            </c:choose>
		            <span class="count">
		                <strong><i>${movie.wish}</i><span>명이 선택</span></strong> 
		                <i class="corner-RT"></i>
		                <i class="corner-LT"></i>
		                <i class="corner-LB"></i>
		                <i class="corner-RB"></i>
		                <i class="corner-arrow"></i>
		            </span>
		            <a class="link-reservation" href="#">예매</a> 
		        </span>
		    </div>
		</div>
	    <div class="cols-content">
	        <div class="col-detail">
	            
	            <div class="sect-story-movie">
	                <p>
		                <strong>
		                	<span style="font-size:12px">
		               			<span style="font-family:malgun gothic">${movie.contents}</span>
		                	</span>
		                </strong>
	                </p>
					<p>
						<span style="font-size:12px">
<!-- 						<span style="font-family:malgun gothic">미스터리한 조직 ‘위키드’에게 잡힌 ‘민호’(이기홍)를 구하기 위해&nbsp;<br> -->
<!-- 							‘토마스’(딜런 오브라이언)와 러너들은 ‘위키드’의 본부가 있는 최후의 도시로 향한다.&nbsp;<br> -->
<!-- 							인류의 운명이 걸린 ‘위키드’의 위험한 계획을 알게 된&nbsp;<br> -->
<!-- 							‘토마스’와 러너들은 마지막 사투를 준비하지만,&nbsp;<br> -->
<!-- 							‘토마스’는 친구와 인류의 운명 앞에서 딜레마에 빠지게 되는데… -->
<!-- 						</span> -->
						</span>
					</p>
	            <div class="sect-trailer">
	                <div class="heading">
	                    <h4>트레일러</h4>
	                </div>
	                <ul>
	                    <li>
	                        <div class="box-image">
	                            <a href="#" title="새창" class="movie_player_popup">
	                                <span class="thumb-image">
	                                    <img src="#" alt="" >
	                                    <span class="ico-play"><iframe width="560" height="315" src="${movie.teaser_url}"></iframe></span>
	                                </span>
	                            </a>
	                        </div>
	                    </li>
	                </ul>
	            </div>
				<div class="sect-grade">
	                <div class="heading-new">
	                    <a class="goto-link"><h4>리뷰</h4></a>
	                </div>
	                
	                <div class="wrap-persongrade">
	                    <ul class="point_col2">
	                    	<li>
	                    		<a href="#" class="screen_spoiler">&nbsp;</a>
	                    		<div class="box-image">
	                    			<span class="thumb-image">
	                    				<img src="http://img.cgv.co.kr/R2014/images/common/default_profile.gif" alt="사용자 프로필"> 
	                   						<span class="profile-mask"></span>
	                   						
	                    			</span>
	                    		</div>
	                    		<div class="box-contents">         
	                    			<ul class="writerinfo">              
	                    				<li class="writer-name">
	                    					<a href="#" class="commentMore">
	                    						cj**k1458
	                    					</a>
	                    				</li>
	                    				<li class="writer-etc"> 
	                      					<span class="day">2018.01.21</span>    
	                       					<span class="like point_like" >
		                       					<a href="#" class="btn_point_like">
		                       						<span>신고</span>
		                       					</a>
	                            			</span>
	                            		</li>
	                            		
									</ul>
								</div>
								<div class="box-comment"> 
									<p>그냥 의리로 봤다 역시 시리즈가많이나오면 나올수록 뻔해지고 재미없어진다</p>
	 							</div>
	 						</li>
	 						<li>
	                    		<a href="#" class="screen_spoiler">&nbsp;</a>
	                    		<div class="box-image">
	                    			<span class="thumb-image">
	                    				<img src="http://img.cgv.co.kr/R2014/images/common/default_profile.gif" alt="사용자 프로필"> 
	                   						<span class="profile-mask"></span>
	                   						
	                    			</span>
	                    		</div>
	                    		<div class="box-contents">         
	                    			<ul class="writerinfo">              
	                    				<li class="writer-name">
	                    					<a href="#" class="commentMore">
	                    						cj**k1458
	                    					</a>
	                    				</li>
	                    				<li class="writer-etc"> 
	                      					<span class="day">2018.01.21</span>    
	                       					<span class="like point_like">
		                       					<a href="#" class="btn_point_like">
		                       						<span>신고</span>
		                       					</a>
	                            			</span>
	                            		</li>
	                            		
									</ul>
								</div>
								<div class="box-comment"> 
									<p>그냥 의리로 봤다 역시 시리즈가많이나오면 나올수록 뻔해지고 재미없어진다</p>
	 							</div>
	 						</li>
	 					</ul>
	                </div>
	            </div>
	            
	
	            <div class="paging">
					<ul id="paging_point">
						<li class=" on">
							<a href="#1" title="1페이지 선택">1</a>
						</li>
						<li class="">
							<a href="#2" title="">2</a>
						</li>
						<li class=""><a href="#3" title="">3</a>
						</li>
						<li class="paging-side">
							<button class="btn-paging next" type="button">다음 10개</button>
						</li>
						<li class="paging-side">
							<button class="btn-paging end" type="button">끝</button>
						</li>
					</ul>
				</div>
	        </div>
		</div>
	    </div>
	</div>
   
        	<!-- 내용끝 -->
        	
			</div>
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	</div>
	
</body>
</html>