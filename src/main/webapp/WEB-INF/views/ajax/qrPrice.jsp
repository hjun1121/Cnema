<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${price eq 0 }">
</c:if>
<c:if test="${price ne 0 }">
<tr>
	<td>${price}원</td>
</tr>
</c:if>