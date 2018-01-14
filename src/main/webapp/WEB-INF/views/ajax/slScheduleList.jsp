<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<ul style="clear: both;">
		<c:forEach items="${movieList }" var="DTO">
			<li style="float: none;">${DTO.movie_name }</li>
			<c:forEach items="${DTO.sList}" var="sc" varStatus="count">
				${sc.screen_num }관
				${sc.in_time }
			</c:forEach>
		</c:forEach>
	</ul>