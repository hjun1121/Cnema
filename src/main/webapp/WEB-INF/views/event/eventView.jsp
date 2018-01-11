<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">

$(function(){
	var message = '${message}';
	if(message != ""){
		alert(message);
	}
	
	$("#join").click(function(){
		var id = $("#id").val();
		
		if(id==''){
			alert("로그인을 해주세요!");
			location.href="../home/park";//로그인 페이지로 이동하기 **바꾸기
		}
		else{
		var num = $("#num").val();
		var type= Math.floor(Math.random() * 2);//0 또는 1 만 나오게 한다.
		$(this).val('참여완료');
		$(this).prop("disabled",true);
		//alert(type);
		$.ajax({
			url:"../ajax/eventCheck",
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
	}//else문 끝
		
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

<c:if test="${check==0 }">
<input type="button" id="join" value="바로 참여하기">
</c:if>

<c:if test="${check==1 }">
<input type="button" disabled="disabled" value="참여 완료">
</c:if>

</div>

		<a href="./eventList">목록으로</a>
		<a href="./eventUpdate?num=${view.num}">update</a>
		<a href="./eventDelete?num=${view.num}">delete</a>
		
	
</body>
</html>