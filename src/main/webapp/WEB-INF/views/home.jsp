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
<iframe width="560" height="315" src="https://www.youtube.com/embed/5O5PVvHTWRo" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>
	<a href="home/kim">김</a>
	<a href="home/lee">이</a>
	<a href="home/ssin">신</a>
	<a href="home/jang">장</a>
	<a href="home/park">박</a>
	<br>
	
	<c:if test="${empty member }">
		<a href="member/memberJoin">Join</a>
		<a href="member/memberLogin">Login</a>
		<a href="member/idFind">Id Find</a>
		<a href="member/pwFind">Pw Find</a>
	</c:if>	
	<c:if test="${!empty member }">
		<img height="100px" width="100px" src="resources/profil/${member.fileName }">
		<a href="member/myPageView?id=${member.id }">My Page</a>
		<a href="member/memberLogout">Logout</a>
	</c:if>
</body>
</html>