<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${page.page_name}</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
<script type="text/javascript" src="../resources/SE2/js/HuskyEZCreator.js"></script>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/main/slide.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/main/main.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/community/pageMain.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/pageContents/write.css">

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
		
		var check = true;
		
		$("#memberBar_btn").click(function() {
			if(check){
				
				$.ajax({
					url:"member_profile_bar",
					type:"POST",
					data:{
						page_num:${page.page_num }
					},
					success:function(data){
						$("#mb").html(data);
					}
				});
				check =!check;
			}else{
				$("#mb").html("");
				check = !check;
			}
		});
		
			//SmartEditor start3
			//전역변수선언
	    var editor_object = [];
	     
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: editor_object,
	        //textarea ID
	        elPlaceHolder: "contents",
	        sSkinURI: "../resources/SE2/SmartEditor2Skin.html", 
	        htParams : {
	            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseToolbar : true,             
	            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseVerticalResizer : false,     
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseModeChanger : false, 
	        }
	    });
	     
	    //전송버튼 클릭이벤트
	    $("#savebutton").click(function(){
	        //id가 smarteditor인 textarea에 에디터에서 대입
	        editor_object.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
	         
	        // 이부분에 에디터 validation 검증
	         
	        //폼 submit
	        $("#frm").submit();
	    });
	    
	    //무한스크롤
	    $(window).scroll(function() {
		    
		    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
		      page++;

				$.ajax({
					url:"../community/scrolling",
					type:"POST",
					data:{
					 page:page,
					 page_num:page_num
					},
					success:function(data){
						$("#contentsListView").append("<h1>Page " + page + "</h1>")+data;
						},
					error : function(){
						
					}
				});

		    }
		});
	    
	    //댓글 쓰기
// 	    $(".pageContentsOne").on("click", ".content_reply_btn", function() {
// 	    	var contents_num = $(this).attr("title");
// 			$.ajax({
// 				url:"replyForm",
// 				type:"POST",
// 				data:{
// 					contents_num: contents_num,
// 					page_num: ${page_num}
// 				},
// 				success:function(data){
// 					$("#content_btns_div" + ${contents_num}).empty();
// 					$("#content_btns_div" + ${contents_num}).html(data);
// 				}
// 			});
// 	    });

	    $(".content_reply_btn").click(function() {
	    	var contents_num = $(this).attr("title");
			$.ajax({
				url:"replyForm",
				type:"POST",
				data:{
					contents_num: contents_num,
					page_num: ${page_num }
				},
				success:function(data){
					$("#content_btns_div"+contents_num).empty();
					$("#content_btns_div"+contents_num).html(data);
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
						<p><img alt="${join.page_name }" src="../resources/page_logo/${join.fileName }"> <a href="pageMain?page_num=${join.page_num }"><span>${join.page_name }</span></a></p>
					</div>
				</c:if>
				<c:if test="${count.count <= 3 }">
					<p><img alt="${join.page_name }" src="../resources/page_logo/${join.fileName }">  <a href="pageMain?page_num=${join.page_num }"><span>${join.page_name }</span></a></p>
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
						<p><img alt="${join.page_name }" src="../resources/page_logo/${recommend.fileName }"> <a href="pageMain?page_num=${recommend.page_num }"><span>${recommend.page_name }</span></a></p>
					</div>
				</c:if>
				<c:if test="${count.count <= 3 }">
					<p><img alt="${recommend.page_name }" src="../resources/page_logo/${recommend.fileName }"> <a href="pageMain?page_num=${recommend.page_num }"><span>${recommend.page_name }</span></a></p>
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
						<button class="page_btns" id="">그룹장입니다</button>
					</c:otherwise>
				</c:choose>
				<button class="page_btns"><img src="../resources/page/팔로우.png">${pageMemberCount } 명이 팔로우</button>
			</div>
			<!-- 커뮤니티 이름  -->
			<div style="float: right;">
				<h1>${page.page_name}</h1>
			</div>
		</div>
		<!-- 컨텐츠 -->
		<div id="writeForm">
		<div id="writeTab"> </div>
		<form action="../community/pageContentsWrite"  method="post" id="frm">
			<input type="hidden" id="page_num"  name="page_num" value="${page.page_num}">
			<input type="hidden" name="id" value="${member.id}">
			<textarea  name="contents" id="contents" rows="10" cols="30" ></textarea>
		
			<div class="_51xa">
			<button class="_1mf7 _4jy0 _4jy3 _4jy1 _51sy selected _42ft" id="savebutton"  type="submit">
				<span class="">게시</span>
			</button>

			</div>
		</form>
		</div>
		<div id="contentsListView">
			<c:forEach items="${list}" var="dto">
			 <div class="pageContentsOne">
				 <input type="hidden" id="contents_num" value="${dto.contents_num }">
				 <div id="update_div">
				 <span class="updateBtn btns">수정</span><span class="deleteBtn btns">삭제</span>
				 </div>

				 <div id="contents_div">
				 	${dto.contents}
				 </div>

				 <div id="content_btns_div${dto.contents_num }" class="content_btns_div">
					 <button class="like cbtns content_like_btn btns" title="${dto.contents_num }">좋아요</button>
					 <button class="reply cbtns content_reply_btn btns" title="${dto.contents_num }">댓글</button>
					 <button class="warning cbtns btns" title="${dto.contents_num }">신고</button>
				 </div>

<!-- 				 <div id="reply_div"> -->

<!-- 				 </div> -->
				 
				 <div id="replyList${dto.contents_num }"> </div>
			 </div>
			</c:forEach>
	
		<div id="listView"></div>
	
	</div>
	<!-- 컨텐츠 끝 -->
	
	</div>
	<!-- 우측 멤버 명단  -->
	<div id="mb">
	</div>
	<div id="member_bar">
		<a href=# onclick="return false;" id="memberBar_btn" role="button">
			커뮤니티 멤버
		</a>
	</div>
</div>

</div>

<!-- <div style="width: 1012px; height: 1000px; background-color: #f0f0f0; text-align: center; margin: 50px auto;"> -->

<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>
