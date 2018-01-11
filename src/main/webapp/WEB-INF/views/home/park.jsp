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
        	
        	
        	
        	
			<!-- 내용 끝 -->
			
			</div>
			<!-- ///////////////////////////////// -->
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	</div>










	<h2>박세나꺼</h2>
	
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
</body>
</html>