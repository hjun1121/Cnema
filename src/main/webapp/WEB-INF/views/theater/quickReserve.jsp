<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
</style>
</head>
<body>
	<h2>Quick Reserve</h2>
	
	<div id="all">
		<div id="movie">
			<div class="head">
				<h2>영화</h2>
			</div>
			11
		</div>
		
		<div id="theater">
			<div class="head">
				<h2>극장</h2>
			</div>
			22
		</div>
		
		<div id="day">
			<div class="head">
				<h2>날짜</h2>
			</div>
			33
		</div>
		
		<div id="schedule">
			<div class="head">
				<h2>시간</h2>
			</div>
			44
		</div>
	</div>
	
</body>
</html>