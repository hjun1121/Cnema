<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/headerBar.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/member/myPageView.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/myPage/myInfo.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	$(function(){
		var pwCheck = true;
		var emailCheck = true;
		
		var p0='${p[0]}';
		$(".f").each(function(){
			if($(this).val()==p0){
				$(this).attr("selected",true);
			}
		});
		var e1 = '${e[1]}';
		$(".mail").each(function(){
			if($(this).val()==e1){
				$(this).attr("selected",true);
			}
		});
		
		$("#pw1").change(function(){
			$("#pwc").html('<input type="password" class="noneBorder" id="pw2">');
			var pw1= $("#pw1").val();
			var pwpw=false;
			for(var i=0; i<pw1.length;i++){
				if(pw1.charAt(i) == '!' || pw1.charAt(i) == '@' || pw1.charAt(i) =='#' || pw1.charAt(i) =='$' || pw1.charAt(i) =='%' || pw1.charAt(i) =='^' || pw1.charAt(i) =='&' || pw1.charAt(i) =='*'){
					i= pw1.length;
					pwpw=true;
				}
			}
			if(pwpw==true && pw1.length>7 && pw1.length<13 ){
				$("#pw_ch").html('<p style="color: red">비밀번호를 확인해주세요</p>');
				$("#pw2").val("");
				$("#pw2").removeAttr("readonly")
				pwCheck = false;
				
			}else{
				$("#pw_ch").html('<p style="color: red">비밀번호는 1개 이상의 특수문자 와 8~12 자리 </p>');
				$("#pw2").val("");
				
				$("#pw2").attr("readonly", "readonly")
				pwCheck = false;
			}
		});
		
		$("#pwc").on("change","#pw2",function(){
			var pw1= $("#pw1").val();
			var pw2= $("#pw2").val();
			if(pw1 == pw2){
				$("#pw_ch").html('<p style="color: green">비밀번호 확인 완료</p>');
				pwCheck = true;
			}else{
				$("#pw_ch").html('<p style="color: red">비밀번호가 다릅니다</p>');
				pwCheck = false;
			}
		});
		
		
		//주소검색 시작
		$("#addrCheck").click(function(){
			new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = ''; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수

	                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    fullAddr = data.roadAddress;

	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    fullAddr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	                if(data.userSelectedType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                $("#postCode").val(data.zonecode);  //5자리 새우편번호 사용
					$("#addr").val(fullAddr);
	                // 커서를 상세주소 필드로 이동한다.
	                 $("#addr2").val("");
	                $("#addr2").focus();
	            }
	        }).open();
		    
		});
		//주소검색 끝
		
		$("#mailList").change(function(){
			var ml = $("#mailList").val();
			if(ml == 0){
				$("#email2").prop('readonly', false)
				$("#email2").val("");
				$("#email2").focus();
			}else{
				$("#email2").val(ml);
				$("#email2").prop('readonly', true)
			}
		});

		$("#mailCheck").click(function(){
			var email1 = $("#email1").val();
			var email2 = $("#email2").val();
			var email = email1 +'@'+email2;
			if(email1 ==""){
				alert("이메일 앞주소를 확인해주세요");
				$("#email1").focus();
			}else if(email2 ==""){
				alert("이메일주소를 확인해주세요");
				$("#email2").focus();
			}else if(emailCheck){
				alert("이미 인증된 이메일입니다");
			}else{
			$("#email").val(email);
				
				$.ajax({
					url:"../ajax/emailCheck",
					type:"post",
					data:{
						email:email
					},
					success:function(data){
						$("#email_ch").html(data);
					}
				});
			}
		});
		
		$("#email1").change(function(){
			emailCheck=false;
			$("#email_ch").html("<p style=\"color: red\">이메일 인증 필요</p>");
		});
		$("#email2").change(function(){
			emailCheck=false;
			$("#email_ch").html("<p style=\"color: red\">이메일 인증 필요</p>");
		});
		$("#mailList").change(function(){
			emailCheck=false;
			$("#email_ch").html("<p style=\"color: red\">이메일 인증 필요</p>");
		});
		
		
		$("#email_ch").on("click","#check",function(){
			if($("#num").val() == $("#code").val()){
				emailCheck=true;
				$("#email_ch").html("<p style=\"color: green\">이메일 인증 완료</p>");
				
			}else{
				$("#email_ch").html("<p style=\"color: red\">잘못된 인증번호</p>");
				emailCheck=false;
			}	
		});
		
		$("#pBtn").click(function(){
			$("#profile").html('<input type="file" class="noneBorder" id="file" name="file" >');
		});
		
		$("#revBtn").click(function(){
			var f = $("#f").val();
			var m = $("#m").val();
			var l = $("#l").val();
			var phone = f+'-'+m+'-'+l;
			$("#phone").val(phone);
			var email1 = $("#email1").val();
			var email2 = $("#email2").val();
			var email = email1+'@'+email2;
			
			$("#email").val(email);
			if(pwCheck == false){
				alert("비밀번호를 확인해 주세요.");
				$("#pw1").focus();
			}else if($("#addr").val()==""){
				alert("주소를 검색해주세요");	
				$("#addrCheck").focus();	
			}else if($("#addr2").val()==""){
				alert("나머지 주소를 입력해 주세요");	
				$("#addr2").focus();	
			}else if($("#f").val()=="x"){
				alert("첫번호를 확인해 주세요");
				$("#f").focus();	
			}else if($("#m").val()==""){
				alert("중간번호를 확인해 주세요");
				$("#m").focus();
			}else if($("#l").val()==""){
				alert("끝번호를 확인해 주세요");
				$("#l").focus();
			}else if(emailCheck == false){
				alert("이메일인증  필수");
				$("#email1").focus();
			}else{
				document.frm.submit();
			}
		})
	});

