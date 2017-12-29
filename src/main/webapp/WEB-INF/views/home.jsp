<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
</head>
	<title>영화 그이상의 감동. CNEMA</title>
<body>
	
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

 