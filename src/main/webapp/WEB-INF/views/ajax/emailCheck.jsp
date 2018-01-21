<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${result eq 'ok' }">
	<input type="text" id="num" placeholder="인증번호 입력">
	<input type="button" id="check" value="인증" style="cursor: pointer;">
	<input type="hidden" id="code" value=${check } >
</c:if>
<c:if test="${result eq 'no' }">
	<span>유효하지 않은 email 입니다.</span>
</c:if>
    