<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/headerBar.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/movie/movie_chart.css">

<script type="text/javascript">

	$(function() {
		
		var kind = '${kind}';
		
		$(".kind").each(function() {
			if($(this).val() == kind) {
				$(this).attr("selected", true);
			}
		});
		
		$("#kind_btn").click(function(){
			document.frm.submit();
		});


		$(".wish_btn").click(function() {
			var movie_num = $(this).attr("name");
			var title = $(this).attr("title");

			if (title == 1) {
				$.ajax({
					url: "../ajax/movie_wish_return",
					type: "POST",
					data: {
						movie_num:movie_num,
						kind:'${kind}'
					},
					success: function(data) {
						alert(data);
						location.href="movie_chart?kind=${kind}";
					}
				});

			} else if (title == 0) {
				$.ajax({
					url: "../ajax/movie_wish",
					type: "POST",
					data: {
						movie_num:movie_num,
						kind:'${kind}'
					},
					success: function(data) {
						alert(data);
						location.href="movie_chart?kind=${kind}";
					}
				});
			}
		});
		
		$("#more_btn").click(function(){
			$("#more_contents_div").css("display","");
		});
																
	});

</script>
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
                                <a href="#">영화</a>
                            </li>
                            <li class="last">
                            	무비차트
                            </li>
                    	</ul>
                	</div>
            	</div>
        	</div>
        	<!-- 상단바 끝 -->
        	
        	<!-- 내용시작 -->
   
    
    <div id="contents" style="border-bottom: 3px solid #241d1e;">
    <form action="movie_chart" name="frm" method="GET">
    <div class="wrap-movie-chart">
        <div class="tit-heading-wrap">
            <h3>무비차트</h3>
        </div>
        <div class="sect-sorting">
            <select id="kind" name="kind" >
				<option class="kind" title="현재 선택됨" selected="selected" value="reserve_rate">예매율순</option>
                <option class="kind" value="grade">평점순</option>
				<option class="kind" value="open_date">최신순</option>
				<option class="kind" value="wish">볼래요순</option>
            </select>
            <input style="width: 35px" type="button" class="round gray" id="kind_btn" value="검색">
        </div>
        <div class="sect-movie-chart">
            <ol>
            <c:forEach items="${movie_list}" var="movie" varStatus="count">
            
            <c:if test="${count.count==9 }">  <div id="more_contents_div" style="display: none;" class="sect-movie-chart"></c:if>
            
            
                <li style="border-bottom: 3px solid #241d1e; margin-top: 10px; margin-bottom: 10px;" >
                    <div class="box-image">
                    	<c:choose>
                        <c:when test="${count.count <= 8}">
                        <strong class="rank">No.${count.count}</strong>
                        </c:when>
                        <c:otherwise>
                        <strong class="rank" style="background-color: #fdfcf0; border: none;"></strong>
                        </c:otherwise>
                        </c:choose>
                        <a href="#">
                            <span class="thumb-image">
                            	<a href="movie_view?movie_num=${movie.movie_num}">
                                	<img class="thumb-image" alt="${movie.movie_name} 포스터" src='../resources/movie_poster/${movie.fileName}' >
                                </a>
                                <c:if test="${ movie.age_limit eq 12 }">
				                	<span class="ico-grade grade-12"style="margin-top: 62px;margin-left: 7px;"> 12세 이상</span>
				                </c:if>
				                 <c:if test="${ movie.age_limit eq 15 }">
				                	<span class="ico-grade grade-15"style="margin-top: 62px;margin-left: 7px;"> 15세 이상</span>
				                </c:if>
				                 <c:if test="${ movie.age_limit eq 20 }">
				                	<span class="ico-grade grade-19"style="margin-top: 62px;margin-left: 7px;"> 19세 이상</span>
				                </c:if>
				                 <c:if test="${ movie.age_limit eq 0 }">
				                	<span class="ico-grade grade-all"style="margin-top: 62px;margin-left: 7px;"> 0세 이상</span>
				                </c:if>
                            </span>
                        </a>
                    </div>
                    
                    <div class="box-contents">
                        <a href="movie_view?movie_num=${movie.movie_num}">
                            <strong class="title">${movie.movie_name}</strong>
                        </a>

                        <div class="score">
                            <strong class="percent">예매율<span>${movie.reserve_rate}%</span></strong>
                            
                        </div>

                        <span class="txt-info">
                            <strong>
                                ${movie.open_date}
                                <span>개봉</span>
                            </strong>
                        </span>
                        <span class="like"> 
                        <c:set var="heart1" value="0" ></c:set>
						<c:set var="heart2" value="0" ></c:set>
						<c:if test="${ not empty member }">
							<c:forEach items="${wish_list}" var="wish">
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
                            <span class="count"> 
                                <strong><i>${movie.wish}</i><span>명이 선택</span></strong> 
                                <i class="corner-RT"></i><i class="corner-LT"></i><i class="corner-LB"></i><i class="corner-RB"></i><i class="corner-arrow"></i>
                            </span>
                        </c:if>
                        	<a class=""></a>
                            <a class="link-reservation" href="../theater/quickReserve?movie_num=${movie.movie_num}">예매</a>
                        </span>
                        
                    </div>    
                </li>
                
                <c:if test="${count.last }">  </div> </c:if>
            </c:forEach>
            </ol>

            <button class="btn-more-fontbold" id="more_btn" type="button">더보기 <i class="link-more">더보기</i></button>
            
            
        </div>
    </div>
    </form>
	</div>
        	<!-- 내용끝 -->
        	
			</div>
			<!-- ///////////////////////////////// -->
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	</div>
	
</body>
</html>