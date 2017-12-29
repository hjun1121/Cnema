<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
</head>
	<title>영화 그이상의 감동. CNEMA</title>
<body>
	
	<!-- 현민_영화 -->
	<a href="">무비차트</a>
	<a href="">리뷰</a>

	<!-- 형준꺼 -->
	<a href="">빠른예매</a>
	<a href="">상영시간표</a>
	
	<c:if test="${empty member }">
		<a href="member/memberJoin">Join</a>
		<a href="member/memberLogin">Login</a>
	</c:if>	
	<c:if test="${!empty member }">
		<a href="member/myPageView?id=${member.id }">My Page</a>
		<a href="member/memberLogout">Logout</a>
	</c:if>
</body>
</html>

