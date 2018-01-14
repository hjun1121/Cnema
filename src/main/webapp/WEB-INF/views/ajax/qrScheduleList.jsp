<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"    %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach items="${screenList }" var="DTO" varStatus="count">
	<c:if test="${!empty DTO.ar  }">
		<li>
			${DTO.room_num} 관 ${DTO.floor }층 (총 ${DTO.x_num * DTO.y_num } 석)
			<c:forEach items="${DTO.ar }" var="ar">
			<p><a href="#" class="schedules" title="${ar.schedule_num }" onclick="return false;">
			${ar.in_time } 
			~${ar.out_time } &nbsp; ${DTO.x_num * DTO.y_num - ar.seatcheck } 석
			</a></p>
			</c:forEach>
		</li>
	</c:if>
</c:forEach>