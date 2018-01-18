<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/headerBar.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/boardMain/boardTab.css">

<title>Insert title here</title>
<style type="text/css">
.board_container{
	width: 1200px;
	margin:0 auto;
	margin-top:40px;
 
}
</style>
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
                            	글쓰기
                            </li>
                    	</ul>
                	</div>
            	</div>
        	</div>
        	<!-- 상단바 끝 -->
        	
	
	
	<div class="board_container">
	<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/board/board_tab.jsp"></c:import>
<h1>Qna View Page</h1>
	<div>
		<table class="table table-hover">
			<tr>
				<td>지역</td>
				<td>영화관</td>
				<td>문의유형</td>
				<td>제목</td>
				<td>등록일</td>
			</tr>
			<tr>
				<td>${list.area}</td>
				<td>${list.location }</td>
				<td>${list.type}</td>
				<td>${list.title }</td>
				<td>${list.reg_date }</td>
			</tr>
		</table>
		<textarea class="form-control" rows="5">${list.contents }</textarea>
		<%-- <c:forEach items="${list.ar }" var="file">
			<a href="../util/download?fileName=${file.fileName}&oriName=${file.oriName}">${file.oriName}</a>
		</c:forEach> --%>
		
		<a href="qnaDelete?num=${list.num }" class="btn btn-default">DELETE</a>
		<a href="./qnaList" class="btn btn-default">List</a>
		
	</div>
	<!--  답글 표시 하기 (관리자일때만 보이게 하기) -->
	<c:if test="${member.type == 20 }"></c:if>
	<div id="reply">
	<form action="qnaUpdate" id="frm" method="post">
		<h3>답변 달기</h3>
		<input type="hidden" name="num" value="${list.num}">
		<input type="hidden" name="reply_id" value="${member.id}">
		<textarea name="reply" rows="5" cols="30"></textarea>
		<c:if test="${list.reply==null}">
		<button type="submit">답변 달기</button>
		</c:if>
		<c:if test="${list.reply != null}">
		<button type="submit">답변 수정</button>
		</c:if>
		</form>
	</div>
	
	
	<!-- 답변 단 내용 보여주기  -->
	<div class="reply-contents">
        <ul class="writerinfo">
            <li>${list.reply_id }</li>
            <li class="day-writerinfo">${list.reply_date }</li>
        </ul>
         <p>${list.reply }</p>
    </div>
		
			</div><!--게시판 내용  -->
	
	
	</div>
	
	
	<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	
</div>
</body>
</html>