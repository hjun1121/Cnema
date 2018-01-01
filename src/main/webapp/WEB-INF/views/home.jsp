<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
</head>
	<title> CNEMA</title>
<body>
	
	<a href="home/kim">김</a>
	<a href="home/lee">이</a>
	<a href="home/ssin">신</a>
	<a href="home/jang">장</a>
	<a href="home/park">박</a>
	<br>
	
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

