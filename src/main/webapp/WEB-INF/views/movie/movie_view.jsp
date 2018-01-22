<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>${movie.movie_name} &gt; 상세정보</title>

<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/movie/movie.css">
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
	<div id="cgvwrap">
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/header.jsp"></c:import>
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
                                <a href="#">영화</a>
                            </li>
                            <li class="last">
                            	영화상세
                            </li>
                    	</ul>
                	</div>
            	</div>
        	</div>
        	<!-- 상단바 끝 -->
        	
        	<!-- 내용시작 -->
<%-- <div >
	<div>
		<img alt="${movie.movie_name} 포스터" src='../resources/movie_poster/${movie.fileName}'>
	</div>
	<div>
		<div class="title"><strong>${movie.movie_name}</strong></div>
	</div>
	<div>
		<strong >
			예매율&nbsp;
			<span>${movie.reserve_rate}%</span>
		</strong>
	</div>
	<br><br><br><br>
	<div>
		${movie.actor}
		<br>
		장르 : ${movie.type} / 나이 : 
		<c:choose>
			<c:when test="${movie.age_limit eq 0}">전체이용가</c:when>
			<c:when test="${movie.age_limit eq 20}">청소년 관람불가</c:when>
			<c:otherwise>${movie.age_limit}세 이상</c:otherwise>
		</c:choose>
		,
		${movie.run_time}분
		<br>
		개봉 : ${movie.open_date}
	</div>
	<div >
	<span class="wish" >
		<c:set var="heart1" value="0" ></c:set>
		<c:set var="heart2" value="0" ></c:set>
			<c:if test="${ not empty member }"><c:forEach items="${wish_list}" var="wish">
				<c:if test="${wish.movie_num eq movie.movie_num}">										
					<c:choose>
						<c:when test="${heart1 == 0}">
							<input type="button" class="wish_btn"  value="❤" name="${movie.movie_num}" title="1" 
							style="display: inline-block; width: 30px; height: 28px;">
							<c:set var="heart1" value="1" ></c:set>
							<c:set var="heart2" value="1" ></c:set>
						</c:when>
					</c:choose>
				</c:if>
			</c:forEach>
				<c:if test="${heart2 == 0}">
					<input type="button" class="wish_btn" value="♡" name="${movie.movie_num}" title="0">
				</c:if>
			</c:if>
			<c:if test="${empty member}">
					<a href="../member/memberLogin">
						<input type="button" class="wish_btn" value="♡" name="${movie.movie_num}" title="0">
					</a>
			</c:if>
		<span>
			<strong>${movie.wish}</strong>
		</span>
		<a href="" ><input type="button" value="예매"></a>
	</span>
	</div>
</div>

<div>
	${movie.contents}
</div>

<div>
	<h4>트레일러</h4>
</div>
<iframe width="560" height="315" src="${movie.teaser_url}"></iframe>

<h3>REVIEW</h3>
<c:forEach items="${review}" var="review">
<div >
	<ul>
		<li>
			<div id = "profile" >
				<span><img style="width: 62px; height: 62px;" alt="사용자 프로필" src='../resources/profil/${review.fileName}'></span>
			</div>
			<div id = "id" >
				<ul >
					<li>${review.id}</li>
					<li>
						<span>${review.reg_date}</span>
						<span>
						<c:choose>
							<c:when test="${not empty member}">
								<input type="button" class = "warning_btn" name = "warning" value = "신고" title="${review.review_num}">
							</c:when>
							<c:otherwise>
								<a href = "../member/memberLogin">
									<input type="button" class = "warning_btn" name = "warning" value = "신고" title="${review.review_num}">
								</a>
							</c:otherwise>
						</c:choose>
							${review.warning}
						</span>
					</li>
				</ul>
			</div>
			<div id = "contents" >
				<p>${review.contents}</p>
			</div>
		</li>
	</ul>
</div>
</c:forEach>

<div ><a href="./movie_chart"><input type="button" value="무비차트"></a></div>


 --%>
<!-- ///////////////////////////////////////// -->

