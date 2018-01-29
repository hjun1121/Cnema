<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<title>멤버리스트</title>
<script type="text/javascript">
$(function(){
	$("#groupAll").click(function(){
		if($("input[name='groupAll']").prop("checked")){
			$("input[name='group']").prop("checked",true);
		}else{
			$("input[name='group']").prop("checked",false);
		}
	});
	
	$("input:checkbox[name='group']").change(function(){
		var totalCount = $('input:checkbox[name="group"]').length;
		var count = $('input:checkbox[name="group"]:checked').length;
		if(totalCount==count){
			$("input[name='groupAll']").prop("checked",true);
		}
		if(totalCount!=count){
			$("input[name='groupAll']").prop("checked",false);
		}
	});
	
	
	$("#group").click(function(){
		var groupVal = [];
		
		$("input[name='group']:checked").each(function(){
			groupVal.push($(this).val());
		});
		
		location.href="./groupInsert?groupVal[]="+groupVal;
	});
	
	$("#groudAdmin").click(function(){
		location.href="groupList";
	});
	
	$(".gList").click(function(){
		var number = $(this).val();
		location.href="memberList?group_num="+number+"&sort=-1";
	});
	
	$("#allMember").click(function(){
		location.href="memberList?group_num=-1&sort=-1";
	});
	
	$("#bSort").click(function(){
		location.href="memberList?group_num=-1&sort=10";
	});
	
	$("#tSort").click(function(){
		location.href="memberList?group_num=-1&sort=20";
	});
	
	$("#sBtn").click(function(){
		var c_num = $("#kind").val();
		var groupVal = [];
		$("input[name='group']:checked").each(function(){
			groupVal.push($(this).val());
		});
		location.href="./couponGive?c_num="+c_num+"&groupVal[]="+groupVal;
	});
	 
	$("#pBtn").click(function(){
		var price = $("#price").val();
		var groupVal = [];
		$("input[name='group']:checked").each(function(){
			groupVal.push($(this).val());
		});
		location.href="./pointGive?price="+price+"&groupVal[]="+groupVal;
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
                            	회원 목록
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
		            <li class="on">
	                    <a href="#">관리자 <i></i></a>
		                <ul>
		                    <li><a href="../admin/movieList">무비 리스트</a></li>
		                    <li><a href="../admin/theaterList">극장 리스트</a></li>
		                    <li><a href="../admin/screenList?theater_num=-1">상영관 리스트</a></li>
		                    <li><a href="../admin/scheduleList">상영 리스트</a></li>
		                    <li><a href="../admin/myQnaList">문의 리스트</a></li>
		                    <li><a href="../admin/couponList">쿠폰 리스트</a></li>
		                    <li class="on"><a href="../admin/memberList?group_num=-1&sort=-1">회원 리스트</a></li>
		                </ul>
		            </li>
		            
		            </c:if>
	        		</ul>
	    			</div>
    			</div>
			<div class="col-detail" id="mycgv_contents">
			<!-- /////// -->

			<div class="tit-mycgv">
				<h3>회원 목록</h3>
			</div>
			<div class="tit-mycgv" style="padding-bottom: 10px;">
				<input type="button" class="btnType3" id="groudAdmin" value="그룹관리">
				<input type="button" class="btnType3" id="group" value="그룹만들기">
			</div>
			<div class="tit-mycgv" style="padding-bottom: 10px;">
				<input type="button" class="btnType3" id="allMember" value="모든멤버">
				<c:forEach items="${groupList }" var="gList">
					<input type="button" class="gList btnType3" id="${gList.group_num }" value="${gList.group_num }">
				</c:forEach>
			</div>
			<div class="tit-mycgv" style="padding-bottom: 10px;">
				<select id="kind" name="kind" class="f">
					<option class="kind" value="x">쿠폰선택</option>
					<c:forEach items="${cList}" var="couponList">
						<option class="kind" value="${couponList.c_num }">${couponList.name }</option>
					</c:forEach>
				</select>
				<input type="button" class="btnType3" id="sBtn" value="쿠폰주기">
				<input type="number" id="price" class="memberListNumberCSS">
				<input type="button" class="btnType3" id="pBtn" value="포인트주기">
			</div>
			<div class="tbl-data">
			    <table>
			        <caption></caption>
			        <colgroup>
					    <col width="7%">
					    <col width="20%">
					    <col width="20%">
					    <col width="25%">
					    <col width="20%">
					    <col width="25%">
					</colgroup>
			        <thead>
			            <tr>
				            <th scope="col"><input type="checkbox" name="groupAll" id="groupAll" value="all"></th>
							<th scope="col">아이디</th>
							<th scope="col">이름</th>
							<th scope="col">생년월일<c:if test="${group_num eq -1}"> <input type="button" id="bSort"value="▼" style="margin-top: 10px;  margin-left: 3px; height: 18px; width: 18px; vertical-align: top;"></c:if></th>
							<th scope="col">회원타입<c:if test="${group_num eq -1}"><input type="button" id="tSort"value="▼" style="margin-top: 10px;  margin-left: 3px; height: 18px; width: 18px; vertical-align: top;"></c:if></th>
							<th scope="col">쿠폰갯수</th>
			            </tr>
			        </thead>

			        <c:if test="${fn:length(memList) ne 0}">
						<c:forEach items="${memList }" var="mList" varStatus="status">
						<c:set var="value">result${status.count }</c:set>
						<tr>
							<td><input type="checkbox" name="group" value="${mList.id }"></td>
							<td>${mList.id }</td>
							<td>${mList.name }</td>
							<td>${mList.birth }</td>
							<td>${mList.type }</td>
							<td>${requestScope[value]}</td>
						</tr>
						</c:forEach>
					</c:if>
					<c:if test="${fn:length(memList) eq 0}">           
			            <tr>
			                <td colspan="6" class="nodata">회원이 존재하지 않습니다.</td>
			            </tr>
		            </c:if>  
			        </tbody>
			    </table>
			    <c:if test="${group_num eq -1}"> 
			     
			     <div class="paging">
					<ul id="paging_point">
						<c:if test="${pager.curBlock gt 1}">
							<li class="paging-side">
								<a href="memberList?curPage=${pager.startNum-1}&group_num=${gList.group_num }&sort=${sort}"><button style="line-height: 26px;" class="btn-paging prev" type="button">이전</button></a>
							</li>						
						</c:if>
						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							<li style="text-decoration: none;" class=" on">
								<a href="memberList?curPage=${i}&group_num=${gList.group_num }&sort=${sort}" title="${i}페이지 선택">${i}</a>
							</li>
						</c:forEach>
						<c:if test="${pager.curBlock lt pager.totalBlock}">
							<li class="paging-side">
								<a href="memberList?curPage=${pager.lastNum+1}&group_num=${gList.group_num }&sort=${sort}"><button style="line-height: 26px;" class="btn-paging next" type="button">다음</button></a>
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