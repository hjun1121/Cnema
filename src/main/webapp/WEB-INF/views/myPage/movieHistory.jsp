<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>나의 예매 내역</title>
<script type="text/javascript">
$(function(){
	var kind='${kind}';
	$(".kind").each(function(){
		if($(this).val()==kind){
			$(this).attr("selected",true);
		}
	});
	$("#date_search").click(function(){
		var sKind = $("#kind").val();
		location.href="./movieHistory?kind="+sKind;
	});
	$("#reviewBtn").click(function(){
		var movie_num = $("#movie_num").val();
		window.open("movieReview?movie_num="+movie_num,"평점작성","width=800,height=700,toolbar=no");
	});
});
</script>
</head>
<body>
<h3>나의 예매 내역${fn:length(rList)}건</h3> 
	<form action="movieHistory" method="POST">
		<div>
			<select id="kind">
				<option class = "kind" value="2013">2013</option>
				<option class = "kind" value="2014">2014</option>
				<option class = "kind" value="2015">2015</option>
				<option class = "kind" value="2016">2016</option>
				<option class = "kind" value="2017">2017</option>
				<option class = "kind" value="2018" selected="selected">2018</option>
			</select>
			<input type="button" id="date_search" value="GO">
		</div>
		<c:forEach items="${rList}" var="reserveList">
			<input type="hidden" id="movie_num" name="movie_num" value="${reserveList.movieDTO.movie_num }">
			<input type="text" id="reserve_num" name="reserve_num" value='${reserveList.reserve_num}'>
			사진 : <img alt='${reserveList.movieDTO.movie_name}' src='/resource/movie/${reserveList.movieDTO.fileName}'><br>
			<a href="../movie/movie_view?movie_num=${reserveList.movieDTO.movie_num }">영화명: ${reserveList.movieDTO.movie_name}<br></a>
			날짜 : ${reserveList.scheduleDTO.day}<br>
			시간 :<fmt:formatDate value="${reserveList.scheduleDTO.in_time}" type="time" pattern="HH:mm"/>
			~<fmt:formatDate value="${reserveList.scheduleDTO.out_time}" type="time" pattern="HH:mm"/><br>
			지점 : ${reserveList.theater_num }<br>
			상영관 번호 : ${reserveList.screen_num }<br>
			몇명 : ${reserveList.ticketPriceDTO.people}<br>
			<button>x</button><br>
			<input type="button" id="reviewBtn" value="이 영화를 평가해 주세요"><br>
			------ <br>
		</c:forEach>
	</form>
</body>
</html>