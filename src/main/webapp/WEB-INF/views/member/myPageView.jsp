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
	
	<!-- 위시리스트 -->
	
	<!-- 내가 본 영화 -->
	<h3>내가 본 영화</h3>
	<c:forEach items="${rList}" var="rList">
		사진 : <br>
		영화명:${rList.m_num }  <br>
		날짜 :  <br>
		시간 :  ${rList.schedule_num }<br>
		지점 : ${rList.t_num }<br>
		상영관 번호 : ${rList.screen_num }<br>
		몇명 :  <br>
		------ <br>
	</c:forEach>
</body>
</html>