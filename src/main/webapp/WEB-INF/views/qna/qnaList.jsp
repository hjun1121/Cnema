<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	$(function(){
		var message = '${message}';
		if(message != ""){
			alert(message);
		}
		
		$(".list").click(function(){
			var cur = $(this).attr("title");
			var s = '${pager.search}';
			var t = '${pager.kind}';
			document.frm.curPage.value=cur;
			document.frm.search.value=s;
			document.frm.kind.value=t;
			document.frm.submit();
		})
	});
</script>
<style type="text/css">
	.list{
		cursor: pointer; 
	}
</style>
</head>
<body>
	<h1>Qna list Page 진행중인 이벤트</h1>
	<!--Ajax 사용하기  -->
<button id="endEventList">종료된 이벤트</button>
	<table>
		<tr>
			<th>이미지</th>
			<th>글제목</th>
			<th>글쓴이</th>
			<th>등록일</th>
			<th>답변</th>
		</tr>
		<c:forEach items="${list}" var="dto">
		<tr>
			<td>${dto.fileName}</td>
			<td>
			<a href="./qnaView?num=${dto.num}">${dto.title}</a>
			</td>
			<td>${dto.writer}</td>
			<td>${dto.reg_date}</td>
			<td>
			<c:if test="${dto.reply != null }">
			답변완료
			</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
	
	<div>
		<c:if test="${pager.curBlock gt 1}">
			<span class="list" title="${pager.startNum-1}">[이전]</span>
		</c:if>
		<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			<span class="list" title="${i}">${i}</span>
		</c:forEach>
		<c:if test="${pager.curBlock lt pager.totalBlock}">
			<span class="list" title="${pager.lastNum+1}">[다음]</span>
		</c:if>
	</div>
	
	

</body>
</html>