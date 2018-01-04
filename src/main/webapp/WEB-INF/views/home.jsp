<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">

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

<div id="cgvwrap">
<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/header.jsp"></c:import>
	<!-- 띄움 -->
    <div id="ctl00_sect_txt_banner" class="sect_txt_banner"><div class="inner"></div></div>
	<!-- 띄움 -->

<iframe width="560" height="315" src="https://www.youtube.com/embed/5O5PVvHTWRo" ></iframe>
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

	<h2>${member.id } 님 환영합니다</h2>
		<img height="100px" width="100px" src="resources/profil/${member.fileName }">
		<a href="member/myPageView?id=${member.id }">My Page</a>
		<a href="member/memberLogout">Logout</a>
	</c:if>
	
<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>	
</div>
</body>
</html>