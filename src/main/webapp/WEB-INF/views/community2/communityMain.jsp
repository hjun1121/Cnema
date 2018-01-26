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
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/community/communityMain.css">

<script type="text/javascript">
$(function() {
	$("#sBtn").click(function(){
		var search = $("#search").val();
		location.href="communityMain?search="+search;
	});
	
	$("#moreBtn").click(function(){
		location.href="pageRecomList";
	});
	
	$("#moreInsertBtn").click(function(){
		location.href="pageInsertList";
	});
});
</script>

</head>
<body>
<div id="cgvwrap">
<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/header.jsp"></c:import>
<!-- 왼측 프로필 고정 바  -->
<div id="left_bar">
	<div id="left_bar2">
		<!-- 프로필 사진  -->
		<div id="profile">
			<c:choose>
				<c:when test="${not empty member}"><img id="profile_img"alt="사용자 프로필" src='../resources/profil/${member.fileName}'> ${member.id}</c:when>
				<c:otherwise>
					<a href="../member/memberLogin"><input type="button" value="로그인 후 이용해주세요."></a>
				</c:otherwise>
			</c:choose>
		</div>
		
		
		<!-- 내가 가입한 페이지 LIST -->
		<c:if test="${not empty member}">
		<div id="myJoinList">
			<h2 >가입한 페이지</h2>
			<c:forEach items="${pageList}" var="page">
			<div>
				<a href="../${pageScope.pageContext.request.contextPath }community/pageMain?page_num=${page.page_num}">
				<img id="pageImg" alt="${page.page_name}_logo" src="../resources/page_logo/${page.fileName}">
				</a>
			</div>
			<div id="pageName"> ${page.page_name}</div>
			</c:forEach>
		</div>
		</c:if>
		
		<!-- 추천 페이지 LIST -->
		<div id="recommendList">
			<h2>추천 페이지</h2>
			<br>
			<c:forEach items="${recommendPage}" var="recommend" varStatus="i">
				<c:if test="${i.index < 3}">
					<a href="../${pageScope.pageContext.request.contextPath }community/pageMain?page_num=${recommend.page_num}"><p><img style="width: 30%; margin-right: 30px;" alt="${recommend.page_name}_logo" src="../resources/page_logo/${recommend.fileName}"> ${recommend.page_name}</p></a>
				</c:if>
			</c:forEach>
		</div>
	</div>
	<!-- 프로필 바 끝 -->
</div> 

<div id="infoBody">
	<!-- 가입한 페이지  -->
	<div id="joinBody">
		<input type="button" value="+더보기" id="moreInsertBtn"><br>
		<c:forEach items="${myPageList}" var="page" varStatus="count">
			<img alt="${page.page_name}" src="../resources/page_logo/${page.fileName}">
			${page.page_name}
		</c:forEach>
	</div>
	<!-- 추천 페이지 -->
	<div id="recommendBody">
		<input type="button" value="+더보기" id="moreBtn"><br>
		<c:forEach items="${recommendPage}" var="recommend">
			<img alt="${recommend.page_name}" src="../resources/page_logo/${recommend.fileName}">
			${recommend.page_name}
		</c:forEach>
	</div>
</div>
</div>
<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>