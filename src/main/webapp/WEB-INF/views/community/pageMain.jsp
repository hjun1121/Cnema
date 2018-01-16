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
			alert("가입하기");
		});
		
		
		$("#drop_btn").click(function() {
			$.ajax({
				url: "../ajax/memberDrop",
				type: "POST",
				data: {
					movie_num:${page.page_num},
					id:${member.id}
				},
				success: function(data) {
					alert(data);
					location.href="pageMain?page_num=${page.page_num}";
				}
		});
		
	});

</script>

</head>
<body>
	<h1>${page.page_name}</h1>

	<c:choose>
		<c:when test="${not empty member and memberCheck eq 1}">
				<input type="button" id="drop_btn" value="페이지 탈퇴하기">
		</c:when>
		<c:otherwise>
			<input type="button" id="join_btn" value="페이지 가입하기">
		</c:otherwise>
	</c:choose>

</body>
</html>