</script>
</head>
<body>
<div id="cgvwrap">
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/header.jsp"></c:import>

			<!-- //////////////////////////////// -->
			
			<div id="contaniner" class="bg-bricks main bg-bricks">
        	<!-- 상단바 시작 -->
        	<div class="linemap-wrap">
           		<div class="sect-linemap">
                	<div class="sect-bcrumb">
                    	<ul>
                        	<li>
                        		<a href="#"><img alt="home" src="${pageContext.request.contextPath }/resources/images/common/btn/btn_home.png"></a>
                        	</li>
                            <li>
                                <a href="#">회원정보</a>
                            </li>
                            <li class="last">
                            	회원정보 수정
                            </li>
                    	</ul>
                	</div>
            	</div>
        	</div>
        	<!-- 상단바 끝 -->
        	
        	
        	<!-- 내용 시작 -->
        	
        	
        	<div id="contents" class="">
            
            <!-- Contents Start -->

			<div class="sect-common">
				<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/info.jsp"></c:import>
			</div>

			<div class="cols-content" id="menu">
    			<div class="col-aside">
					<div class="skipnaiv">
						<a href="#" id="skipMycgvMenu">MYCGV 서브메뉴 건너띄기</a><!-- /////////// -->
					</div>
	    			<h2>MY CGV 서브메뉴</h2>
	    			<div class="snb">
	       			<ul>
	            	<li>
	            		<a href="../member/myPageView" title="현재 선택">MY CNEMA HOME <i></i></a>
	            	</li>
	            	<li>
	            		<a href="../myPage/movieHistory">나의 예매내역 <i></i></a>
	            			<ul>                      
		                        <li><a href="../myPage/movieHistory">내가 본 영화</a></li>
			                    <li><a href="../myPage/wishList">위시 리스트</a></li>
	                        </ul>
                	</li>
	            	<li>
	                	<a href="../myPage/couponHistory">나의 쿠폰 관리 <i></i></a>
	                	<ul>                      
	                        <li><a href="../myPage/couponHistory">나의 쿠폰</a></li>
	                        <li><a href="../myPage/couponHistory2">사용 내역</a></li>
	                	</ul>
	           		</li>
	            	<li>
                    	<a href="../myPage/pointHistory">나의 포인트 관리 <i></i></a>
	                	<ul>
                        	<li><a href="../myPage/pointHistory">포인트 적립/사용내역</a></li>
	                	</ul>
	            	</li>

	            	<li class="on">
                    	<a href="../myPage/myInfoCheck">회원정보<i></i></a>
	                	<ul>
                        	<li class="on"><a href="../myPage/myInfoCheck">회원정보수정</a></li>
	                    	<li><a href="../myPage/withdrawalCheck">회원탈퇴</a></li>
	                	</ul>
	            	</li>
		            <li>
	                    <a href="../admin/myQnaList">나의 문의내역 <i></i></a>
		                <ul>
		                    <li><a href="../admin/myQnaList">1:1문의</a></li>
		                </ul>
		            </li>
		            <c:if test="${!empty member and member.type eq 20 }">
		            <li>
	                    <a href="#">관리자 <i></i></a>
		                <ul>
		                    <li><a href="../admin/movieList">무비 리스트</a></li>
		                    <li><a href="../admin/theaterList">극장 리스트</a></li>
		                    <li><a href="../admin/screenList?theater_num=-1">상영관 리스트</a></li>
		                    <li><a href="../admin/scheduleList">상영 리스트</a></li>
		                    <li><a href="../admin/couponList">쿠폰 리스트</a></li>
		                    <li><a href="../admin/memberList?group_num=-1&sort=-1">회원 리스트</a></li>
		                </ul>
		            </li>
		            
		            </c:if>
	        		</ul>
	    			</div>
    			</div>
			<div class="col-detail" id="mycgv_contents">
			<!-- ///내용에따라 바뀜//// -->
			
			<div class="tit-mycgv">
			    <h3>회원 정보 수정</h3>
			</div>
			<p class="info-com">&nbsp;</p>
			<form action="myInfoRevision" method="post" name="frm" enctype="multipart/form-data">
				<table  class="revisionTable">
					<tr>
						<td>아이디</td>
						<td><input type="text" class="noneBorder" id="id" name="id" value="${myInfo.id }" readonly="readonly"></td>
					</tr>
					
					<tr>
						<td rowspan="2">비밀번호</td>
						<td><input type="password"  class="noneBorder" id="pw1" name="pw" value="${myInfo.pw }"><br></td>
					</tr>
					<tr>
						<td><div id="pwc"></div>
							<div id="pw_ch"></div></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" class="noneBorder" id="name" name="name" value="${myInfo.name }" readonly="readonly"></td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td><input type="date" class="noneBorder" id="birth" name="birth" value="${myInfo.birth }" readonly="readonly"></td>
					</tr>
					<tr>
						<td>성별</td>
						<c:if test="${myInfo.gender eq 'f'}">
							<td><input type="text"  class="noneBorder" id="gender" name="gender" value="여자" readonly="readonly"></td>
						</c:if>
						<c:if test="${myInfo.gender eq 'm'}">
							<td><input type="text"  class="noneBorder" id="gender" name="gender" value="남자" readonly="readonly"></td>
						</c:if>
						
					</tr>
					<tr>
						<td>전화번호</td>
						<td>
							<select id="f" >
					   			<option class="f num" value="">선택하세요</option>
					   			<option class="f num" value="010">010</option>
								<option class="f num" value="011">011</option>
							</select>
							-
							<input type="text" class="noneBorder" id="m" value="${p[1] }">
							-
							<input type="text" class="noneBorder" id="l" value="${p[2] }">
						</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>
						<input type="text" id="email1" class="noneBorder" value="${e[0] }">@
						<input type="text" id="email2" class="noneBorder" readonly="readonly" value="${e[1] }">
						<select id = "mailList" >
				   			<option class="mail" value="0">직접입력</option>
							<option class="mail" value="naver.com">naver.com</option>
							<option class="mail" value="daum.net">daum.net</option>
							<option class="mail" value="gmail.com">gmail.com</option>
							<option class="mail" value="hotmail.com">hotmail.com</option>
						</select>
						<input type="button" id="mailCheck" value="이메일 인증" class="btnType4" style="margin-top: 5px; cursor: pointer;">
						<input type="hidden" id="email" name="email" value="" class="noneBorder">
						
						<div id="email_ch" style="margin-top: 5px;"></div></td>
					</tr>
					<tr>
						<td>POSTCODE</td>
						<td><input type="text" class="noneBorder" id="postCode" name="postCode" placeholder="우편번호" readonly="readonly" value="${myInfo.postCode }">
							<input type="button" class="btnType4" id="addrCheck" value="우편번호 찾기" readonly="readonly" ></td>
					</tr>
					<tr>
						<td>나머지주소</td>
						<td><input type="text" class="noneBorder" id="addr" name="addr1" placeholder="주소" readonly="readonly" value="${myInfo.addr1 }">
							<input type="text" class="noneBorder" id="addr2" name="addr2" placeholder="나머지주소" value="${myInfo.addr2 }"></td>
					</tr>
				<tr>
					<td>프사</td>
					<td id="profile"><img style="width: 100px; height: 80px;" src="${pageContext.request.contextPath }/resources/profil/${member.fileName}">
					<input type="button" id="pBtn" value=" x " style="margin-top: -60px;"></td>
				</tr>
				</table>
				<input type="hidden" id="phone" name="phone">
				<div class="set-btn">
			        <button type="button" id="revBtn" class="round inred on"><span>수정</span></button> 
			        <a href="../" class="round gray"><span>취소</span></a>
			    </div>
				
			</form>
			
			<!-- //내용에 따라 바뀜// -->
		</div>
		</div>
		</div>
       
		<!-- 내용 끝 -->
			</div>
			<!-- ///////////////////////////////// -->
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	</div>
</body>
</html>