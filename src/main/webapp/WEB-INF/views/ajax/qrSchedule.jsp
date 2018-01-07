<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"    %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach items="${screenList }" var="DTO" varStatus="count">
	<c:if test="${!empty DTO.ar  }">
		<li>
			${DTO.room_num} 관 ${DTO.floor }층 (총자리수 : ${DTO.x_num * DTO.y_num })
			<c:forEach items="${DTO.ar }" var="ar">
			<p>	
			<fmt:formatDate value="${ar.in_time }" type="time" pattern="HH:mm"/>
			~
			<fmt:formatDate value="${ar.out_time }" type="time" pattern="HH:mm"/>
			</c:forEach>
		</li>
	</c:if>
</c:forEach>