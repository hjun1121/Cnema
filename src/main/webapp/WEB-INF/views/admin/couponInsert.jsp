<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쿠폰 등록하기</title>
</head>
<body>
<h3>쿠폰 등록하기</h3>
	<form action="./couponInsert" method="POST">
	<table>
		<tr>
			<td>쿠폰 이름</td>
			<td>쿠폰 타입</td>
			<td>금액</td>
			<td>유효기간</td>
		</tr>
		<tr>
			<td><input type="text" name="name"></td>
			<td>
			<select id="type">
				<option class="type" value="11">금액</option>
				<option class="type" value="10">할인율</option>
			</select>
			</td>
			<td><input type="text" name="price"></td>
			<td><input type="number" name="v_day"></td>
		</tr>
	</table>
	<input type="submit" value="확인">
	</form>
</body>
</html>