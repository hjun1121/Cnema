<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	var message = '${message}';
	if(message != ""){
		alert(message);
	}

</script>

</head>
	<title> CNEMA</title>
<body>
	
<<<<<<< HEAD
	<!-- 현민_영화 -->
	<a href="">무비차트</a>
	<a href="">리뷰</a>

	<!-- 형준꺼 -->
<<<<<<< HEAD
	<a href="">빠른예매</a>
	<a href="">상영시간표</a>
=======
	<a href="theater/quickReserve">빠른예매</a>
	<a href="theater/scheduleList">상영시간표</a>
>>>>>>> parent of 2a9e146... quick reserve
=======
	<a href="home/kim">김</a>
	<a href="home/lee">이</a>
	<a href="home/ssin">신</a>
	<a href="home/jang">장</a>
	<a href="home/park">박</a>
	<br>
>>>>>>> 92133f6d028a1e29d235d43508939d4327e73dd7
	
	<c:if test="${empty member }">
		<a href="member/memberJoin">Join</a>
		<a href="member/memberLogin">Login</a>
		<a href="member/idFind">Id Find</a>
		<a href="member/pwFind">Pw Find</a>
	</c:if>	
	<c:if test="${!empty member }">
<<<<<<< HEAD

	<h2>${member.id } 님 환영합니다</h2>
		<a href="member/myPageView?id=${member.id }">My Page</a>

=======
		<img height="100px" width="100px" src="resources/profil/${member.fileName }">
		<a href="member/myPageView?id=${member.id }">My Page</a>
>>>>>>> 92133f6d028a1e29d235d43508939d4327e73dd7
		<a href="member/memberLogout">Logout</a>
	</c:if>
</body>
</html>