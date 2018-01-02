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
		$(".area").click(function(){
			var area = $(this).attr("title");
			
			$.ajax({
				url:"../ajax/locationList",
				type:"post",
				data:{
					area:area
				},
				success:function(data){
					$(".locationList").html("");
					$("#list").html(data);
				}
			});
			
		});
		
		
		
		
	});
</script>
<style type="text/css">
	*{
		margin: 0px;
		padding: 0px;
	}
	div{
		height: 600px;
	}

	#all{
		background-color: red;
		width: 1000px;
	}
	
	#movie{
		background-color: yellow;
		width: 290px;
		float: left;
		margin-left: 2px;
	}
	#theater{
		background-color: yellow;
		width: 290px;
		float: left;
		margin-left: 2px;
	}
	#day{
		background-color: yellow;
		width: 100px;
		float: left;
		margin-left: 2px;
	}
	#schedule{
		background-color: yellow;
		width: 310px;
		float: left;
		margin-left: 2px;
	}
	
	.head{
		height: 35px;
		background-color: black;
		
	}
	
	.head h2{
		color: white;
		text-align: center;
	}
	ul{
		list-style: none;
	}
	.locationList{
		float: right;
	}
</style>
</head>
<body>
	<h2>Quick Reserve</h2>
	
	<div id="all">
		<div id="movie">
			<div class="head">
				<h2>영화</h2>
			</div>
			<ul>
				<c:forEach items="${movie }" var="DTO">
					<li>${DTO.movie_name }</li>
				</c:forEach>
			</ul>
		</div>
		
		<div id="theater">
			<div class="head">
				<h2>극장</h2>
			</div>
			<ul>
				<li>
					<a href="#" class="area" title="서울" onclick="return false;">서울</a>
					<div class="locationList" id="list">
						<ul>
							<c:forEach items="${location }" var="DTO">
								<li>${DTO.location }</li>
							</c:forEach>
						</ul>
					</div>
				</li>
				<li>
					<a href="#" class="area" title="경기" onclick="return false;">경기</a>
					<div class="locationList" id="경기">
					</div>
				</li>
				<li>
					<a href="#" class="area" title="인천" onclick="return false;">인천</a>
					<div class="locationList" id="인천">
					</div>
				</li>
			</ul>

		</div>
		
		<div id="day">
			<div class="head">
				<h2>날짜</h2>
			</div>
		</div>
		
		<div id="schedule">
			<div class="head">
				<h2>시간</h2>
			</div>
		</div>
	</div>
	
</body>
</html>