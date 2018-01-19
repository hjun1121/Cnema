<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#area").change(function(){
			var area =$("#area").val();
			if(area =='x'){
				$("#location").html('<option value="x">지역선택</option>');
				$("#screenList").html('');
			} else{
				$.ajax({
					url:"../ajax/adminLocationList",
					type:"POST",
					data:{		
						area:area
					},
					success:function(data){
						$("#location").html(data);
						$("#location").focus();
					}
				});
			}
			
		});
		
		$("#location").change(function(){
			var location = $("#location").val();
			if(location =='x'){
				$("#screenList").html('');
			} else{
				$.ajax({
					url:"../ajax/adminScreenList2",
					type:"POST",
					data:{		
						theater_num : location
					},
					success:function(data){
						$("#screenList").html(data);
					}
				});
			}
		});
		
		$("#btn").click(function(){
			var area = $("#area").val();
			var location = $("#location").val();
			var room_num = $("#room_num").val();
			var floor = $("#floor").val();
			var x_num = $("#x_num").val();
			var y_num = $("#y_num").val();
			if(area=='x'){
				alert("지역을 선택해주세요");
				$("#area").focus();
			}else if(location =='x'){
				alert("극장을 선택해주세요");
				$("#location").focus();
			}else if(room_num ==""){
				alert("관번호를 입력해주세요");
				$("#room_num").focus();
			}else if(floor ==""){
				alert("층을 입력해주세요");
				$("#floor").focus();
			}else if(x_num ==""){
				alert("행번호를 입력해주세요");
				$("#x_num").focus();
			}else if(y_num ==""){
				alert("열번호를 입력해주세요");
				$("#y_num").focus();
			}else{
				document.frm.submit();
			}
		});
	});
</script>
</head>
<body>
<h3>스크린 추가 </h3>
<form action="./screenInsert" name="frm" method="POST">
	<table>
		<tr>
			<td>지역</td>
			<td>극장</td>
			<td>관번호</td>
			<td>층</td>
			<td>열(x)</td>
			<td>행(y)</td>
		</tr>
		<tr>
			<td>
				<select id="area" name="area">
					<option value="x">지역선택</option>
					<c:forEach items="${areaList }" var="areaDTO">
					<option value="${areaDTO.area }">${areaDTO.area }</option>
					</c:forEach>
				</select>
			</td>
			<td>
				<select id="location" name="theater_num">
					<option value="x">지역선택</option>
				</select>
			</td>
			<td><input type="number" id="room_num" name="room_num" ></td>
			<td><input type="number" id="floor" name="floor" ></td>
			<td><input type="number" id="x_num" name="x_num" ></td>
			<td><input type="number" id="y_num" name="y_num" ></td>
		</tr>
		
	</table>
	
	<table id="screenList">

	</table>
	
	<input type="button" id="btn" value="확인">
</form>

</body>
</html>