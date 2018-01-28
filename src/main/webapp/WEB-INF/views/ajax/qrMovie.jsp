<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<tr>
	<td rowspan="2"><img width="75px;" height="106px;" alt="" src="../resources/movie_poster/${movie.fileName }"></td>
	<td>${movie.movie_name }</td>
</tr>
<tr>
	<c:if test="${movie.age_limit eq 0}">
		<td>전체 관람가</td>
	</c:if>
	<c:if test="${movie.age_limit ne 0}">
		<td>${movie.age_limit }세 관람가</td>
	</c:if>
</tr>