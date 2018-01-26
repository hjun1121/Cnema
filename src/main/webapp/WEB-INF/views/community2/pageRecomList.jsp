<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/community/pageRecomList.css">
<script type="text/javascript">
$(function() {
	var search='${search}';
	$("#search").val(search);
	
	$("#sBtn").click(function(){
		var search = $("#search").val();
		location.href="pageRecomList?search="+search;
	});
});
</script>
</head>
<body>
<div id="cgvwrap"  style="text-align: center; height: auto;">
<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/header.jsp"></c:import>
<div id="container">
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
			<h2><img alt="페이지" src="../resources/images/common/ico/page.png">
			<span id="img_alt">가입한 페이지</span>
			<span id="img_count">· ${fn:length(pageList)}개</span></h2>
			<c:forEach items="${pageList}" var="page" varStatus="i">
			<c:if test="${i.index < 4}">
				<div id="pageList">
					<div>
						<a href="../${pageScope.pageContext.request.contextPath }community/pageMain?page_num=${page.page_num}">
						<img id="pageImg"  alt="${page.page_name}_logo" src="../resources/page_logo/${page.fileName}">
						</a>
					</div>
					<div id="pageName"> ${page.page_name}</div>
				</div>
			</c:if>
			</c:forEach>
		</div>
		</c:if>
		
		<!-- 추천 페이지 LIST -->
		<div id="myJoinList">
			<h2><img alt="페이지" src="../resources/images/common/ico/page.png">
			<span id="img_alt">추천 페이지</span>
			</h2>
			<c:forEach items="${recommendPage}" var="recommend" varStatus="i">
			<c:if test="${i.index < 4}">
				<div id="pageList">
					<div>
					<a href="../${pageScope.pageContext.request.contextPath }community/pageMain?page_num=${recommend.page_num}">
					<img id="pageImg"alt="${recommend.page_name}_logo" src="../resources/page_logo/${recommend.fileName}">
					</a>
					</div>
					<div id="pageName"> ${recommend.page_name}</div>
				</div>
			</c:if>
			</c:forEach>
		</div>
	</div>
	<!-- 프로필 바 끝 -->
</div> 

<div id="infoBody">
	<div id="joinBody">
		<div>
			<input type="search" name="search" id="search">
			<input type="button" id="sBtn" class="round gray" value="GO">
		</div>
		<c:forEach items="${recomPageSearchList}" var="recommendSearch">
				<div id="pageList">
					<div>
					<a href="../${pageScope.pageContext.request.contextPath }community/pageMain?page_num=${recommendSearch.page_num}">
					<img id="pageImg"alt="${recommendSearch.page_name}_logo" src="../resources/page_logo/${recommendSearch.fileName}">
					</a>
					</div>
					<div id="pageName"> ${recommendSearch.page_name}</div>
				</div>
			</c:forEach>
	</div>
</div>
</div>
</div>
<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>
<%-- <div style="width: 60%; height: 1080px; background-color: #f0f0f0; margin: 0 auto; margin-top: 30px;">
	<div>
		<input type="search" name="search" id="search">
		<input type="button" id="sBtn" class="round gray" value="GO">
	</div>
	<c:forEach items="${recomPageList }" var="pageDTO">
		<div style="display: inline-block; float: left; border: 1px solid #dddfe2; margin-left: 35px; height: 282px; margin: 0 12px 12px 0; background-color: white;">
			<div>
				<img alt="${pageDTO.page_name}" src="../resources/page_logo/${pageDTO.fileName}" style="width: 222px; height: 222px;">
			</div>
			<div style="margin-top: 10px;">
				<input type="text" name="page_name" value="${pageDTO.page_name }"
				style="color: #1d2129; display: inline-block; font-size: 14px; font-weight: bold; border: none;"><br>
				<input type="button" id="pageInsert" value="가입하기" style="display: inline-block; margin-left: 130px; background-color: #e9ebee; color: #4b4f56; border: 1px solid #ced0d4; border-radius: 2px;">
			</div>
		</div>
	</c:forEach>
</div> --%>