<div id="contents">
	<div class="wrap-movie-detail">
		<div class="tit-heading-wrap">
    		<h3>영화상세</h3>
		</div>
		<div class="sect-base-movie">
		    <h3><strong>${movie.movie_name}</strong>기본정보</h3>
		    <div class="box-image">
		        <a href="#" title="포스터 크게 보기 새창" target="_blank">
		            <span class="thumb-image"> 
		                <img src='../resources/movie_poster/${movie.fileName}' alt="${movie.movie_name} 포스터" >
		                <span class="ico-posterdetail">포스터 크게 보기</span>
		                <span class="ico-grade grade-12"> 12세 이상</span>
		            </span> 
		        </a> 
		    </div>
   			<div class="box-contents">
		        <div class="title"> 
		            <strong>${movie.movie_name}</strong>
		        </div>
		        <div class="score"> 
		            <strong class="percent">예매율&nbsp;<span>${movie.reserve_rate}%</span></strong>
		        </div>
		        <div class="spec">
		            <dl>
		                <dt></dt>
		                <dd>
		                	${movie.actor}
		                </dd>
		                <br>
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
					<c:set var="heart1" value="0" ></c:set>
					<c:set var="heart2" value="0" ></c:set>
						<c:if test="${ not empty member }"><c:forEach items="${wish_list}" var="wish">
							<c:if test="${wish.movie_num eq movie.movie_num}">										
								<c:choose>
									<c:when test="${heart1 == 0}">
										<button class="wish_btn btn-like on" name="${movie.movie_num}" title="1">영화 찜하기</button>
										<c:set var="heart1" value="1" ></c:set>
										<c:set var="heart2" value="1" ></c:set>
									</c:when>
								</c:choose>
							</c:if>
						</c:forEach>
							<c:if test="${heart2 == 0}">
								<button class="wish_btn btn-like"  name="${movie.movie_num}" title="0">영화 찜하기</button>
							</c:if>
						</c:if>
						<c:if test="${empty member}">
								<a href="../member/memberLogin">
									<input type="button" class="wish_btn" value="♡" name="${movie.movie_num}" title="0">
								</a>
						</c:if>
					
						<a href="" ><input type="button" value="예매"></a>
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
		               			<span style="font-family:malgun gothic">${movie.contents}&nbsp;</span>
		                	</span>
		                </strong>
	                </p>
	            <div class="sect-trailer">
	                <div class="heading">
	                    <h4>트레일러</h4>
	                </div>
	                <ul>
	                    <li>
	                        <div class="box-image">
	                            <a href="#" title="새창" class="movie_player_popup">
	                            	<iframe src="${movie.teaser_url}"></iframe>
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
	                    <c:if test="${fn:length(review) ne 0}">
	                    <c:forEach items="${review}" var="review">
	                    	<li>
	                    		<a href="#" class="screen_spoiler">&nbsp;</a>
	                    		<div class="box-image">
	                    			<span class="thumb-image">
	                    				<img src="../resources/profil/${review.fileName}" alt="사용자 프로필"> 
	                   						<span class="profile-mask"></span>
	                   						
	                    			</span>
	                    		</div>
	                    		<div class="box-contents">         
	                    			<ul class="writerinfo">              
	                    				<li class="writer-name">
	                    					<a href="#" class="commentMore">
	                    						${review.id}
	                    					</a>
	                    				</li>
	                    				<li class="writer-etc"> 
	                      					<span class="day">${review.reg_date}</span>
	                       					<span class="like point_like" >
	                       						<c:choose>
													<c:when test="${not empty member}">
														<input type="button" class = "warning_btn" name = "warning" value = "신고" title="${review.review_num}">
													</c:when>
													<c:otherwise>
														<a href = "../member/memberLogin">
															<input type="button" class = "warning_btn" name = "warning" value = "신고" title="${review.review_num}">
														</a>
													</c:otherwise>
												</c:choose>
													${review.warning}
	                            			</span>
	                            		</li>
	                            		
									</ul>
								</div>
								<div class="box-comment"> 
									<p>${review.contents}</p>
	 							</div>
	 						</li>
	 					</c:forEach>
	 					</c:if>
	 					<c:if test="${fn:length(review) eq 0}">
	 					
	 						<div style="padding-left: 320px;padding-top: 20px;">리뷰가 존재하지 않습니다.</div>
	 					</c:if>
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
			</div>
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	</div>
	
</body>
</html>