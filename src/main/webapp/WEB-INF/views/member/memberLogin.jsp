<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/headerBar.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/member/memberLogin.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		var message = '${message}';
		if(message != ""){
			alert(message);
		}
		
		$("#login_btn").click(function(){
			
			if($("#id_text").val()==""){
				alert("아이디를 입력해주세요");
				$("#id_text").focus();
			}else if($("#pw_text").val()==""){
				alert("비밀번호를 입력해주세요");
				$("#pw_text").focus();
			}else{
				document.frm.submit();
			}
		});
		
		
		$("#idFind").click(function(){
			location.href="./idFind";
			
		});
		
		$("#pwFind").click(function(){
			location.href="./pwFind";
		});
		
		$("#joinF").click(function(){
			location.href="./joinAgree";
		});
	});


</script>
</head>
<body>
	<div id="cgvwrap">
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/header.jsp"></c:import>

			<!-- //////////////////////////////// -->
			<div id="contaniner" class="">
        	<!-- 상단바 시작 -->
        	<div class="linemap-wrap">
           		<div class="sect-linemap">
                	<div class="sect-bcrumb">
                    	<ul>
                        	<li>
                        		<a href="#"><img alt="home" src="${pageContext.request.contextPath }/resources/images/common/btn/btn_home.png"></a>
                        	</li>
                            <li>
                                <a href="#">회원서비스</a>
                            </li>
                            <li class="last">
                            	로그인 
                            </li>
                    	</ul>
                	</div>
            	</div>
        	</div>
        	<!-- 상단바 끝 -->
        	
        	
        	<!-- 내용 시작 -->
        	<form action="memberLogin" id="frm" name="frm" method="post">
				<div id="login_form">
					<div id="login_all">
					
						<div id="login_menu">
							<a href="#" class="login_login"><span>로그인</span></a>
						</div>
			
						<div id="login_id">
							<p><input type="text" id="id_text" name="id" placeholder="아이디 입력" value="ssin"></p>
						</div>
						
						<div id="login_pw">
							<p><input type="password" id="pw_text" name="pw" placeholder="비밀번호 입력" value="ssin226"></p>
						</div>
						
						<div id="login_btn">
							<a href="#" onclick="return false;" id="login">로그인</a>
						</div>
						
						<ul class="btns">
							<li id="idf"><a href="#" id="idFind" onclick="return false;" >아이디찾기</a></li>
							<li><a href="#" id="pwFind" onclick="return false;">비밀번호찾기</a></li>
							<li id="join"><a href="#" id="joinF" onclick="return false;">회원가입</a></li>
						</ul>
						
        			</div>
        		</div>
        	</form>
        	<!-- 내용 끝 -->
			</div>
			<!-- ///////////////////////////////// -->
	
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	</div>
</body>
</html>