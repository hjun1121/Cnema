<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${page.page_name}</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/main/slide.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/main/main.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/community/pageMain.css">

<script type="text/javascript">

	$(function(){
		
		$("#drop_btn").click(function(){
			$("#frm").attr("action", "../community/pageMemberDrop");
			document.frm.submit();
		});

		$("#join_btn").click(function(){
			$("#frm").attr("action", "../community/pageMemberJoin");
			document.frm.submit();
		});

		$("#mouse_btn").mousedown(function(e) {
			var message = "휠클릭";
			if(e.which == 1) {
				message = "좌클릭";
			} else if(e.which == 3) {
				message = "우클릭";
			}
		    alert(message); // 1:좌클릭, 2:휠클릭, 3:우클릭
		});
		
		$(".mailBox_btn").click(function(){
			window.open("mailBox","쪽지함","width=750,height=450");
		});
		
		$("#more_div").on('click', '#join_more_btn', function() {
			$("#joinHidden_div").css("display","");
			$("#more_div").empty();
			$("#more_div").html("<button id=" + "hide_btn" + ">숨기기</button>");
		});

		$("#more_div2").on('click', '#recommend_more_btn', function() {
			$("#recommendHidden_div").css("display","");
			$("#more_div2").empty();
			$("#more_div2").html("<button id=" + "hide_btn2" + ">숨기기</button>");
		});
		
		$("#more_div2").on('click', '#hide_btn2', function() {
			$("#recommendHidden_div").css("display","none");
			$("#more_div2").empty();
			$("#more_div2").html("<button id=" + "recommend_more_btn" + ">+더보기</button>");
		});

		
		$("#more_div").on('click', '#hide_btn', function() {
			$("#joinHidden_div").css("display","none");
			$("#more_div").empty();
			$("#more_div").html("<button id=" + "join_more_btn" + ">+더보기</button>");
		});
		
		$("#memberBar_btn").click(function() {
			$.ajax({
				url:"member_profile_bar",
				type:"POST",
				data:{
					page_num:${page.page_num}
				},
				success:function(data){
					$("#member_bar").html(data);
				}
			});
		});
		
	});


</script>

</head>
<body>
<div id="cgvwrap"  style="text-align: center; height: auto;">
<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/header.jsp"></c:import>
<!-- 전체 페이지  -->
<div id="container">

<!-- 좌측 프로필바  -->
	<div id="left_profile_bar">
		<!-- 프로필 이미지  -->
		<div id="profile_img">
			<img alt="${member.name} 프로필" src="../resources/profil/${member.fileName}">
		</div>
		<!-- 사용자 정보  -->
		<div id="profile_info">
			<h1>${member.id}<span> 님</span></h1>
			<c:choose>
				<c:when test="${mailCount eq 0 }">
					<button class="mailBox_btn" name="mailBox_btn"><span>쪽지함</span></button>
				</c:when>
				<c:otherwise>
					<button class="mailBox_btn" name="mailBox_btn"><span>쪽지함</span><span class="count">${mailCount}</span></button>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- 쪽지함 div -->
		<div id="mailBox_div">

		</div>
		<!-- 가입 페이지  -->
		<div id="join_page_list" style="margin-bottom: 20px;">
			<p style="margin-bottom: 10px; font-size: 15px; color: #717171; font-weight: bold;">가입한 페이지</p>
			<c:forEach items="${joinPage}" var="join" varStatus="count">
				<c:if test="${count.count == 4 }">
					<div style="display: none;" id="joinHidden_div">
						<p><img alt="${join.page_name }" src="../resources/page_logo/${join.fileName }"> <span>${join.page_name }</span></p>
					</div>
				</c:if>
				<c:if test="${count.count <= 3 }">
					<p><img alt="${join.page_name }" src="../resources/page_logo/${join.fileName }"> <span>${join.page_name }</span></p>
				</c:if>
			</c:forEach>
			<div id="more_div">
				<button id="join_more_btn">+더보기</button>
			</div>
		</div>

		<!-- 추천 페이지  -->
		<div id="recommend_page_list">
			<p style="margin-bottom: 10px; font-size: 15px; color: #717171; font-weight: bold;">추천 페이지</p>
			<c:forEach items="${recommendPage }" var="recommend" varStatus="count">
				<c:if test="${count.count == 4 }">
					<div style="display: none;" id="recommendHidden_div">
						<p><img alt="${join.page_name }" src="../resources/page_logo/${recommend.fileName }"> <span>${recommend.page_name }</span></p>
					</div>
				</c:if>
				<c:if test="${count.count <= 3 }">
					<p><img alt="${recommend.page_name }" src="../resources/page_logo/${recommend.fileName }"> <span>${recommend.page_name }</span></p>
				</c:if>
			</c:forEach>
			<div id="more_div2">
				<button id="recommend_more_btn">+더보기</button>
			</div>
		</div>
	</div>
	
	<!-- 컨텐츠 공간 -->
	<div id="page_contents_wrap">
		<!-- 커버 img -->
		<div id="page_logo_img">
			<img alt="${page.page_name} 커버" src="../resources/page_logo/${page.fileName}">
		</div>
		<!-- 페이지명  -->
		<div id="page_name">
			<!-- 페이지 가입/탈퇴 버튼  -->
			<div id="page_btns">
				<form action="" id="frm" name="frm" method="POST">
					<input type="hidden" name="page_num" value="${page.page_num}">
					<c:if test="${memberCheck eq 11 }">
					<input type="hidden" name="pageMember_num" value="${member_num}">
					</c:if>
				</form>
				<c:choose>
					<c:when test="${memberCheck eq 11}">
						<button class="page_btns" id="drop_btn"><img alt="" src="../resources/page/탈퇴2.png">탈퇴하기</button>
					</c:when>
					<c:when test="${memberCheck eq 0}">
						<button class="page_btns" id="join_btn"><img alt="" src="../resources/page/가입.png">가입하기</button>
					</c:when>
					<c:otherwise>
						<button class="page_btns" id="">그룹장이라 탈퇴안되지롱</button>
					</c:otherwise>
				</c:choose>
				<button class="page_btns"><img src="../resources/page/팔로우.png">${pageMemberCount } 명이 팔로우</button>
			</div>
			<!-- 커뮤니티 이름  -->
			<div style="float: right;">
				<h1>${page.page_name}</h1>
			</div>
		</div>
	</div>
	<!-- 우측 멤버 명단  -->
	<div id="member_bar">
		<a href=# id="memberBar_btn" role="button">
			커뮤니티 멤버
		</a>
	</div>
