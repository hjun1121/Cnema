<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<ul>
	<c:forEach items="${location }" var="DTO">
		<li>
			<a href="#" onclick="return false;" class="location" title="${DTO.theater_num }" >
			${DTO.location }
			</a>
		</li>
	</c:forEach>
</ul>