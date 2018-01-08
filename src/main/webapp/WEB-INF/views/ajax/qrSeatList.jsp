<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach begin="1" end="${pCount }" varStatus="c">
	<input type="text" id="seat${c.count }" title="seat${c.count }">
</c:forEach>