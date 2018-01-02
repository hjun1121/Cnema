<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<ul>
		<c:forEach items="${location }" var="DTO">
			<li>${DTO.location }</li>
		</c:forEach>
	</ul>