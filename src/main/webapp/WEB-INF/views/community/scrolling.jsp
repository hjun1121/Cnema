<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <c:if test="${list.size()==0}">
 0
  </c:if>
 <c:if test="${list !=null }">
 <c:forEach items="${list }" var="dto">
 <div class="pageContentsOne">
 <input type="hidden" id="contents_num" value="${dto.contents_num }">
 <div>
 <span class="updateBtn">수정</span><span class="deleteBtn">삭제</span>
 </div>

<div> ${dto.contents}
 </div>
 
 <div>
 <button class="like" value="${dto.contents_num }">좋아요</button><button class="reply">댓글</button><button class="warning" value="${dto.contents_num }">신고</button>
 </div>
<div>
	<form action="../community/replyWrite" method="POST">
	<input type="hidden" name="page_num" value="${page_num }">
	<input type="hidden" name="id" value="${member.id}">
	<input type="hidden" name="ref" value="${dto.contents_num}">
	<input type="text" id="scrollingContents" name="contents">
	<input type="submit" value="댓글등록"> 
	</form>
</div>
<div id="replyList${dto.contents_num }"> </div>
 </div>
 </c:forEach>
 </c:if>
 