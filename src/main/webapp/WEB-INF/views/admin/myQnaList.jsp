<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/paging.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Q&A 리스트</title>

<style>
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
.list_container{
	position: relative;
    width: 800px;
	float: right;
	display: inline-block;
}
#otoTitle{
float: left;
	width:100%;
    height: 34px;
    background-image: none;
    color: rgb(34, 34, 34);
    font-family: NanumBarunGothicBold, "맑은 고딕", 돋움, Dotum, sans-serif;
    font-size: 17px;
    line-height: 34px;
    text-align: left;
    margin: 0px;
    display:block;
    margin-bottom:10px;
}

</style>
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
                            <li>
                                <a href="#">관리자</a>
                            </li>
                            <li class="last">
                            	QnaList
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
					<div class="skipnaiv">
						<a href="#" id="skipMycgvMenu">MYCGV 서브메뉴 건너띄기</a><!-- /////////// -->
					</div>
	    			<h2>MY CGV 서브메뉴</h2>
	    			<div class="snb">
	       			<ul>
	            	<li>
	            		<a href="../member/myPageView" title="현재 선택">MY CNEMA HOME <i></i></a>
	            	</li>
	            	<li>
	            		<a href="../myPage/movieHistory">나의 예매내역 <i></i></a>
	            			<ul>                      
		                        <li><a href="../myPage/movieHistory">내가 본 영화</a></li>
			                    <li><a href="../myPage/wishList">위시 리스트</a></li>
	                        </ul>
                	</li>
	            	<li>
	                	<a href="../myPage/couponHistory">나의 쿠폰 관리 <i></i></a>
	                	<ul>                      
	                        <li><a href="../myPage/couponHistory">나의 쿠폰</a></li>
	                        <li><a href="../myPage/couponHistory2">사용 내역</a></li>
	                	</ul>
	           		</li>
	            	<li>
                    	<a href="../myPage/pointHistory">나의 포인트 관리 <i></i></a>
	                	<ul>
                        	<li><a href="../myPage/pointHistory">포인트 적립/사용내역</a></li>
	                	</ul>
	            	</li>

	            	<li>
                    	<a href="../myPage/myInfoCheck">회원정보<i></i></a>
	                	<ul>
                        	<li><a href="../myPage/myInfoCheck">회원정보수정</a></li>
	                    	<li><a href="../myPage/withdrawalCheck">회원탈퇴</a></li>
	                	</ul>
	            	</li>
		            <li>
	                    <a href="../myPage/qnaHistory">나의 문의내역 <i></i></a>
		                <ul>
		                    <li><a href="../myPage/qnaHistory">1:1문의</a></li>
		                </ul>
		            </li>
		            <c:if test="${!empty member and member.type eq 20 }">
		            <li  class="on">
	                    <a href="#">관리자 <i></i></a>
		                <ul>
		                    <li><a href="../admin/movieList">무비 리스트</a></li>
		                    <li><a href="../admin/theaterList">극장 리스트</a></li>
		                    <li><a href="../admin/screenList">상영관 리스트</a></li>
		                    <li><a href="../admin/scheduleList">상영 리스트</a></li>
		                    <li class="on"><a href="../admin/myQnaList">문의 리스트</a></li>
		                    <li><a href="../admin/couponList">쿠폰 리스트</a></li>
		                    <li><a href="../admin/memberList?group_num=-1">회원 리스트</a></li>
		                </ul>
		            </li>
		            
		            </c:if>
	        		</ul>
	    			</div>
    			</div>
		
	<div class="list_container">
		<span id="otoTitle">문의 리스트</span><br>
		<%-- <br><p> 총  ${fn:length(list)}개 </p> --%>
	<table>
		<tr>
			<th>No.</th>
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
			<td>${dto.location}(${dto.area})</td>
			<td>
			
			<a href="../qna/qnaView?num=${dto.num}">[ ${dto.type} ] ${dto.title}</a>
			</td>
			<td>${dto.writer}</td>
			<td>${dto.reg_date}</td>
			<td>
			<c:if test="${dto.reply != null }">
			답변완료
			</c:if>
			<c:if test="${dto.reply == null }">
			대기중
			</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
	<br>
	<div class="paging">
					<ul id="paging_point">
						<c:if test="${pager.curBlock gt 1}">
							<li class="paging-side">
								<a href="myQnaList?curPage=${pager.startNum-1}"><button style="line-height: 26px;" class="btn-paging prev" type="button">이전</button></a>
							</li>						
						</c:if>
						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							<li style="text-decoration: none;" class=" on">
								<a href="myQnaList?curPage=${i}" title="${i}페이지 선택">${i}</a>
							</li>
						</c:forEach>
						<c:if test="${pager.curBlock lt pager.totalBlock}">
							<li class="paging-side">
								<a href="myQnaList?curPage=${pager.lastNum+1}"><button style="line-height: 26px;" class="btn-paging next" type="button">다음</button></a>
							</li>
						</c:if>
					</ul>
				</div>
<%-- 	<c:if test="${fn:length(list) != 0}">
	   	            <div class="paging">
					<ul id="paging_point">
						<c:choose>
						<c:when test="${fn:length(review) eq 0}">
							<li style="text-decoration: none;" class=" on">
								<a href="#" title="1페이지 선택">1</a>
							</li>
						</c:when>
						<c:otherwise>
						<c:if test="${pager.curBlock gt 1}">
							<li class="paging-side">
								<a href="#"><button style="line-height: 26px;" class="btn-paging prev" type="button">이전</button></a>
							</li>						
						</c:if>
						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							<li style="text-decoration: none;" class=" on">
								<a href="#" title="${i}페이지 선택">${i}</a>
							</li>
						</c:forEach>
						<c:if test="${pager.curBlock lt pager.totalBlock}">
							<li class="paging-side">
								<a href="#"><button style="line-height: 26px;" class="btn-paging next" type="button">다음</button></a>
							</li>
						</c:if>
						</c:otherwise>
						</c:choose>
					</ul>
				</div> --%>
<%-- 	<div>
		<c:if test="${pager.curBlock gt 1}">
			<span class="list" title="${pager.startNum-1}">[이전]</span>
		</c:if>
		<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			<span class="list" title="${i}">${i}</span>
		</c:forEach>
		<c:if test="${pager.curBlock lt pager.totalBlock}">
			<span class="list" title="${pager.lastNum+1}">[다음]</span>
		</c:if>
	</div> --%>
	
		</div>
	
			</div>
			</div>
			</div>
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	</div>
</body>
</html>