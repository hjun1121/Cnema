<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CNEMAGRAM</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/main/slide.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/main/main.css">

<script type="text/javascript">

	$(function() {
		

		$("#login_btn").click(function() {
		});
		
		
	});

</script>

</head>
<body>
<div id="cgvwrap"  style="text-align: center;">
<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/header.jsp"></c:import>
<!-- 왼측 프로필 고정 바  -->
<div style="width: 15%; height: auto; margin-left: 50px; display: inline-block; float: left; margin-top: 30px; text-align: center; background-color: #dcdcdc;">
	<div style = "width: 90%; margin: 25px auto;">
		<!-- 프로필 사진  -->
		<div style="float: left; margin: 0 30px 30px 0;">
			<c:choose>
				<c:when test="${not empty member}"><img style="width: 60%; margin-right: 5px;" alt="사용자 프로필" src='../resources/profil/${member.fileName}'> ${member.id}</c:when>
				<c:otherwise><img style="width: 60%; margin-right: 5px;" alt="기본프로필" src="../resources/profil/defaultProfile.jpg">
					<a href="../member/memberLogin"><input type="button" name = "login_btn" id = "login_btn" value="로그인"></a>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- 내가 가입한 페이지 LIST -->
		<c:if test="${not empty member}">
		<div style="clear: both; border: 1px solid #f0f0f0; height: 300px;">
			<h2 style="font-size: 20px; color: #333333;">가입한 페이지</h2>
			<br>
			<c:forEach items="${pageList}" var="page">
				<a href="pageMain?page_num=${page.page_num}"><img style="width: 30%; margin-right: 30px;" alt="${page.page_name}_logo" src="../resources/page_logo/${page.fileName}"> ${page.page_name}</a>
			</c:forEach>
		</div>
		</c:if>
		<!-- 추천 페이지 LIST -->
		<div style="clear: both; border: 1px solid #f0f0f0; height: 300px; margin-top: 10px;">
			<h2 style="font-size: 20px; color: #333333;">추천 페이지</h2>
			<br>
			<c:forEach items="${recommendPage}" var="recommend" varStatus="i">
				<c:if test="${i.index < 3}">
					<a href="pageMain?page_num=${recommend.page_num}"><p><img style="width: 30%; margin-right: 30px;" alt="${recommend.page_name}_logo" src="../resources/page_logo/${recommend.fileName}"> ${recommend.page_name}</p></a>
				</c:if>
			</c:forEach>
		</div>
	</div>
	<!-- 프로필 바 끝 -->
</div> 

<div style="width: 60%; height: 1080px; background-color: #f0f0f0; margin: 0 auto; margin-top: 30px;">
	<c:if test="${not empty member}">
		<a href="./pageInsert"><input type="button" value="페이지 만들기"></a>
	</c:if>
	<!-- 가입항 페이지  -->
	<div style="height: 50%; background-color: blue;">
		<c:forEach items="${pageList}" var="page" varStatus="count">
						
		</c:forEach>
	</div>
	<div style="height: 50%; background-color: orange;">
	</div>
</div>

</div>
<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>