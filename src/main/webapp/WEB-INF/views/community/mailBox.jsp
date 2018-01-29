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
		
		$.ajax({
			url:"receiveBox",
			type:"POST",
			data:{
				
			},
			success:function(data){
				$("#box_div").html(data);
			}
		});
		
		$("#sendBox_btn").click(function() {
			$.ajax({
				url:"receiveBox",
				type:"POST",
				data:{
					
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
		
	<table>
		<tr class="top_tr">
			<td>No.</td>
			<td>보낸 사람</td>
			<td>제목</td>
			<td>보낸날짜</td>
			<td>수신여부</td>
		</tr>
		<c:forEach items="${mailList}" var="mail" varStatus="count">
			<c:choose>
				<c:when test="${mail.type eq 12 }">
					<tr>
						<td>${count.count + (curPage-1)*10}</td>
						<td>${mail.send_id }</td>
						<td id="title"><a href="mailView?message_num=${mail.message_num }">${mail.title }</a></td>
						<td>${mail.send_date }</td>
						<td>
							<c:if test="${mail.type eq 11 }">읽음</c:if>
							<c:if test="${mail.type eq 12 }">안읽음</c:if>
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr class="read_tr">
						<td>${count.count * curPage}</td>
						<td>${mail.send_id }</td>
						<td id="title"><a href="mailView?message_num=${mail.message_num }">${mail.title }</a></td>
						<td>${mail.send_date }</td>
						<td>
							<c:if test="${mail.type eq 11 }">읽음</c:if>
							<c:if test="${mail.type eq 12 }">안읽음</c:if>
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
	</table>
         <div class="paging">
			<ul id="paging_point">
				<c:choose>
				<c:when test="${fn:length(mailList) eq 0}">
					<li style="text-decoration: none;" class=" on">
						<a href="mailBox?curPage=1" title="1페이지 선택">1</a>
					</li>
				</c:when>
				<c:otherwise>
				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li style="text-decoration: none;" class=" on">
						<a href="mailBox?curPage=${i}" title="${i}페이지 선택">${i}</a>
					</li>
				</c:forEach>
				<c:if test="${pager.curBlock lt pager.totalBlock}">
					<li class="paging-side">
						<a href="mailBox?curPage=${pager.lastNum+1}"><button style="line-height: 26px;" class="btn-paging next" type="button">다음</button></a>
					</li>
				</c:if>
				</c:otherwise>
				</c:choose>
			</ul>
		</div>
		
		
	</div>
	

</body>
</html>