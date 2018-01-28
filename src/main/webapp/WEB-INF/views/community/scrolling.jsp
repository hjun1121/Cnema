<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <c:if test="${list !=null }">
 <c:forEach items="${list }" var="dto">
 <div class="pageContentsOne">
<div> ${dto.contents}
 </div>
 <div>
 <button class="like">좋아요</button><button class="reply">댓글</button>
 </div>
 </div>
 </c:forEach>
 </c:if>