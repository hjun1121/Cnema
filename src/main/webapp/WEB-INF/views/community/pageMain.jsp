<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${page.page_name}</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/main/slide.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/main/main.css">

<script type="text/javascript">
	
	$(function(){
		
		$("#join_btn").click(function() {
			$.ajax({
				url: "../ajax/memberJoin",
				type: "POST",
				data: {
					page_num:${page.page_num},
					id:${member.id}
				},
				success: function(data) {
					alert(data);
				}
			});
		});
		
		
		$("#drop_btn").click(function() {
			$.ajax({
				url: "../ajax/memberDrop",
				type: "POST",
				data: {
					page_num:${page.page_num},
					id:${member.id}
				},
				success: function(data) {
					alert(data);
				}
			});
		
		});
		
		$("#deletePage_btn").click(function() {
			alert("페이지 삭제하기");
		});
		
		$("#chatting_btn").click(function() {
			alert("채팅하기");
			$.ajax({
				url: "../ajax/chatting",
				type: "POST",
				data: {
					
				},
				success: function(data) {
					$("#chatting_div").append();
				}
			});
		});
		

	});

</script>

</head>

<body>
<div id="cgvwrap"  style="text-align: center;">
<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/header.jsp"></c:import>
</div>
<div style="width: 1012px; height: 1000px; background-color: #f0f0f0; text-align: center; margin: 50px auto;">
	<!-- 왼쪽 프로필 바 -->
	<div style = "width: 180px; float: left; top: 86px;">
		<c:choose>
			<c:when test="${not empty member}">
				<img alt="${member.id} 프로필" src="../resources/profil/${member.fileName}">
			</c:when>		
			<c:otherwise>
				<img alt="기본 프로필" src="../resources/profil/defaultProfile.jpg">
			</c:otherwise>
		</c:choose>
	</div>
	<div style = "width: 500px !important; right:320px; margin-left:12px; float:left; background-color: #dcdcdc;">
	<!-- 페이지 로고 img -->
	<div style = "width: 99%; margin-bottom: 30px;">
		<img style="width: 100%; height: 300px; border: 3px solid gold; -webkit-border-radius: 50px;" alt="${page.page_name}_logo" src="../resources/page_logo/${page.fileName}">
	</div>
	<!-- 게시물 작성  -->
	<div style="width: 100%; height: auto; background-color: white;">
		<ul style="list-style: none; float: left;">
			<li style="float: left; font-size: 20px;">상태</li>
			<li style="float: left; font-size: 20px;">사진</li>
		</ul>
		<img style="width: " alt="${member.id} 프로필" src="../resources/profil/${member.fileName}">
		<input type="text" value="글쓰기....">
		
	</div>
	
	<!-- 우측 고정 바 -->
	<div style="width: 308px; height: auto; background-color: yellow; right: 30px; bottom: 0; position: fixed; z-index: 999;">
		<!-- 채팅 바 -->
		<div id="chatting_div" style="width: 100%; height: 25px; border: 1px solid red; line-height: 25px;">
		<c:if test="${not empty member}">
			<c:forEach items="${pageMember}" var="pm">
<%-- 				<img alt="${pm.id} 프로필" src="../resources/profil/${pm.fileName}"> ${pm.id} --%>
<%-- 				${pm.id} --%>
				<input style="background-color: yellow; border: none;" type="button" id="chatting_btn" value="채팅하기">
			</c:forEach>
		</c:if>
		</div>
	</div>

<%-- 	<c:choose> --%>
<%-- 		<c:when test="${not empty member and memberCheck eq 11}"> --%>
<!-- 			<input type="button" id="drop_btn" value="페이지 탈퇴하기"> -->
<%-- 		</c:when> --%>
<%-- 		<c:when test="${not empty member and memberCheck eq 20}"> --%>
<!-- 			<input type="button" id="deletePage_btn" value="페이지 삭제하기"> -->
<%-- 		</c:when> --%>
<%-- 		<c:otherwise> --%>
<!-- 			<input type="button" id="join_btn" value="페이지 가입하기"> -->
<%-- 		</c:otherwise> --%>
<%-- 	</c:choose> --%>

</div>
</div>
<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>
