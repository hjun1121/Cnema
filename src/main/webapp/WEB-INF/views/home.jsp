<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
</head>
	<title>미안... CNEMA</title>
<body>
	
	<!-- 지현 -->
	<a href="temp/header">header</a>
	<a href="temp/footer">footer</a>
	
	<!-- íë¯¼_ìí -->
	<a href="">UTF-8</a>
	<a href="">변경을</a>

	<!-- íì¤êº¼ -->
	<a href="theater/quickReserve">빠른예매</a>
	<a href="theater/scheduleList">영화상영표ㅓ</a>
	
	<c:if test="${empty member }">
		<a href="member/memberJoin">Join</a>
		<a href="member/memberLogin">Login</a>
	</c:if>	
	<c:if test="${!empty member }">
		<a href="member/myPageView">My Page</a>
		<a href="member/memberLogout">Logout</a>
	</c:if>
</body>
</html>

