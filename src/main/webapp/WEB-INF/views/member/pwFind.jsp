<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/headerBar.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/member/idPwFind.css">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$("#idFind_btn").click(function(){
			
			if($("#id").val()==""){
				alert("아이디를 입력해주세요");
				$("#id").focus();
			}else if($("#name").val()==""){
				alert("이름을 입력해주세요");
				$("name").focus();
			}else if($("#email").val()==""){
				alert("이메일을 입력해주세요");
				$("email").focus();
			}else{
				document.frm.submit();
			}
		});
		
		
		$("#login").click(function(){
			location.href="./memberLogin";
			
		});
		
		$("#idFind").click(function(){
			location.href="./idFind";
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
                            	비밀번호 찾기
                            </li>
                    	</ul>
                	</div>
            	</div>
        	</div>
        	<!-- 상단바 끝 -->
        	
        	
        	<!-- 내용 시작 -->
        	
        		
				<form action="../ajax/pwFind" method="post">
					<div id="idFind_form">
					<div id="idFind_all">
						
					<!-- menu -->	
						<div id="idFind_menu">
							<a href="#" class="idFind_idFind"><span>PW 찾기</span></a>
						</div>
					<!-- id -->
						<div id="idFind_id">
							<input type="text"  id="id" name="id" placeholder="아이디 입력">
						</div>
					<!-- name -->
						<div id="idFind_id">
							<input type="text"  id="name" name="name" placeholder="이름 입력">
						</div>
					<!-- email -->
						<div id="idFind_pw">
							<input type="text"  id="email" name="email" placeholder="이메일 입력">
						</div>
						
					<!-- 로그인버튼 -->
					<div id="list">
					</div>

					<!-- 비밀번호 찾기 버튼 -->
						<div id="idFind_btn">
							<input type="button" id = "btn" class="btn_color" value="비밀번호 찾기">
						</div>	
					
					<!-- 찾기버튼들 -->
					<ul class="btns">
						<li id="log"><a href="#" id="login" onclick="return false;">로그인</a></li>
						<li><a href="#" id="pwFind" onclick="return false;">아이디 찾기</a></li>
						<li id="join"><a href="#" id="joinF" onclick="return false;">회원가입</a></li>
					</ul>
					
					</div>
				</div>
				</form>
        	
        	<!-- //////////////////////////////////////////// -->
				<!-- <h2>PW FIND</h2>
				
				<form action="../ajax/pwFind" method="post">
					<p>id<input type="text"></p>
					<p>pw<input type="text"></p>
					<input type="button" value="pwFind">
					<div id="pwList"></div>
				</form> -->
			<!-- 내용 끝 -->
			
			</div>
			<!-- ///////////////////////////////// -->
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	</div>
</body>
</html>