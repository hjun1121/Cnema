<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>쿠폰 등록하기</title>
<script type="text/javascript">
$(function(){
	$("#cBtn").click(function(){
		if($("#name").val()==""){
			$("#name").focus();
		}else if($("#price").val()==""){
			$("#price").focus();
		}else if($("#v_day").val()==""){
			$("#v_day").focus();
		}else{
			document.frm.submit();
		}
	});
});
</script>
</head>
<body>
<h3>쿠폰 등록하기</h3>
	<form action="./couponInsert" name="frm" method="POST">
		<table>
			<tr>
				<td>쿠폰 이름</td>
				<td>쿠폰 타입</td>
				<td>금액</td>
				<td>유효기간</td>
			</tr>
			<tr>
				<td><input type="text" id="name" name="name"></td>
				<td>
				<select id="type" name="type">
					<option class="type" value="11">금액</option>
					<option class="type" value="10">할인율</option>
				</select>
				</td>
				<td><input type="text" id="price" name="price"></td>
				<td><input type="number" id="v_day" name="v_day"></td>
			</tr>
		</table>
	<input type="button" id="cBtn" value="확인">
	</form>
</body>
</html>