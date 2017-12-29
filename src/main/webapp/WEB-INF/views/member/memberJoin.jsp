<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Member Join</h2>
	
	<form action="memberJoin" method="post">
		<p>id <input type="text" name="id"></p>
		<p>pw <input type="text" name="pw"></p>
		<p>name <input type="text" name="name"></p>
		<p>birth <input type="date" name="birth"></p>
		<p>남<input type="radio" name="gender" value="m">
		여<input type="radio" name="gender" value="f"> </p>
		
		<p>phone <input type="text" name="phone"></p>
		<p>email <input type="text" name="email"></p>
		<p>postcode <input type="text" name="postCode"></p>
		<p>addr1<input type="text" name="addr1"><input type="text" name="addr2"></p>
		
	</form>
	
	
	
</body>
</html>