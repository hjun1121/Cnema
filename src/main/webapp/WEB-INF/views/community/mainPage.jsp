<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>CNEMAGRAM</title>

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
<div style="width: 300px; height: auto; background-color: red; margin-left: 50px; display: inline-block; float: left; margin-top: 30px; text-align: center;">
	<div style = "width: 250px; margin: 25px auto; background-color: #b6d287;">
		<!-- 프로필 사진  -->
		<div style="float: left; margin: 0 30px 30px 0;">
			<c:choose>
				<c:when test="${not empty member}"><img style="width: 100px; margin-right: 30px;" alt="사용자 프로필" src='../resources/profil/${member.fileName}'> ${member.id}</c:when>
				<c:otherwise><img style="width: 100px; margin-right: 30px;" alt="기본프로필" src="../resources/profil/defaultProfile.jpg">
					<a href="../member/memberLogin"><input type="button" name = "login_btn" id = "login_btn" value="로그인"></a>
				</c:otherwise>
			</c:choose>
		</div>
<!-- 		<!-- 내가 가입한 페이지 LIST -->
<!-- 		<div style="clear: both; border: 1px solid #f0f0f0; height: 300px; background-color: #433b90; margin-bottom: 30px;"> -->
<%-- 			<c:forEach items="${pageList}" var="page"> --%>
<%-- 				<p><img style="width: 100px; margin-right: 30px;" alt="${page.page_name}_logo" src="../resources/community_logo/${page.fileName}"></p> --%>
<%-- 				<p>${page.page_name}</p> --%>
<%-- 			</c:forEach> --%>
<!-- 		</div> -->
<!-- 		<!-- 추천 페이지 LIST -->
<!-- 		<div style="clear: both; border: 1px solid #dcdcdc; height: 300px; background-color: yellow;"> -->
<%-- 			<c:forEach items="${recommendPage}" var="recommend" begin="1" end="3"> --%>
<%-- 				<p><img style="width: 100px; margin-right: 30px;" alt="${recommend.page_name}_logo" src="../resources/community_logo/${recommend.fileName}"></p> --%>
<%-- 				<p>${recommend.page_name}</p> --%>
<%-- 			</c:forEach> --%>
<!-- 		</div> -->
	</div>
	<!-- 프로필 바 끝 -->
</div> 

<div style="width: 980px; height: 1080px; background-color: #f0f0f0; margin: 0 auto; margin-top: 30px;">
	<c:if test="${not empty member}">
		<a href="./pageInsert"><input type="button" value="페이지 만들기"></a>
	</c:if>
</div>

</div>
<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>