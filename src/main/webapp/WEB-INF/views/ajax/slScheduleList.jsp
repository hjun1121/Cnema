<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<ul style="clear: both;">
		<c:forEach items="${movieList }" var="movieDTO">
			<li style="float: none;">${movieDTO.movie_name }</li>
			<c:forEach items="${movieDTO.sList}" var="sList" varStatus="count">
				<c:forEach items="${sList }" var="sc" varStatus="count">
					<c:if test="${count.first }">
					${sc.screen_num }관
					</c:if>
				<a href="#" class="schedules" id="${movieDTO.movie_num }" onclick="return false;" title="${sc.schedule_num }">${sc.in_time }</a>
					<c:if test="${count.last }">
					<br>
					</c:if>
				</c:forEach>
			</c:forEach>
		</c:forEach>
	</ul>