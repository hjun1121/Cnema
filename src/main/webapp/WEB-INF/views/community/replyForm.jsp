<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/community/replyForm.css">

		<form id="reply_form" action="replyWrite" method="POST">
			<input type="hidden" name="page_num" value="${page_num }">
			<input type="hidden" name="id" value="${member.id}">
			<input type="hidden" name="ref" value="${contents_num}">
			<input id="contents" type="text"  name="contents">
			<input id="submit_btn" type="submit" value="댓글등록"> 
		</form>
		<div id="reply_div">
			<c:forEach items="${replyList }" var="reply">
					<img alt="${reply.fileName }" src="../resources/profil/${reply.fileName }"> 
					<span class = "ids">${reply.id}</span>
					<p class="reply_contents">
					<span class = "replys">${reply.contents }</span>
					<span class="reg_date">${reply.reg_date }</span></p>
			</c:forEach>
		</div>

