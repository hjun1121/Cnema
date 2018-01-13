<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<ul>
	<c:forEach items="${location }" var="DTO">
		<li>
		<c:if test="${num eq DTO.theater_num}">
			<a href="#" style="background-color: red;" onclick="return false;" class="location time" title="${DTO.theater_num }" >
			${DTO.location }
			</a>
		</c:if>
		<c:if test="${num ne DTO.theater_num}">
			<a href="#" onclick="return false;" class="location time" title="${DTO.theater_num }" >
			${DTO.location }
			</a>
		</c:if>
		</li>
	</c:forEach>
</ul>