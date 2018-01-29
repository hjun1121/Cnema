<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/community/mailBox.css">
	<table>
		<tr class="top_tr">
			<td>No.</td>
			<td>받는 사람</td>
			<td>제목</td>
			<td>수신여부</td>
			<td>읽은날짜</td>
		</tr>
		<c:forEach items="${mailList}" var="mail" varStatus="count">
			<tr>
				<td>${count.count + (curPage-1)*10}</td>
				<td>${mail.receive_id}</td>
				<td id="title"><a href="sendMailView?message_num=${mail.message_num }">${mail.title }</a></td>
				<td>
					<c:if test="${mail.type eq 11 }">읽음</c:if>
					<c:if test="${mail.type eq 12 }">안읽음</c:if>
				</td>
				<c:choose>
					<c:when test="${mail.type eq 11 }">
						<td>${mail.read_date }</td>
					</c:when>
					<c:otherwise>
						<td></td>
					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>
		
	</table>
         <div class="paging">
			<ul id="paging_point">
				<c:choose>
				<c:when test="${fn:length(mailList) eq 0}">
					<li style="text-decoration: none;" class=" on">
						<a href="mailBox?curPage=1&check=1" title="1페이지 선택">1</a>
					</li>
				</c:when>
				<c:otherwise>
				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li style="text-decoration: none;" class=" on">
						<a href="mailBox?curPage=${i}&check=1" title="${i}페이지 선택">${i}</a>
					</li>
				</c:forEach>
				<c:if test="${pager.curBlock lt pager.totalBlock}">
					<li class="paging-side">
						<a href="mailBox?curPage=${pager.lastNum+1}&check=1"><button style="line-height: 26px;" class="btn-paging next" type="button">다음</button></a>
					</li>
				</c:if>
				</c:otherwise>
				</c:choose>
			</ul>
		</div>
