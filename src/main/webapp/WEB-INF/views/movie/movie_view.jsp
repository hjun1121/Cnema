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
					url: "../ajax/movie_wish",
					type: "POST",
					data: {
						movie_num:movie_num
					},
					success: function(data) {
						alert(data);
					}
				});

			} else if (title == 0) {
				$.ajax({
					url: "../ajax/movie_wish_return",
					type: "POST",
					data: {
						movie_num:movie_num
					},
					success: function(data) {
						alert(data);
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
	<h2 style="font-size: 38px; text-align: left; font-weight: bold; color: #222;">영화상세</h2>
</div>
	<table>
		<tr><td><img alt="${movie.movie_name} 포스터" src='../resources/movie_poster/${movie.fileName}'></td></tr>
		<tr><td>${movie.movie_name}</td></tr>
		<tr><td>예매율 : ${movie.reserve_rate}</td></tr>
		<tr><td>장르 : ${movie.type}</td></tr>
		<tr><td>개봉일 : ${movie.open_date}</td></tr>
		<c:set var="heart1" value="0" ></c:set>
		<c:set var="heart2" value="0" ></c:set>
							<tr>
							<c:if test="${ not empty member }"><c:forEach items="${wish_list}" var="wish">
								<c:if test="${wish.movie_num eq movie.movie_num}">										
									<c:choose>
										<c:when test="${heart1 == 0}">
											<td><input type="button" class="wish_btn"  value="❤" name="${movie.movie_num}" title="1"></td>
											<c:set var="heart1" value="1" ></c:set>
											<c:set var="heart2" value="1" ></c:set>
										</c:when>
									</c:choose>
								</c:if>
							</c:forEach>
								<c:if test="${heart2 == 0}">
									<td><input type="button" class="wish_btn" value="♡" name="${movie.movie_num}" title="0"></td>
								</c:if>
							<td>${movie.wish}</td>
							</c:if>
							</tr>
		<c:if test="${not empty member }"><tr><td><input type="button" id="reserveBtn" value="예매"></td></tr></c:if>
		<tr><td>${movie.contents}</td></tr>
		<tr><td><iframe width="560" height="315" src="${movie.teaser_url}"></iframe></td></tr>
		<tr><td>평점 : ${movie.grade}</tr>
	</table>
</div>
</div>
<br>
<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>	
</body>
</html>