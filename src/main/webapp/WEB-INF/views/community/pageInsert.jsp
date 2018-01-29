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
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/community/pageInsert.css">
<title>커뮤니티 만들기</title>
</head>
<body>

	<form action="pageInsert" name="frm" method="POST" enctype="multipart/form-data">
	<table>
		<tr>
			<td class="title">페이지 이름</td>
			<td><input type="text" id="page_name" name="page_name"></td>
		</tr>
		<tr>
			<td class="title">커버 사진</td>
			<td> <input type="file" name="file"></td>
		</tr>
		<tr>
			<td class="title">페이지 생성자</td>
			<td> <input type="text" name="owner_id" readonly="readonly" value="${member.id}"></td>
		</tr>
	</table>
	<div style="text-align: center;">
		<input class="form_btns" type="submit" id="insertBtn" value="insert">
	</div>
	</form>

</body>
</html>