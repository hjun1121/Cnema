<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
<div id="cgvwrap"  style="text-align: center; height: auto;">
<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/header.jsp"></c:import>
<div id="container">
<!-- 왼측 프로필 고정 바  -->
<div id="left_bar">
	<div id="left_bar2">
		<!-- 프로필 사진  -->
		<div id="profile">
			<c:choose>
				<c:when test="${not empty member}"><img id="profile_img"alt="사용자 프로필" src='../resources/profil/${member.fileName}'><span>${member.id}</span></c:when>
				<c:otherwise>
					<a href="../member/memberLogin"><input type="button" value="로그인 후 이용해주세요."></a>
				</c:otherwise>
			</c:choose>
		</div>
		
		
		<!-- 내가 가입한 페이지 LIST -->
		<c:if test="${not empty member}">
		<div id="myJoinList">
			<h2><img alt="페이지" src="../resources/images/common/ico/page.png">
			<a href="../${pageScope.pageContext.request.contextPath }community2/pageInsertList"><span id="img_alt">가입한 페이지</span></a>
			</h2>
			<c:forEach items="${pageList}" var="page" varStatus="i">
			<c:if test="${i.index < 4}">
				<div id="pageList">
					<p style="padding-left: 10px;">
						<a href="../${pageScope.pageContext.request.contextPath }community/pageMain?page_num=${page.page_num}">
						<img style="width: 50px; height: 50px; border-radius: 100px; margin-bottom: 15px;"  alt="${page.page_name}_logo" src="../resources/page_logo/${page.fileName}">
						</a>
					<span style="display: inline-block; width: 120px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"> ${page.page_name}</span>
					</p>
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
					<p style="padding-left: 10px;">
					<a href="../${pageScope.pageContext.request.contextPath }community/pageMain?page_num=${recommend.page_num}">
					<img style="width: 50px; height: 50px; border-radius: 100px; margin-bottom: 15px;" alt="${recommend.page_name}_logo" src="../resources/page_logo/${recommend.fileName}">
					</a>
					<span style="display: inline-block; width: 120px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"> ${recommend.page_name}</span>
					</p>
				</div>
			</c:if>
			</c:forEach>
		</div>
	</div>
	<!-- 프로필 바 끝 -->
</div> 

<div id="infoBody">
	<!-- 가입한 페이지  -->
	<div id="joinBody">
		<div><input type="button" value="+더보기" id="moreInsertBtn"></div>
		<c:forEach items="${myPageList}" var="page" varStatus="i">
			<c:if test="${i.index < 4}">
				<div id="roundList">
					<div>
					<a href="../${pageScope.pageContext.request.contextPath }community/pageMain?page_num=${page.page_num}">
					<img id="rePageImg" alt="${page.page_name}" src="../resources/page_logo/${page.fileName}">
					</a>
					</div>
					<div id="roundName"> ${page.page_name}</div>
				</div>
			</c:if>
		</c:forEach>
	</div>
	<!-- 추천 페이지 -->
	<div id="recommendBody">
		<div><input type="button" value="+더보기" id="moreBtn"></div>
		<c:forEach items="${recommendPage}" var="recommend" varStatus="i">
			<c:if test="${i.index < 4}">
				<div id="roundList">
					<div>
					<a href="../${pageScope.pageContext.request.contextPath }community/pageMain?page_num=${recommend.page_num}">
					<img id="rePageImg" alt="${recommend.page_name}" src="../resources/page_logo/${recommend.fileName}">
					</a>
					</div>
					<div id="roundName"> ${recommend.page_name}</div>
				</div>
			</c:if>
		</c:forEach>
	</div>
</div>
</div>
</div>
<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>