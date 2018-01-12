<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>커뮤니티 만들기</title>
</head>
<body>

	<form action="pageInsert" name="frm" method="POST">
		<p>name <input type="text" id="page_name" name="page_name"></p>
		페이지 로고 <input type="file" name="file">
		<p>그룹생성자 <input type="text" name="owner_id" readonly="readonly" value="${member.id}"></p>
		<input type="submit" id="insertBtn" value="insert">
	</form>

</body>
</html>