</div>

</div>



<!-- <div style="width: 1012px; height: 1000px; background-color: #f0f0f0; text-align: center; margin: 50px auto;"> -->
<!-- 	<!-- 왼쪽 프로필 바 -->
<!-- 	<div style = "width: 180px; float: left; top: 86px;"> -->
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${not empty member}"> --%>
<%-- 				<img alt="${member.id} 프로필" src="../resources/profil/${member.fileName}"> --%>
<%-- 			</c:when>		 --%>
<%-- 			<c:otherwise> --%>
<!-- 				<img alt="기본 프로필" src="../resources/profil/defaultProfile.jpg"> -->
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>
<!-- 	</div> -->
<!-- 	<div style = "width: 500px !important; right:320px; margin-left:12px; float:left; background-color: #dcdcdc;"> -->
<!-- 	<!-- 페이지 로고 img --> 
<!-- 	<div style = "width: 99%; margin-bottom: 30px;"> -->
<%-- 		<img style="width: 100%; height: 300px; border: 3px solid gold; -webkit-border-radius: 50px;" alt="${page.page_name}_logo" src="../resources/page_logo/${page.fileName}"> --%>
<!-- 	</div> -->
<!-- 	<!-- 게시물 작성  --> 
<!-- 	<div style="width: 100%; height: auto; background-color: white;"> -->
<!-- 		<ul style="list-style: none; float: left;"> -->
<!-- 			<li style="float: left; font-size: 20px;">상태</li> -->
<!-- 			<li style="float: left; font-size: 20px;">사진</li> -->
<!-- 		</ul> -->
<%-- 		<img style="width: " alt="${member.id} 프로필" src="../resources/profil/${member.fileName}"> --%>
<!-- 		<input type="text" value="글쓰기...."> -->
		
<!-- 	</div> -->

<!-- 	<!-- 우측 고정 바 -->
<!-- 	<div style="width: 308px; height: auto; background-color: yellow; right: 30px; bottom: 0; position: fixed; z-index: 999;"> -->
<!-- 		<!-- 채팅 바 -->
<%-- 		<c:if test="${not empty member}"> --%>
<!-- 		<div id="chatting_div" style="width:276px; height: 28px; bottom: 0; right: 0; position: fixed; margin: 0 15px; border: 1px solid #dddfe2; background-color: #f6f7f9;"> -->
<!-- 			<input style="background-color: #f6f7f9; line-height:28px; border: none;" type="button" id="chatting_btn" value="채팅하기"> -->
<%-- 			<c:forEach items="${pageMember}" var="pm"> --%>
<%-- <%-- 				<img alt="${pm.id} 프로필" src="../resources/profil/${pm.fileName}"> ${pm.id} --%> 
<%-- <%-- 				${pm.id} --%>
<%-- 			</c:forEach> --%>
<!-- 		</div> -->
<%-- 		</c:if> --%>
<!-- 	</div> -->
<!-- 	<div> -->
<!-- 		<input type="button" id="mouse_btn" value="일단 눌러봐"> -->
<!-- 	</div> -->

<!-- 	<form action="" id="frm" name="frm" method="POST"> -->
<%-- 		<input type="hidden" name="page_num" value="${page.page_num}"> --%>
<%-- 		<c:if test="${memberCheck eq 11 }"> --%>
<%-- 			<input type="hidden" name="pageMember_num" value="${member_num}"> --%>
<%-- 		</c:if> --%>
<!-- 	</form> -->
	
<%-- <%-- 		<c:when test="${not empty member and memberCheck eq 20}"> --%>
<!-- <!-- 			<input type="button" id="deletePage_btn" value="페이지 삭제하기"> -->
<%-- <%-- 		</c:when> --%>
<%-- 	<c:choose> --%>
<%-- 		<c:when test="${memberCheck eq 11}"> --%>
<!-- 			<input type="button" id="drop_btn" value="페이지 탈퇴하기"> -->
<%-- 		</c:when> --%>
<%-- 		<c:when test="${memberCheck eq 0}"> --%>
<!-- 			<input type="button" id="join_btn" value="페이지 가입하기"> -->
<%-- 		</c:when> --%>
<%-- 		<c:otherwise> --%>
<!-- 			<input type="button" id="" value="그룹장이라 탈퇴안되지롱"> -->
<%-- 		</c:otherwise> --%>
<%-- 	</c:choose> --%>

<!-- </div> -->
<!-- </div> -->
<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>
