<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul>
	<c:forEach items="${coupon }" var="c">
		<li><input class="coupons" type="radio" name="coupon" value="${c.c_num }">${c.name }</li>
	</c:forEach>
</ul>