<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"    %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach items="${screenList }" var="DTO" varStatus="count">
	<c:if test="${!empty DTO.ar  }">
		<li style="height: 100px;">
			<p>${DTO.room_num} 관 ${DTO.floor }층 (총 ${DTO.x_num * DTO.y_num } 석)</p>
			<c:forEach items="${DTO.ar }" var="ar">
				<c:if test="${num eq ar.schedule_num }">
					<a href="#" class="schedules button"  style="background-color: red; float:left; margin-top:7px;" title="${ar.schedule_num }" onclick="return false;" >
						<%-- <span class="time"><span>${ar.in_time }</span></span> --%>
						<span class="time"><span>${ar.in_time }</span></span>
						<span class="count">${DTO.x_num * DTO.y_num - ar.seatcheck } 석</span>
						<div class="sreader">${ar.out_time }</div>
						<span class="sreader mod"></span>
					</a>
				</c:if>
				<c:if test="${num ne ar.schedule_num }">
					<a href="#" class="schedules button" style="float: left; margin-top:7px;" title="${ar.schedule_num }" onclick="return false;">
						<span class="time"><span>${ar.in_time }</span></span>
						<span class="count">${DTO.x_num * DTO.y_num - ar.seatcheck } 석</span>
						<div class="sreader">${ar.out_time }</div>
						<span class="sreader mod"></span>
					</a>
				</c:if>

			</c:forEach>
		</li>
	</c:if>
</c:forEach>
											

