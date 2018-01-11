<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>무비차트</title>

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/script/main.js"></script>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/main/slide.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/main/main.css">

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
																
	});

</script>
</head>
<body>
<div id="cgvwrap"  style="text-align: center;">
<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/header.jsp"></c:import>
<div style="width: 980px; margin: 0 auto;">
<div style="height: 51px; margin-top: 30px; border-bottom: 3px solid #241d1e;">
	<h2 style="font-size: 38px; text-align: left; font-weight: bold; color: #222;">무비차트</h2>
</div>

<form action="movie_chart" name="frm" method="GET">

	<input type="button" id="kind_btn" value="GO" style="float: right; height: 29px; color: #7b7b7b; border: 2px solid #7b7b7b; margin-top: 2">
	<select id="kind" name="kind" style="float: right;  font-size: 12px; height: 29px; border: 1px solid #b4b3aa; padding: 3px 10px; margin-top: 20px;">
		<option class="kind" title="현재 선택됨" selected="selected" value="reserve_rate">예매율순</option>
		<option class="kind" value="grade">평점순</option>
		<option class="kind" value="open_date">최신순</option>
		<option class="kind" value="wish">볼래요순</option>
	</select>
	
	<c:forEach items="${movie_list}" var="movie">
	<div style="width: 300px; height: 375px; display:block;">
	<div style="margin-top: 30px;">
		<ol style="padding-top: 0px; margin-left: -64px; border-bottom: 3px solid #241d1e; list-style: none;">
			<li style="float: left; width: 197px; margin-left: 64px; padding-bottom: 30px;">
				<div style="margin-bottom: 10px; min-height: 272px;">
					<a href="movie_view?movie_num=${movie.movie_num}" style="display: block;">
						<span style="border: 6px solid #000000; display: block;">
							<img alt="${movie.movie_name} 포스터" src='../resources/movie_poster/${movie.fileName}'>
						</span>
					</a>
				</div>
			</li>
		</ol>
	</div>
	<div style="height: 93px;">
		<a href="movie_view?movie_num=${movie.movie_num}">
			<strong style="font-size: 15px;">${movie.movie_name}</strong>
		</a>
	</div>
	<div style="margin-top: 7px; font-size: 11px;">
		<strong style="vertical-align: middle;">
			예매율
			<span style="vertical-align: initial; margin-left: 10px;">${movie.reserve_rate}</span>
		</strong>
	</div>
	<span style="margin-top: 3px; height: 13px; color: #666666; font-size: 11px; display: block;">
		<strong>
			${movie.open_date}
			<span>개봉</span>
		</strong>
	</span>
	<span style="display: block; margin-top: 10px; text-align: center;">
		<c:set var="heart1" value="0" ></c:set>
		<c:set var="heart2" value="0" ></c:set>
		<c:if test="${ not empty member }"><c:forEach items="${wish_list}" var="wish">
			<c:if test="${wish.movie_num eq movie.movie_num}">										
				<c:choose>
					<c:when test="${heart1 == 0}">
						<input style="width: 23px; height: 23px; background-position: -60px -66px;" type="button" class="wish_btn"  value="❤" name="${movie.movie_num}" title="1">
						<c:set var="heart1" value="1" ></c:set>
						<c:set var="heart2" value="1" ></c:set>
					</c:when>
				</c:choose>
			</c:if>
		</c:forEach>
			<c:if test="${heart2 == 0}">
				<input style="width: 23px; height: 23px; background-position: -60px -66px;" type="button" class="wish_btn" value="♡" name="${movie.movie_num}" title="0">
			</c:if>
		</c:if>
	</span>
	<span style="height: 25px; line-height: 23px; margin-right: 4px;">
		<strong style="border: 1px solid #999999; display: inline-block; padding: 0 4px;">
			<i>${movie.wish}</i>
		</strong>
	</span>
	<a href="" style="width: 57px; height: 25px; background-position: -96px 0px;">예매</a>
	
	</div>
	</c:forEach>
	
<!-- 	<select id="kind"> -->
<!-- 		<option class = "kind" value="reserve_rate">예매율순</option> -->
<!-- 		<option class = "kind" value="grade">평점순</option> -->
<!-- 		<option class = "kind" value="open_date">개봉일순</option> -->
<!-- 	</select> -->
<!-- 	<input type="button" id="kind_btn"> -->

<%-- 	<c:forEach items="${movie_list}" var = "movie"> --%>
<!-- 	<table> -->
<%-- 		<tr><td><img alt="${movie.movie_name} 포스터" src='../resources/movie_poster/${movie.fileName}'></td></tr> --%>
<%-- 		<tr><td><a href = "movie_view?movie_num=${movie.movie_num}">${movie.movie_name}</a></td></tr> --%>
<%-- 		<tr><td>예매율 : ${movie.reserve_rate}</td></tr> --%>
<%-- 		<tr><td>장르 : ${movie.type}</td></tr> --%>
<%-- 		<tr><td>개봉일 : ${movie.open_date}</td></tr> --%>
<%-- 		<c:set var="heart1" value="0" ></c:set> --%>
<%-- 		<c:set var="heart2" value="0" ></c:set> --%>
<%-- 							<c:if test="${ not empty member }"><c:forEach items="${wish_list}" var="wish"> --%>
<%-- 								<c:if test="${wish.movie_num eq movie.movie_num}">										 --%>
<%-- 									<c:choose> --%>
<%-- 										<c:when test="${heart1 == 0}"> --%>
<%-- 											<tr><td><input type="button" class="wish_btn"  value="❤" name="${movie.movie_num}" title="1"></td></tr> --%>
<%-- 											<c:set var="heart1" value="1" ></c:set> --%>
<%-- 											<c:set var="heart2" value="1" ></c:set> --%>
<%-- 										</c:when> --%>
<%-- 									</c:choose> --%>
<%-- 								</c:if> --%>
<%-- 							</c:forEach> --%>
<%-- 								<c:if test="${heart2 == 0}"> --%>
<%-- 									<tr><td><input type="button" class="wish_btn" value="♡" name="${movie.movie_num}" title="0"></td></tr> --%>
<%-- 								</c:if> --%>
<%-- 							</c:if> --%>
<!-- 		<tr><td><input type="button" id="reserveBtn" value="예매"></td></tr> -->
<%-- 		<tr><td>${movie.contents}</td></tr> --%>
<%-- 		<tr><td><iframe width="560" height="315" src="${movie.teaser_url}"></iframe></td></tr> --%>
<%-- 		<tr><td>평점 : ${movie.grade}</tr> --%>
<!-- 	</table> -->
<!-- 	<hr> -->
<%-- 	</c:forEach> --%>

</form>
</div>
</div>

<br>
<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>	
</body>
</html>


