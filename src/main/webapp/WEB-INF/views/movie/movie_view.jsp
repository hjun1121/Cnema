<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${movie.movie_name} &gt; 상세정보</title>

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/script/main.js"></script>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/main/slide.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/main/main.css">

<script type="text/javascript">

	$(function() {
		
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

</script>
</head>
<body>
<div id="cgvwrap"  style="text-align: center;">
<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/header.jsp"></c:import>
<div style="width: 980px; margin: 0 auto;">
<div style="height: 51px; margin-top: 30px; border-bottom: 3px solid #241d1e;">
	<h2 style="font-size: 38px; text-align: left; font-weight: bold; color: #222;">영화상세</h2>
</div>

<div style="margin-top: 40px;">
	<div style="margin-right: 30px; float: left;">
		<img alt="${movie.movie_name} 포스터" src='../resources/movie_poster/${movie.fileName}'>
	</div>
	<div style="width: 765px; float: left; text-align: left;">
		<div class="title"><strong style="color: #1a1919; font-size: 25px; font-family: 'NanumBarunGothicBold', sans-serif;">${movie.movie_name}</strong></div>
	</div>
	<div style="margin-top: 25px; padding-bottom: 10px; font-size: 14px; text-align: left; display: block;">
		<strong style="font-family: 'NanumBarunGothicBold', sans-serif; float: left;">
			예매율&nbsp;
			<span style="font-family: Verdana, Geneva, sans-serif; color: #333333; font-size: 12px;">${movie.reserve_rate}%</span>
		</strong>
	</div>
	<br><br><br><br>
	<div style="width: 765px; padding-top: 18px; line-height: 1.6; font-size: 13px; font-family: 'NanumBarunGothicBold'; text-align: left; border-top:1px solid #d9d6c8; float: right;">
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
	<div style="text-align: left;">
	<span class="wish" style="margin-top: 22px; display: inline-block; margin-right: 3px;">
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
					<input type="button" class="wish_btn" value="♡" name="${movie.movie_num}" title="0"
					style="display: inline-block; width: 30px; height: 28px;">
				</c:if>
			${movie.wish}
			</c:if>
			<c:if test="${empty member }">
					<a href="../member/memberLogin"><input type="button" class="wish_btn" value="♡" name="${movie.movie_num}" title="0"
					style="display: inline-block; width: 30px; height: 28px;"></a>
			</c:if>
		<span style="display: inline-block; height: 28px; margin-right: 4px; line-height: 28px; position: relative;">
			<strong style="display: inline-block; padding: 0 7px; border: 1px solid #999999; color: #717171;">${movie.wish}</strong>
		</span>
		<a href="" style="display: inline-block; width: 91px; height: 35px;"><input type="button" value="예매"></a>
	</span>
	</div>
</div>

<div style="margin-top: 50px; margin-bottom:30px; width: 800px; float: left; text-align: left; color: #333333; line-height: 2; font-size: 12px;">
	${movie.contents}
</div>

<div style="margin-bottom: 20px;width: 100%; height: 39px; background: #e2e0d2; clear:both;">
	<h4 style="float: left; margin-left: 16px; line-height: 39px; color: #333333; font-size: 13px; letter-spacing: -1px;">트레일러</h4>
	
</div>
<iframe width="560" height="315" src="${movie.teaser_url}"></iframe>
	
<!-- 	<table> -->
<%-- 		<tr><td><img alt="${movie.movie_name} 포스터" src='../resources/movie_poster/${movie.fileName}'></td></tr> --%>
<%-- 		<tr><td>${movie.movie_name}</td></tr> --%>
<%-- 		<tr><td>예매율 : ${movie.reserve_rate}</td></tr> --%>
<%-- 		<tr><td>장르 : ${movie.type}</td></tr> --%>
<%-- 		<tr><td>개봉일 : ${movie.open_date}</td></tr> --%>
<%-- 		<c:set var="heart1" value="0" ></c:set> --%>
<%-- 		<c:set var="heart2" value="0" ></c:set> --%>
<!-- 							<tr> -->
<%-- 							<c:if test="${ not empty member }"><c:forEach items="${wish_list}" var="wish"> --%>
<%-- 								<c:if test="${wish.movie_num eq movie.movie_num}">										 --%>
<%-- 									<c:choose> --%>
<%-- 										<c:when test="${heart1 == 0}"> --%>
<%-- 											<td><input type="button" class="wish_btn"  value="❤" name="${movie.movie_num}" title="1"></td> --%>
<%-- 											<c:set var="heart1" value="1" ></c:set> --%>
<%-- 											<c:set var="heart2" value="1" ></c:set> --%>
<%-- 										</c:when> --%>
<%-- 									</c:choose> --%>
<%-- 								</c:if> --%>
<%-- 							</c:forEach> --%>
<%-- 								<c:if test="${heart2 == 0}"> --%>
<%-- 									<td><input type="button" class="wish_btn" value="♡" name="${movie.movie_num}" title="0"></td> --%>
<%-- 								</c:if> --%>
<%-- 							<td>${movie.wish}</td> --%>
<%-- 							</c:if> --%>
<!-- 							</tr> -->
<%-- 		<c:if test="${not empty member }"><tr><td><input type="button" id="reserveBtn" value="예매"></td></tr></c:if> --%>
<%-- 		<tr><td>${movie.contents}</td></tr> --%>
<%-- 		<tr><td><iframe width="560" height="315" src="${movie.teaser_url}"></iframe></td></tr> --%>
<%-- 		<tr><td>평점 : ${movie.grade}</tr> --%>
<!-- 	</table> -->
</div>
</div>
<hr>
<div style="height: 200px;"></div>
<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>	
</body>
</html>