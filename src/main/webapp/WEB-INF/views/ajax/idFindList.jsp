<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty memberList }">
 	검색 결과가 없습니다
</c:if>
<c:if test="${!empty memberList }">
	<table>
		<tr>
			<td>ID</td>
			<td>가입일자</td>
		</tr>
		<c:forEach items="${memberList }" var="memberDTO">
			<tr>
				<td>${memberDTO.id }</td>
				<td>${memberDTO.reg_date }</td>
			</tr>
		</c:forEach>
	</table>

</c:if>