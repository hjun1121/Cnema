<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/headerBar.css">

<title>Insert title here</title>
<style type="text/css">
.board_container{
	width: 1200px;
	height:1000px;
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
<h1>Notice Update Form</h1>
	
	<form action="noticeUpdate" method="post" id="frm">
		<input type="hidden" name="num" value="${view.num}">
		<table>
		<tr>
			<td><input type="text" name="title" value="${view.title}"></td>
			<td><input type="text" name="writer" value="${view.writer}" readonly="readonly"></td>
		</tr>
		<tr>
			<td class="content" colspan="2"><textarea id="contents" name="contents" draggable="false">${view.contents}</textarea></td>
		</tr>
		
	</table>
		<input type="submit" id="savebutton" value="수정">
	</form>
			
			</div><!--게시판 내용  -->
	
	
	</div>
	
	
	<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	
</div>
</body>
</html>