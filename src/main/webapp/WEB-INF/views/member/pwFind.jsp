<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>PW FIND</h2>
	
	<form action="../ajax/pwFind" method="post">
		<p>id<input type="text"></p>
		<p>pw<input type="text"></p>
		<input type="button" value="pwFind">
		<div id="pwList"></div>
	</form>
</body>
</html>