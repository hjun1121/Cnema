<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

$(function(){
	var message = '${message}';
	if(message != ""){
		alert(message);
	}
	
	$("#join").click(function(){
		
		var num = $("#num").val();
		var id = $("#id").val();
		var type= Math.floor(Math.random() * 2);//0 또는 1 만 나오게 한다.
		$.ajax({
			url:"../ajax/eventJoin",
			type:"POST",
			data:{
			 num:num,
			 id:id,
			 type:type
				 
			},
			success:function(data){
				alert(data);
				},
			error : function(){
				
			}
		});
		
		
	});
});


</script>
</head>
<body>

<div class="eventViewhead">
    <h3>${view.title } </h3> 
    <em class="date">
        <span>기간: </span>
        ${view.s_date }~ ${view.e_date }
    </em>
</div>
<div class="eventViewContents">
${view.contents}

</div>

<div class="eventViewFile">
첨부 파일 다운로드
</div>
<br>
<hr>
<div class="eventJoin">
<h3>이벤트 참여하기</h3>
<input type="hidden" id="num" name="num" value="${view.num }">
<input type="hidden" id="id" value="${member.id}">

<button id="join">바로 참여하기</button>


</div>

		<a href="./evnetList">목록으로</a>
		<a href="./eventUpdate?num=${view.num}">update</a>
		<a href="./eventDelete?num=${view.num}">delete</a>
		
	
</body>
</html>