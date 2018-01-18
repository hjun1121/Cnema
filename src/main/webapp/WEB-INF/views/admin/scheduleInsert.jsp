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
				}
			});
		}
		
	});

	$("#location").change(function(){
		var theater_num = $("#location").val();
		$.ajax({
			url:"../ajax/adminScreenList",
			type:"POST",
			data:{		
				theater_num:theater_num
			},
			success:function(data){
				$("#screen").html(data);
			}
		});
	});
	
	
	$("#btn").click(function(){
		var area =$("#area").val();
		
		
 		if(area == 'x'){
			alert("지역을 선택해주세요")
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
				<td>상세선택</td>
				<td>스크린</td>
				<td>영화번호</td>
				<td>시작시간</td>
				<td>종료시간</td>
				<td>상영날짜</td>
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
					<select id="location" name="location">
						<option value="x">지역선택</option>
					</select>
				</td>
				<td>
					<select id="screen" name="screen">
						<option>극장선택</option>
					</select>
				</td>
				<td>
					<select id="movie" name="movie">
						<option value="x">영화선택</option>
						<c:forEach items="${movieList }" var="movieDTO">
						<option value="${movieDTO.movie_num }">${movieDTO.movie_name }</option>
						</c:forEach>
					</select>			
				</td>
				<td><input type="time" id="in_time" name="in_time"></td>
				<td><input type="time" id="out_time" name="out_time"></td>
				<td>
					<select id="day" name="day">
						<option value="x">날짜선택</option>
						<c:forEach items="${dayList }" var="dayDTO">
						<option value="${dayDTO.day_num }">${dayDTO.day_num }</option>
						</c:forEach>
					</select>	
				</td>
			</tr>
		</table>
	<input type="button" id="btn" value="확인">
	</form>
</body>
</html>