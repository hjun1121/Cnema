<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
	<h3>회원 탈퇴</h3>
	고객님의 개인정보 관리는 CNEMA 홈페이지에서 통합관리 하고 있습니다.<br>
	그동안 CNEMA 멤버십 서비스를 이용해주셔서 감사합니다.<br>
	<form action="withdrawal" method="POST">
		<input type="hidden" id="id" name="id" value="${memberDTO.id }">
		<input type="submit" value="CNEMA 회원탈퇴">
	</form>
</body>
</html>