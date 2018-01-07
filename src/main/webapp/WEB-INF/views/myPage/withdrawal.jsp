<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 확인</title>
</head>
<body>
	<h3>비밀번호 확인</h3>
	<h5>고객님의 개인정보 보호를 위한 절차이이오니, CGV 로그인 시 사용하는 비밀번호를 입력해주세요.</h5>
	<form action="withdrawal" method="POST">
		아이디 : ${member.id }<br>
		비밀번호 : <input type="text" id="pwd" name="pwd">
		<input type="submit" value="확인">
	</form>
</body>
</html>