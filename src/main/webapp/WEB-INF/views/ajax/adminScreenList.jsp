<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<option value="x">관선택</option>
<c:forEach items="${screenList }" var="screenDTO">
	<option value="${screenDTO.screen_num }">${screenDTO.room_num }</option>
</c:forEach>

