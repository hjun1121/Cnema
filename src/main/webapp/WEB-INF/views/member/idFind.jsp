<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#btn").click(function(){
			var name = $("#name").val();
			var email = $("#email").val();
			
			
			$.ajax({
				url:"../ajax/idFind",
				type:"POST",
				data:{
					name : name,
					email : email
				},
				success:function(data){
					alert(data)
				},
				error : function(request, status, error){
					alert(request);
					alert(error);
					alert(status);
				}
			});
			
		})
	});

</script>
</head>
<body>
	<h2>ID FIND</h2>
	
	<form action="../ajax/idFind" method="post">
		<p>name<input type="text" id="name"></p>
		<p>email<input type="text" id="email"></p>
		<input type="button" id="btn" value="idFind">
		<div id="idList"></div>
	</form>
</body>
</html>