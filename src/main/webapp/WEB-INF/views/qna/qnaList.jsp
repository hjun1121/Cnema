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

<title>Insert title here</title>

</head>
<script type="text/javascript">
	$(function(){
		var message = '${message}';
		if(message != ""){
			alert(message);
		}
		
		$(".list").click(function(){
			var cur = $(this).attr("title");
			var s = '${pager.search}';
			var t = '${pager.kind}';
			document.frm.curPage.value=cur;
			document.frm.search.value=s;
			document.frm.kind.value=t;
			document.frm.submit();
		})
	});
</script>
<style type="text/css">
	.list{
		cursor: pointer; 
	}
table{
    padding-top: 10px;
        border-top: solid 1px #d6d4ca;
    border-bottom: solid 1px #b8b6aa;
}
th {
    padding: 10px 0 8px 0px;
    border-bottom: solid 1px #e1dfd5;
    text-align: center;
    background-color: #edebe1;
    vertical-align: middle;
    line-height: 1.5em;
}
tr{

    display: table-row;
 }
td{

    padding: 15px 0px 13px 0px;
    border-top: solid 1px #d6d4ca;
    text-align: center;
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

	<table>
		<tr>
			<th>no.</th>
			<th>영화관</th>
			<th>글제목</th>
			<th>글쓴이</th>
			<th>등록일</th>
			<th>답변</th>
		</tr>
		<c:forEach items="${list}" var="dto">
		<tr>
			<%-- <td><img src="${pageContext.request.contextPath}/resources/board/${dto.fileName}"></td> --%>
			<td>${dto.num }</td>
			<td>${dto.area} : ${dto.location}</td>
			<td>
			
			<a href="qnaView?num=${dto.num}">[ ${dto.type} ] ${dto.title}</a>
			</td>
			<td>${dto.writer}</td>
			<td>${dto.reg_date}</td>
			<td>
			<c:if test="${dto.reply != null }">
			답변완료
			</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
	
	<div>
		<c:if test="${pager.curBlock gt 1}">
			<span class="list" title="${pager.startNum-1}">[이전]</span>
		</c:if>
		<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			<span class="list" title="${i}">${i}</span>
		</c:forEach>
		<c:if test="${pager.curBlock lt pager.totalBlock}">
			<span class="list" title="${pager.lastNum+1}">[다음]</span>
		</c:if>
	</div>
	
	
		</div><!--게시판 내용  -->
	
	
	</div>
	
	
	<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	
</div>
</body>
</html>