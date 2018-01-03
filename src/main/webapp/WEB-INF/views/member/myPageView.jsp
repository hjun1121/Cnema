<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MY CNEMA HOME</title>
</head>
<body>
<h1>My Page</h1>
	<!-- 나의 정보 -->
	${myInfo.name}님  ${myInfo.id}<br>
	고객님은 sysdate ${myInfo.type}입니다.<br>
	
	<!-- 나의 포인트 -->
	CJ ONE 사용가능 포인트   ${myInfo.v_point}점<br>
	CJ ONE 누적 포인트 ${myInfo.a_point}점<br>
	
	<!-- 1:1 문의 -->
	<h3>1:1 문의->링크걸기</h3>
	
	<!-- 위시리스트 -->
	<h3>위시 리스트</h3>
	<c:forEach items="${mwList}" var="mList">
		사진 : ${mList.fileName}<br>
		영화명 : ${mList.movie_name}<br>
		개봉일 : ${mList.open_date}<br>
		좋아요수 :${mList.wish}<br>
		예매버튼
	</c:forEach>
	
	<!-- 내가 본 영화 -->
	<h3>내가 본 영화</h3>
<<<<<<< HEAD
	<c:forEach items="${rList}" var="reserveList">
		사진 : ${movieList.fileName }<br>
		영화명:${reserveList.m_num }  <br>
		날짜 :  <br>
		시간 :  ${scheduleList.intime}~${scheduleList.out_time }<br>
		지점 : ${reserveList.t_num }<br>
		상영관 번호 : ${reserveList.screen_num }<br>
		몇명 : ${ticketPList.people } <br>
=======
	<c:forEach items="${allList[0]}" var="rList" varStatus="i">
		사진 : <img alt='${allList["3"][i.index].movie_name}' src='/resource/movie/${allList["3"][i.index].fileName}'><br>
		영화명: ${allList["3"][i.index].movie_name}<br>
		날짜 : ${allList["1"][i.index].day}<br>
		시간 : ${allList["1"][i.index].in_time}~${allList["1"][i.index].out_time}<br>
		지점 : ${rList.theater_num }<br>
		상영관 번호 : ${rList.screen_num }<br>
		몇명 : ${allList["2"][i.index].people}<br>
>>>>>>> 105dd440f72d8446f95b7f275a2e47eed6c35c5e
		------ <br>
	</c:forEach>
	
	<!-- Point내역 -->
	<h3>내가 본 영화</h3>
	<c:forEach items="${pList}" var="pointList">
		구매 구분    구매극장    적립일    적립<br>
		${pointList.theater }  ${pointList.use_day } ${pointList.point_price } ${pointList.type }<br>
		----
	</c:forEach>
</body>
</html>