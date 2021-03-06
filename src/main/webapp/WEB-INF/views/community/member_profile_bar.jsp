<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>

	$(function() {
		$("#search_btn").click(function() {
			//document.frm.submit();
		});
		

		$(".member_id_btn").click(function() {
			var id = $(this).attr("value");
			window.open("mailWriteForm?page_num=${page_num}&receive_id="+id,"쪽지 쓰기","width=750,height=450");
		});
		
	});

</script>

<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/community/pageMain.css">

	<div id="member_profile_div">
		<div id="search">
			<form action="./member_profile_bar" id="frm" name="frm">
				<input type="text" name="search" placeholder="아이디를 검색하세요">
				<input type="hidden" name="page_num" value="${page_num}">
				<button id="search_btn">검색</button>
			</form>
		</div>
		<c:forEach items="${memberList }" var="mp">
		<c:if test="${mp.id ne member.id}">
			<div class="profile">
				<p><img alt="${mp.id } 프로필" src="../resources/profil/${mp.fileName}">
				<input class="member_id_btn" type="button" value="${mp.id }">
				</p>
			</div>
		</c:if>
		</c:forEach>
	</div>
