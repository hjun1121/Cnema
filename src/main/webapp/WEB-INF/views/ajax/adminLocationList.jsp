<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<option value="x">극장선택</option>
<c:forEach items="${locationList }" var="locationDTO">
	<c:if test="${theater_num eq locationDTO.theater_num }">
		<option value="${locationDTO.theater_num }" selected="selected">${locationDTO.location }</option>
	</c:if>
	<c:if test="${theater_num ne locationDTO.theater_num }">
		<option value="${locationDTO.theater_num }">${locationDTO.location }</option>
	</c:if>
</c:forEach>

