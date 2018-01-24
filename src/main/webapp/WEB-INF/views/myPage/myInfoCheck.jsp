<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/headerBar.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/member/myPageView.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/myPage/myInfoCheck.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>비밀번호 확인</title>
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
                            	비밀번호 확인
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
					<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/sub.jsp"></c:import>
    			</div>
			<div class="col-detail" id="mycgv_contents">
			<!-- /////// -->
			
			<div class="tit-mycgv">
			    <h3>비밀번호 확인</h3>
			</div>
			<p class="info-com">고객님의 개인정보 보호를 위한 절차이오니, CNEMA 로그인 시 사용하는 비밀번호를 입력해 주세요.</p>
			<form id="form1" action="myInfoCheck" method="post">
			    <fieldset class="confirm">
			        <legend>비밀번호 확인</legend>
			        <div class="info-confirm">
			            <p>
			                <strong>아이디</strong> 
			                <strong>${id }</strong>
			            </p>
			                <p>
			                    <strong><label for="txtPassword">비밀번호</label></strong> 
			                    <input type="password" id="pwd" name="pwd" title="비밀번호" maxlength="20" class="small">
			                </p>
			        </div>
			    </fieldset>
			    <div class="set-btn">
			        <button type="submit" id="save" class="round inred on"><span>확인</span></button> 
			        <a href="../" class="round gray"><span>취소</span></a>
			    </div>
			</form>

			<!-- ////////////// -->
				    	
			<%-- <h3>비밀번호 확인</h3>
			<h5>고객님의 개인정보 보호를 위한 절차이이오니, CGV 로그인 시 사용하는 비밀번호를 입력해주세요.</h5>
			<form action="myInfoCheck" method="POST">
				아이디 : ${id }<br>
				비밀번호 : <input type="text" id="pwd" name="pwd"><br>
				<input type="submit" value="확인">
			</form>
				 --%>
			<!-- 내용에 따라 달라짐 -->
				
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