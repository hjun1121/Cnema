<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>상영시간표 글쓰기(관리자용)</title>
<script type="text/javascript">
$(function(){

	$("#area").change(function(){
		var area =$("#area").val();
		if(area =='x'){
			$("#location").html('<option value="x">지역선택</option>');
			$("#screen").html('<option>극장선택</option>');
		} else{
			$.ajax({
				url:"../ajax/adminLocationList",
				type:"POST",
				data:{		
					area:area
				},
				success:function(data){
					$("#location").html(data);
					$("#screen").html('<option>극장선택</option>');
					$("#location").focus();
				}
			});
		}
		
	});

	$("#location").change(function(){
		var theater_num = $("#location").val();
		if(theater_num =='x'){
			$("#screen").html('<option>극장선택</option>');
		}else {
			$.ajax({
				url:"../ajax/adminScreenList",
				type:"POST",
				data:{		
					theater_num:theater_num
				},
				success:function(data){
					$("#screen").html(data);
					$("#screen").focus();
				}
			});
		}
		
	});
	$("#day").change(function(){
		var day = $("#day").val();
		$("#in_time").val("");
	});
	
 	$("#in_time").click(function(){
		var day = $("#day").val();
		if(day =='x'){
			alert("날짜를 선택해주세요");
			$("#day").focus();
		}
	}); 
	
	$("#in_time").change(function(){
		var in_time = $("#in_time").val();
		var movie_num = $("#movie").val();
		var day = $("#day").val();
		if(movie_num=='x'){
			alert("영화를 선택해 주세요");
			$("#in_time").val("");
			$("#movie").focus();
		}else if(day=='x'){
			alert("날짜를 선택해 주세요");
			$("#in_time").val("");
			$("#day").focus();
		}else{
			$.ajax({
				url:"../ajax/inTime",
				type:"POST",
				data:{		
					movie_num:movie_num,
					in_time:in_time,
					day:day
				},
				success:function(data){
					$("#out_time").val(data.trim());
				}
			});
		}
	});
	
	$("#btn").click(function(){
		var area =$("#area").val();
		var location = $("#location").val();
		var screen = $("#screen").val();
		var movie = $("#movie").val();
		var day = $("#day").val();
		var count = $("#count").val();
 		if(area == 'x'){
			alert("지역을 선택해주세요");
			$("#area").focus();
		}else if(location =='x'){
			alert("극장을 선택해주세요");
			$("#location").focus();
		}else if(screen =='x'){
			alert("스크린을 선택해주세요");
			$("#screen").focus();
		}else if(movie =='x'){
			alert("영화를 선택해주세요");		
			$("#movie").focus();
		}else if(day =='x'){
			alert("날짜를 선택해주세요");		
			$("#day").focus();	
		}else {
			document.frm.submit();
		}
	})
});
</script>
</head>
<body>
<h3>상영시간표 글쓰기 </h3>
	<form action="./scheduleInsert" name="frm" method="POST">
		<table>
			<tr>
				<td>지역선택</td>
				<td>극장선택</td>
				<td>스크린</td>
				<td>영화번호</td>
				<td>상영날짜</td>
				<td>시작시간</td>
				<td>종료시간</td>
				<td>다음시간</td>
				<td>회차</td>
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
				<td>
					<select id="screen" name="screen_num">
						<option value="x">극장선택</option>
					</select>
				</td>
				<td>
					<select id="movie" name="movie_num">
						<option value="x">영화선택</option>
						<c:forEach items="${movieList }" var="movieDTO">
						<option value="${movieDTO.movie_num }">${movieDTO.movie_name }</option>
						</c:forEach>
					</select>			
				</td>
				<td>
					<select id="day" name="day">
						<option value="x">날짜선택</option>
						<c:forEach items="${dayList }" var="dayDTO">
						<option value="${dayDTO.day_num }">${dayDTO.day_num }</option>
						</c:forEach>
					</select>	
				</td>
				<td><input type="time" id="in_time" name="in_time"></td>
				<td><input type="time" id="out_time" name="out_time" readonly="readonly"></td>
				<td><input type="text" id="next_time" name="next_time"></td>
				<td>
					<select id="count" name="count">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
					</select>
				</td>
			</tr>
		</table>
	<input type="button" id="btn" value="확인">
	</form>
</body>
</html>