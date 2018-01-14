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
<title>게시판</title>
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
                        		<a href="../">
                        		<img alt="home" src="${pageContext.request.contextPath }/resources/images/common/btn/btn_home.png"></a>
                        	</li>
                            <li>
                                <a href="#">게시판</a>
                            </li>
                            <li>
                                <a href="#">공지사항</a>
                            </li>
                            <li class="last">
                            	전체
                            </li>
                    	</ul>
                	</div>
            	</div>
        	</div>
        	<!-- 상단바 끝 -->
        	
        	
        	<!-- 내용 시작 -->
        	
        	
	<h2>박세나꺼</h2>
	<div class="total-board">
		<!-- 이메일 문의 폼으로 넘어가기  -->
		<div class="c_box emaile_inquiry" style="cursor:pointer;">
			<strong class="c_tit email_tit">이메일 문의</strong>
			<span class="c_txt">24시간 365일 언제든지 문의해주세요.</span>
			<a class="round red" href="qnaWrite"><span style="padding:0 20px;">문의하기</span></a>
         </div>
         <!-- 본인 질문한거 보러가기 -->
         <div class="c_box my_advice" style="cursor:pointer;">
			<strong class="c_tit advice_tit">내 상담 내역 확인</strong>
			<span class="c_txt">문의하신 내용을 확인하실 수 있습니다.</span>
			<!-- <a class="round gray" href="../qna/qnaMyList" target="_blank" title="새창열기"><span style="padding:0 20px;">문의내역 조회</span></a> -->
           <form action="../qna/qnaMyList" method="post">
			<input type="hidden" name="id" value="${member.id }">
			<input type="submit" value="QnaList(MEMBER)">	
			</form>
           </div>
	</div>
	
	
	
	<h4>NOTICE</h4>
	<a href="../notice/noticeList">Notice List</a>
	<hr>
	<br>
	<h4>QNA</h4>
	<!--member  --> 
	<form action="../qna/qnaMyList" method="post">
	<input type="hidden" name="id" value="${member.id }">
	<input type="submit" value="QnaList(MEMBER)">	
	</form>
	<!-- Admin -->
	<a href="../qna/qnaList">Qna(Admin)</a>
	
	<a href="../qna/qnaList">Qna(확인용)</a>
	
	<a href="../qna/qnaWrite">문의하기</a>
	
	
	<hr>
	<h4>EVENT</h4>
	<a href="../event/eventList">Event List</a>
	
	<hr>
	<br>
	<a href="../">home</a>
        	
        	
			<!-- 내용 끝 -->
			
			</div>
			<!-- ///////////////////////////////// -->
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	</div>










</body>
</html>