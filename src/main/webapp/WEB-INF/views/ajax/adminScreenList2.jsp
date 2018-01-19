<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<tr>
		<td>관번호</td>
		<td>층</td>
	</tr>
	<c:forEach items="${screenList }" var="screenDTO">
	<tr>
		<td>${screenDTO.room_num }관</td>
		<td>${screenDTO.floor }층</td>
	</tr>
	</c:forEach>