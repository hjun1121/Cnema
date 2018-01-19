<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<option>영화관선택</option>
   <c:forEach items="${location_list}" var="dto">
	<option>${dto.location}</option>
	</c:forEach>
