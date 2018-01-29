<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/headerBar.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/boardMain/boardTab.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/paging.css">
<title>공지사항</title>
<style type="text/css">

</style>
<script type="text/javascript">
	$(function(){
		var message = '${message}';
		if(message != ""){
			alert(message);
		}
		
		$("#btn_search").click(function(){
			var cur = $(this).attr("title");
			var s = '${search}';
			var t = '${kind}';
			document.frm.curPage.value=cur;
			document.frm.search.value=s;
			document.frm.kind.value=t;
			document.frm.submit();
		});
	});
</script>
<style type="text/css">
.list {
	cursor: pointer;
}

#savebutton {
	padding: 10px 15px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 12px;
	margin: 0 auto;
	-webkit-transition-duration: 0.4s;
	transition-duration: 0.4s;
	cursor: pointer;
	border-radius: 5px;
	background-color: #e71a0f;
	color: #ffffff;
	border: 2px solid #e71a0f;
}

.sizeChange {
	height: 30px;
}

#wordSearch {
	font-size: 10px;
	width: 200px;
	height: 24px;
}

table {
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

tr {
	display: table-row;
}

td {
	padding: 15px 0px 13px 0px;
	border-top: solid 1px #d6d4ca;
	text-align: center;
}

.tit {
	color: #222;
	font-weight: bold;
	display: inline-block;
	font-size: 26px;
	text-align: left;
	vertical-align: middle;
}

#btn1 {
	padding: 3px 9px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 12px;
	margin: 0 auto;
	-webkit-transition-duration: 0.4s;
	transition-duration: 0.4s;
	cursor: pointer;
	border-radius: 5px;
	color: #e71a0f;
	border: 2px solid #e71a0f;
}

#btn1:hover {
	background-color: #e71a0f;
	color: white;
}

.round.inblack {
	background: #222222;
	border: 2px solid #222222;
	color: #ffffff;
	line-height: 21px;
	border-radius: 3px;
	padding: 1px;
}

.round.inblack:before {
	left: -2px;
	top: -2px;
	background-position: -10px -10px;
	z-index: 1;
}

.round.inblack:after {
	left: -2px;
	bottom: -2px;
	background-position: -10px -15px;
}

.round.inblack>* {
	border: 1px solid #5b5b58;
}

.round.inblack>*:before {
	right: -3px;
	top: -3px;
	background-position: -15px -10px;
}

.round.inblack>*:after {
	right: -3px;
	bottom: -3px;
	background-position: -15px -15px;
}

.round, .round>* {
	display: inline-block;
	position: relative;
}

.round {
	line-height: 23px;
	font-family: 'NanumBarunGothicBold';
	text-align: center;
	vertical-align: middle;
}

.round>* {
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	width: 100%; /* height:100%; */
	padding: 0px 5px;
} /* 20140620 Del padding-top:2px !important; */
*+html .round {
	white-space: nowrap;
}

*+html .round>* {
	border: none !important;
	padding: 0;
	cursor: pointer;
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
                            	목록
                            </li>
                    	</ul>
                	</div>
            	</div>
        	</div>
        	<!-- 상단바 끝 -->
        	
	
	
	<div class="board_container">


	<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/boardTab/noticeTab.jsp"></c:import>
	
	
	<div class="board_contents">
	<form name="frm" action="./noticeList" method="get">
	<span class="tit">공지/뉴스</span>
	<p>CGV의 주요한 이슈 및 여러가지 소식들을 확인하실 수 있습니다.<br><br></p>
	<input type="hidden" name="curPage" value="1">
		<select name="kind" class="sizeChange">
			<option class="kind">제목</option>
			<option class="kind">내용</option>
		</select>
		<input type="text" name="search" class="sizeChange" id="wordSearch" placeholder="검색어를 입력해 주세요">
		<button type="button" class="round inblack" title="검색하기" id="btn_search"><span>검색하기</span></button>
	</form>
	<br>
	<table>
		<tr>
			<th>no.</th>
			<th>글제목</th>
			<th>글쓴이</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${list}" var="dto">
		<tr>
			<td>${dto.num}</td>
			<td>
			<a href="./noticeView?num=${dto.num}">${dto.title}</a>
			</td> 
			<td>${dto.writer}</td>
			<td>${dto.reg_date}</td>
			<td>${dto.hit}</td>
		</tr>
		</c:forEach>
	</table>
	<br>
	
	
	
	   	            <div class="paging">
					<ul id="paging_point">
						<c:if test="${pager.curBlock gt 1}">
							<li class="paging-side">
								<a href="noticeList?kind=${kind}&search=${search}&curPage=${pager.startNum-1}"><button style="line-height: 26px;" class="btn-paging prev" type="button">이전</button></a>
							</li>						
						</c:if>
						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							<li style="text-decoration: none;" class=" on">
								<a href="noticeList?kind=${kind}&search=${search}&movie_num=${movie.movie_num}&curPage=${i}" title="${i}페이지 선택">${i}</a>
							</li>
						</c:forEach>
						<c:if test="${pager.curBlock lt pager.totalBlock}">
							<li class="paging-side">
								<a href="noticeList?kind=${kind}&search=${search}&movie_num=${movie.movie_num}&curPage=${pager.lastNum+1}"><button style="line-height: 26px;" class="btn-paging next" type="button">다음</button></a>
							</li>
						</c:if>
					</ul>
				</div>
	<c:if test="${not empty member and member.type eq 20  }">
		<a id="btn1" href="./noticeWrite">글쓰기</a>
	</c:if>
	<%-- <div>
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
	<br>
	<c:if test="${not empty member and member.type eq 20  }">
		<a id="btn1" href="./noticeWrite">글쓰기</a>
	</c:if>
	</div>		 --%>
			</div><!--게시판 내용  -->
	
	
	</div>
	
	
	<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	
</div>
</body>
</html>