<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 예매 내역</title>
</head>
<body>
<h3>나의 예매 내역</h3>
	<form action="movieHistory" method="POST">
		<!-- <div>
			<select id="kind">
				<option class = "kind" value="2013">2013</option>
				<option class = "kind" value="2013">2014</option>
				<option class = "kind" value="2013">2015</option>
				<option class = "kind" value="2013">2016</option>
				<option class = "kind" value="2013">2017</option>
			</select>
			<input type="button" id="date_search" value="GO">
		</div> -->
		<c:forEach items="${allList[0]}" var="rList" varStatus="i">
			<input type="text" id="reserve_num" name="reserve_num" value='${rList.reserve_num}'>
			사진 : <img alt='${allList["3"][i.index].movie_name}' src='/resource/movie/${allList["3"][i.index].fileName}'><br>
			<a href="">영화명: ${allList["3"][i.index].movie_name}<br></a>
			날짜 : ${allList["1"][i.index].day}<br>
			시간 : ${allList["1"][i.index].in_time}~${allList["1"][i.index].out_time}<br>
			지점 : ${rList.theater_num }<br>
			상영관 번호 : ${rList.screen_num }<br>
			몇명 : ${allList["2"][i.index].people}<br>
			<button>x</button>
			------ <br>
		</c:forEach>
	</form>
</body>
</html>