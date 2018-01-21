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
		$("#login").click(function(){
			location.href="./memberLogin";
		});
		$("#pwFind").click(function(){
			location.href="./pwFind";
		});
		$("#joinF").click(function(){
			location.href="./joinAgree";
		});
		
		$("#btn").click(function(){
			var name = $("#name").val();
			var email = $("#email").val();
			
			if(name==""){
				alert("이름을 입력해주세요");
				$("#name").focus();
			}else if(email==""){
				alert("이메일을 입력해주세요");
				$("#email").focus();
			}else{
				$.ajax({
					url:"../ajax/idFind",
					type:"POST",
					data:{
						name : name,
						email : email
					},
					success:function(data){
						$("#idList").html(data);
					}
				});
			}
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
                            	아이디 찾기
                            </li>
                    	</ul>
                	</div>
            	</div>
        	</div>
        	<!-- 상단바 끝 -->
        	
        	
        	<!-- 내용 시작 -->
	
				<form action="../ajax/idFind" method="post">
				<div id="idFind_form">
				<div id="idFind_all">
					
				<!-- menu -->	
					<div id="idFind_menu">
						<a href="#" class="idFind_idFind"><span>ID 찾기</span></a>
					</div>
				<!-- name -->
					<div id="idFind_id">
						<input type="text"  id="name" name="name" placeholder="이름 입력">
					</div>
				<!-- email -->
					<div id="idFind_pw">
						<input type="text"  id="email" name="email" placeholder="이메일 입력">
					</div>
					
				<!-- -->
				<div id="idList">
				</div>
					
				<!-- 아이디 찾기 버튼 -->
					<div id="idFind_btn">
						<input type="button" id = "btn" class="btn_color" value="아아디 찾기" style="cursor: pointer;">
					</div>	
				
				<!-- 찾기버튼들 -->
				<ul class="btns">
					<li id="log"><a href="#" id="login" onclick="return false;">로그인</a></li>
					<li><a href="#" id="pwFind" onclick="return false;">비밀번호 찾기</a></li>
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