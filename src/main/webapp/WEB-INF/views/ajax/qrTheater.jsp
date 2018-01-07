<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<tr>
	<td>극장</td><td>${theater.location }</td>
</tr>
<tr>
	<td>일시</td><td>
	<c:if test="${day ne '2000-01-01' }">
		${day }
	</c:if>
	</td>
</tr>
<tr>
	<td>상영관</td><td></td>
</tr>
<tr>
	<td>인원</td><td></td>
</tr>