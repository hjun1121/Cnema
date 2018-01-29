<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/community/mailBox.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/movie/movie.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>수신함</title>
<script type="text/javascript">

	$(function(){
		
		//발신함=1, 수신함=2
		
		if(${check} == 1) {
			$.ajax({
				url:"sendBox",
				type:"POST",
				data:{
					curPage:${curPage}
				},
				success:function(data){
					$("#box_div").html(data);
				}
			});
		} else {
			$.ajax({
				url:"receiveBox",
				type:"POST",
				data:{
					curPage:${curPage}
				},
				success:function(data){
					$("#box_div").html(data);
				}
			});
		}
		
		$("#sendBox_btn").click(function() {
			$.ajax({
				url:"receiveBox",
				type:"POST",
				data:{
					curPage:1
				},
				success:function(data){
					$("#box_div").html(data);
				}
			});
		});

		$("#receiveBox_btn").click(function() {
			$.ajax({
				url:"sendBox",
				type:"POST",
				data:{
					curPage:1
				},
				success:function(data){
					$("#box_div").html(data);
				}
			});
		});
		
		
	});

</script>
</head>
<body>
	
	<button class="mailBox_btns" id="sendBox_btn">수신함</button>
	<button class="mailBox_btns" id="receiveBox_btn">발신함</button>
	<div id="box_div">
		
		
	</div>
	

</body>
</html>