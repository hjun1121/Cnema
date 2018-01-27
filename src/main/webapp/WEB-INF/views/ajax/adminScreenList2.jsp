<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<caption></caption>
	<colgroup>
	    <col width="30%">
	    <col width="30%">
	</colgroup>
	<thead>
        <tr>
            <th scope="col">관번호</th>
            <th scope="col">층</th>
        </tr>
    </thead>
	<tbody>
	     <c:forEach items="${screenList }" var="screenDTO">
			<tr>
			<td>${screenDTO.room_num }관</td>
			<td>${screenDTO.floor }층</td>
			</tr>
		</c:forEach>
	</tbody>
	
	