<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>상영시간표 글쓰기(관리자용)</title>
<script type="text/javascript">
$(function(){
	$("#sBtn").click(function(){
		if($("#screen_num").val()==""){
			$("#screen_num").focus();
		}else if($("#movie_num").val()==""){
			$("#movie_num").focus();
		}else if($("#in_time").val()==""){
			$("#in_time").focus();
		}else if($("#out_time").val()==""){
			$("#out_time").focus();
		}else if($("#day").val()==""){
			$("#day").focus();
		}else{
			document.frm.submit();
		}
	});
});
</script>
</head>
<body>
<h3>상영시간표 글쓰기</h3>
	<form action="./scheduleInsert" name="frm" method="POST">
	<table>
		<tr>
			<td>상영관번호</td>
			<td>영화번호</td>
			<td>시작시간</td>
			<td>종료시간</td>
			<td>상영날짜</td>
		</tr>
		<tr>
			<td><input type="text" id="screen_num" name="screen_num"></td>
			<td><input type="text" id="movie_num" name="movie_num"></td>
			<td><input type="time" id="in_time" name="in_time"></td>
			<td><input type="time" id="out_time" name="out_time"></td>
			<td><input type="date" id="day" name="day"></td>
		</tr>
	</table>
	<input type="button" id="sBtn" value="확인">
	</form>
</body>
</html>