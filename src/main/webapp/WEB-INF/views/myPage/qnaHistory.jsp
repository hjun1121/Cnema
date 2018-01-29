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
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/theaterList.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/paging.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>1:1 문의</title>
<script type="text/javascript">
$(function(){
	var kind='${kind}';
	$(".kind").each(function(){
		if($(this).val()==kind){
			$(this).attr("selected",true);
		}
	});
	var search='${search}';
	$("#search").val(search);
	
	$("#sBtn").click(function(){
		var sKind = $("#kind").val();
		var search = $("#search").val();
		location.href="./qnaHistory?kind="+sKind+"&search="+search;
	});
	
});
</script>
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
                            	영화 목록
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
		            <li class="on">
	                    <a href="../myPage/qnaHistory">나의 문의내역 <i></i></a>
		                <ul>
		                    <li class="on"><a href="../myPage/qnaHistory">1:1문의</a></li>
		                </ul>
		            </li>
		            <c:if test="${!empty member and member.type eq 20 }">
		            <li>
	                    <a href="../admin/movieList">관리자 <i></i></a>
		                <ul>
		                    <li><a href="../admin/movieList">무비 리스트</a></li>
		                    <li><a href="../admin/theaterList">극장 리스트</a></li>
		                    <li><a href="../admin/screenList?theater_num=-1">상영관 리스트</a></li>
		                    <li><a href="../admin/scheduleList">상영 리스트</a></li>
		                    <li><a href="../admin/myQnaList">문의 리스트</a></li>
		                    <li><a href="../admin/couponList">쿠폰 리스트</a></li>
		                    <li><a href="../admin/memberList?group_num=-1&sort=-1">회원 리스트</a></li>
		                </ul>
		            </li>
		            
		            </c:if>
	        		</ul>
	    			</div>
    			</div>
			<div class="col-detail" id="mycgv_contents">
			<!-- /////// -->

			<div class="tit-mycgv">
				<h3>1:1 문의 내역</h3>
			</div>
			 <div class="tit-mycgv" style="padding-bottom: 10px;">
					<select id="kind" class="f">
						<option class="kind" value="title">제목</option>
						<option class="kind" value="contents">내용</option>
					</select>
					<input type="text" name="search" id="search">
					<input type="button" class="btnType3" id="sBtn" value="GO">
			</div>
			<div class="tbl-data">
			    <table>
			        <caption></caption>
			        <colgroup>
					    <col width="25%">
					    <col width="20%">
					    <col width="10%">
					    <col width="10%">
					</colgroup>
			        <thead>
			            <tr>
				            <th scope="col">제목</th>
							<th scope="col">영화관</th>
							<th scope="col">등록일</th>
							<th scope="col">답변 유무</th>
			            </tr>
			        </thead>
			        <tbody>
			        <c:if test="${fn:length(qnaList) ne 0}">
				        <c:forEach items="${qnaList }" var="qnaDTO">
							<tr>
								<td><a href="../qna/qnaView?num=${qnaDTO.num}">${qnaDTO.title }</a></td>
								<td>${qnaDTO.location }(${qnaDTO.area })</td>
								<td>${qnaDTO.reg_date }</td>
								<c:if test="${qnaDTO.reply != null }">
									<td>답변완료</td>
								</c:if>
								<c:if test="${qnaDTO.reply == null }">
									<td>대기중</td>
								</c:if>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${fn:length(qnaList) eq 0}">           
			            <tr>
			                <td colspan="6" class="nodata">문의 내역이 존재하지 않습니다.</td>
			            </tr>
		            </c:if>  
			        </tbody>
			    </table>
		    	<c:if test="${fn:length(qnaList) > 0}">   
		    	
		    	<div class="paging">
					<ul id="paging_point">
						<c:if test="${pager.curBlock gt 1}">
							<li class="paging-side">
								<a href="qnaHistory?curPage=${pager.startNum-1}&kind=${kind}&search=${search}"><button style="line-height: 26px;" class="btn-paging prev" type="button">이전</button></a>
							</li>						
						</c:if>
						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							<li style="text-decoration: none;" class=" on">
								<a href="qnaHistory?curPage=${i}&kind=${kind}&search=${search}" title="${i}페이지 선택">${i}</a>
							</li>
						</c:forEach>
						<c:if test="${pager.curBlock lt pager.totalBlock}">
							<li class="paging-side">
								<a href="qnaHistory?curPage=${pager.lastNum+1}&kind=${kind}&search=${search}"><button style="line-height: 26px;" class="btn-paging next" type="button">다음</button></a>
							</li>
						</c:if>
					</ul>
				</div>
		    	
				 </c:if>  
			</div>
			<!-- /// -->
			</div>
			</div>
			</div>
			</div>
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	</div>
</body>
</html>