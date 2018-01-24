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
	var search='${search}';
	$("#search").val(search);
	
	$("#sBtn").click(function(){
		var search = $("#search").val();
		location.href="pageRecomList?search="+search;
	});
});
</script>
<div id="cgvwrap"  style="text-align: center;">
<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/header.jsp"></c:import>
<!-- 왼측 프로필 고정 바  -->
<div style="width: 15%; height: auto; margin-left: 50px; display: inline-block; float: left; margin-top: 30px; text-align: center; background-color: #dcdcdc;">
	<div style = "width: 90%; margin: 25px auto;">
	
		<!-- 프로필 사진  -->
		<div style="float: left; margin: 0 30px 30px 0;">
			<c:choose>
				<c:when test="${not empty member}"><img style="width: 60%; margin-right: 5px;" alt="사용자 프로필" src='../resources/profil/${member.fileName}'> ${member.id}</c:when>
				
				<c:otherwise><!-- <img style="width: 60%; margin-right: 5px;" alt="기본프로필" src="../resources/profil/defaultProfile.jpg"> -->
					<a href="../member/memberLogin"><input type="button" value="로그인 후 이용해주세요."></a>
				</c:otherwise>
			</c:choose>
		</div>
		
		
		<!-- 내가 가입한 페이지 LIST -->
		<c:if test="${not empty member}">
		<div style="clear: both; border: 1px solid #f0f0f0; height: 300px;">
			<h2 style="font-size: 20px; color: #333333;">가입한 페이지</h2>
			<br>
			<c:forEach items="${myPageList}" var="page">
				<a href="${pageScope.pageContext.request.contextPath }/pageMain?page_num=${page.page_num}"><img style="width: 30%; margin-right: 30px;" alt="${page.page_name}_logo" src="../resources/page_logo/${page.fileName}"> ${page.page_name}</a>
			</c:forEach>
		</div>
		</c:if>
		
		<!-- 추천 페이지 LIST -->
		<div style="clear: both; border: 1px solid #f0f0f0; height: 300px; margin-top: 10px;">
			<h2 style="font-size: 20px; color: #333333;">추천 페이지</h2>
			<br>
			<c:forEach items="${recommendPage}" var="recommend" varStatus="i">
				<c:if test="${i.index < 3}">
					<a href="${pageScope.pageContext.request.contextPath }/pageMain?page_num=${recommend.page_num}"><p><img style="width: 30%; margin-right: 30px;" alt="${recommend.page_name}_logo" src="../resources/page_logo/${recommend.fileName}"> ${recommend.page_name}</p></a>
				</c:if>
			</c:forEach>
		</div>
	</div>
	<!-- 프로필 바 끝 -->
</div> 

<div style="width: 60%; height: 1080px; background-color: #f0f0f0; margin: 0 auto; margin-top: 30px;">
	<div>
		<input type="search" name="search" id="search">
		<input type="button" id="sBtn" class="round gray" value="GO">
	</div>
	<c:forEach items="${recommendPage }" var="pageDTO">
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
</div>
</div>
<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>