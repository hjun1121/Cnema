<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MY CNEMA HOME</title>
</head>
<body>
<h1>My Page</h1>
${myInfo.name }님  ${myInfo.id}<br>
고객님은 sysdate ${myInfo.type}입니다.<br>
CJ ONE 사용가능 포인트   ${myInfo.v_point}점<br>
CJ ONE 누적 포인트 ${myInfo.a_point}점<br>
</body>
</html>