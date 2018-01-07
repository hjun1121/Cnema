<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"    %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
asd
<c:forEach items="${screenList }" var="DTO" varStatus="count">
	<li>
		${DTO.room_num} 관 ${DTO.floor }층 (총자리수 : ${DTO.x_num * DTO.y_num })
		<c:forEach items="${DTO.ar }" var="ar">
		<p>	${ar.in_time } ${ar.out_time }</p>
		</c:forEach>
	</li>
</c:forEach>