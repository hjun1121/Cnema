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
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/community/pageInsertList.css">
<script type="text/javascript">
$(function() {
	var search='${search}';
	$("#search").val(search);
	
	$("#sBtn").click(function(){
		var search = $("#search").val();
		location.href="pageAllList?search="+search;
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
			<a href="../${pageScope.pageContext.request.contextPath }community2/pageRecomList"><span id="img_alt">추천 페이지</span></a>
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
	<div id="empty">
		<div style=" height: 5px; margin-left: 700px;     margin-bottom: 40px;">
			<input type="search" name="search" id="search">
			<input type="button" id="sBtn" class="round gray" value="GO">
		</div>
		<c:forEach items="${pageAllList }" var="pageDTO" varStatus="count">
		<div class="roundList">
			<div>
					<a href="../${pageScope.pageContext.request.contextPath }community/pageMain?page_num=${pageDTO.page_num}">
					<img id="rePageImg" alt="${pageDTO.page_name}" src="../resources/page_logo/${pageDTO.fileName}">
					</a>
				</div>
				<div id="roundName">${pageDTO.page_name }</div>
		</div>
		</c:forEach>
		</div>
	</div>
	<c:if test="${fn:length(pageAllList) > 0}"> 
		    	<div class="paging">
					<ul id="paging_point" style="text-align: center;">
						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							<li style="text-decoration: none; display: inline-block; padding: 0 8px; color: #333333; font-family: Verdana, Geneva, sans-serif; font-size: 14px; font-weight: bold; line-height: 28px;" class=" on">
								<a href="pageAllList?curPage=${i}&search=${search}" title="${i}페이지 선택">${i}</a>
							</li>
						</c:forEach>
						<c:if test="${pager.curBlock lt pager.totalBlock}">
							<li class="paging-side">
								<a href="pageAllList?curPage=${pager.lastNum+1}&search=${search}"><button style="line-height: 26px; color: inherit; text-decoration: none;margin-top: 30px;" class="btn-paging next" type="button">다음</button></a>
							</li>
						</c:if>
					</ul>
				</div>
				</c:if>  
</div>
</div>
</div>
<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>