<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<option value="x">극장선택</option>
<c:forEach items="${locationList }" var="locationDTO">
	<option value="${locationDTO.theater_num }">${locationDTO.location }</option>
</c:forEach>

