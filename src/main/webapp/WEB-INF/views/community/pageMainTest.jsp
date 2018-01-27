<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${page.page_name}테스트</title>
<script src="https://cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
		//SmartEditor start
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
    
    
		
		
		$("#chatting_btn").click(function() {
			alert("채팅하기");
		});

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
		
		$("#mailBox_btn").click(function(){
			alert("메일함");
			
		});

	
	
		
	
		
	});

</script>
<style type="text/css">


</style>
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
			<button id="mailBox_btn" name="mailBox_btn"><span>쪽지함</span></button>
		</div>
		<!-- 쪽지함 div -->
		<div id="mailBox_div">

		</div>
		<!-- 가입 페이지  -->
		<div id="join_page_list" style="height: 100px; border: 1px solid red; margin-bottom: 20px;">
			가입한 페이지
		</div>
		<!-- 추천 페이지  -->
		<div id="recommend_page_list" style="height: 100px; border: 1px solid green;">
			추천 페이지
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
				<c:choose>
					<c:when test="${memberCheck eq 11}">
						<button class="page_btns" id="drop_btn"><img alt="" src="../resources/page/탈퇴img.png">탈퇴하기</button>
					</c:when>
					<c:when test="${memberCheck eq 0}">
						<button class="page_btns" id="join_btn">가입하기</button>
					</c:when>
					<c:otherwise>
						<button class="page_btns" id="">그룹장이라 탈퇴안되지롱</button>
					</c:otherwise>
				</c:choose>
				<input type = "text" class="page_btns" value="${pageMemberCount}명이 팔로우">
			</div>
			<!-- 커뮤니티 이름  -->
			<div style="float: right;">
				<h1>${page.page_name}</h1>
			</div>
		</div>
		<!-- 내용 넣을 것 -->
		<div id="PCview">

			<div id="writeForm">
	<div id="writeTab"> </div>
	<form action="../community/pageContentsWrite"  method="post" id="frm">
		<input type="hidden" id="page_num"  name="page_num" value="${page_num}">
		<textarea  name="contents" id="contents" rows="10" cols="30" ></textarea>
	
	<div class="_51xa">
	<button class="_1mf7 _4jy0 _4jy3 _4jy1 _51sy selected _42ft" id="savebutton" data-testid="react-composer-post-button" type="submit" value="1">
	<span class="">게시</span>
	</button>
	</div>

	</form>
			</div>
	<div id="contentsListView">
	
	</div>	
			
		</div>
	</div>
	
</div>

</div>


<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>
