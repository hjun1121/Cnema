<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		<form action="replyWrite" method="POST">
			<input type="hidden" name="page_num" value="${page_num }">
			<input type="hidden" name="id" value="${member.id}">
			<input type="hidden" name="ref" value="${contents_num}">
			<input type="text"  name="contents">
			<input type="submit" value="댓글등록"> 
		</form>
		<div>
			<c:forEach items="${replyList }" var="reply">
				<p>${reply.contents }</p>
			</c:forEach>
		</div>

