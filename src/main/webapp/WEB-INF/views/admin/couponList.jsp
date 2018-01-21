<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>쿠폰 목록${fn:length(cList)}개</title>
<script type="text/javascript">
$(function(){
	var kind='${kind}';
	var search='${search}';
	$("#search").val(search);
	$(".kind").each(function(){
		if($(this).val()==kind){
			$(this).attr("selected",true);
		}
	});
	$("#sBtn").click(function(){
		var sKind = $("#kind").val();
		var search = $("#search").val();
		location.href="./couponList?kind="+sKind+"&search="+search;
	});
	
});
</script>
</head>
<body>
<h3>쿠폰 목록</h3>
	<select id="kind">
		<option class="kind" value="name">쿠폰 이름</option>
		<option class="kind" value="price">금액 할인(전체)</option>
		<option class="kind" value="rate">할인률(전체)</option>
	</select>
	<input type="text" name="search" id="search">
	<input type="button" id="sBtn" value="GO">
	<table>
		<tr>
			<td>쿠폰 이름</td>
			<td>쿠폰 유효일</td>
			<td>할인 분류 및 가격</td>
			<td></td>
		</tr>
		<c:forEach items="${cList }" var="couList">
		<tr>
			<td>${couList.name }</td>
			<td>${couList.v_day }</td>
			<c:if test="${couList.type eq 10}">
				<td>${couList.price}% / 할인률</td>
			</c:if>
			<c:if test="${couList.type eq 11}">
				<td>${couList.price}원 / 금액 할인</td>
			</c:if>
			<%-- <td><a href="./couponRevision?name=${couList.name }"><Button>수정</Button></a></td> --%>
		</tr>
		</c:forEach>
	</table>
	<a href="./couponInsert"><Button>글쓰기</Button></a>
</body>
</html>