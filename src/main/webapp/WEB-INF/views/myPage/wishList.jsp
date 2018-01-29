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
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/myPage/wishList.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/myPage/movieHistory.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>위시리스트 &lt;무비로그&gt;</title>
<script type="text/javascript">
$(function(){
	var kind='${kind}';
	$(".kind").each(function(){
		if($(this).val()==kind){
			$(this).attr("selected",true);
		}
	});
	$("#date_search").click(function(){
		var sKind = $("#kind").val();
		location.href="./wishList?kind="+sKind;
	});
	$(".btn-del").click(function(){
		
		var movie_num = $(this).attr("title");
		
		$.ajax({
			url: "../ajax/movie_wish_return",
			type: "POST",
			data: {
				movie_num:movie_num,
				kind:kind
			},
			success: function(data) {
				location.href="wishList?kind=${kind}";
			}
		});
		
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
                            <li class="last">
                            	위시리스트
                            </li>
                    	</ul>
                	</div>
            	</div>
        	</div>
        	<!-- 상단바 끝 -->
        	
        	
        	<!-- 내용 시작 -->
        	<div id="contents" class="">
            
            <!-- Contents Start -->
			
				<div class="cols-content">
				<div class="col-aside">
					<h2>프로필 및 서브메뉴</h2>
					<div class="box-round-dgray">
				        <div class="box-round-inner">
				            <div class="inner-contents-profile">
				                <div class="box-image">
				                	<div class="thumb-image">
				                        <img src="${pageContext.request.contextPath }/resources/images/myPageView/default_profile.gif">
				                        <span class="profile-mask"></span>
				                    </div>
				                </div>
				                <div class="box-contents">
					        		<strong>${member.name }님</strong>
					        		<em></em>
						        </div>
				            </div>
				        </div>
				    </div>
				    <div class="box-round-on">
				        <div class="box-round-inner">
				            <div class="inner-contents-log">
				                <a href="${pageContext.request.contextPath }/myPage/wishList">
				                    <em>${wishLeftbar}</em>
				                    <strong>위시리스트</strong>
				                </a>
				            </div>
				        </div>
				    </div>
				    <div class="box-round-wgray">
				        <div class="box-round-inner">
				            <div class="inner-contents-log">
				                <a href="${pageContext.request.contextPath }/myPage/movieHistory">
				                    <em>${reserveLeftbar }</em>
				                    <strong>내가 본 영화</strong>
				                </a>
				            </div>
				        </div>
				    </div>
				</div>
					<div class="col-detail">
					    <div class="movielog-detail-wrap">
					        <div class="tit-mycgv">
						        <h3>위시리스트</h3>
						        <%-- <p><em>${fn:length(wList)}건</em></p> --%>
						         <div class="set-combo">
				                <label for="year">내가 본 영화 년도별 정렬</label>
				                <select id="kind" name="date" style="width: 80px;
    height: 30px;
    border: 1px solid #e6e6e6;
    background-color: #fff;
    line-height: 29px;">
		                            <option class = "kind" value="reg_date" selected="selected">등록일 순</option>
		                            <option class = "kind" value="open_date">개봉일 순</option>
				                </select>
				                <button type="button" id="date_search" class="round gray"><span>GO</span></button>
				            </div>
				        </div>
						    <div class="sect-wishlist-lst">
						        <ul id="wishlist_container">
						        <c:forEach items="${wList}" var="wishList">
						        <input type="hidden" name="wish_num" value="${wishList.wish_num }">
				                    <li>
				                        <div class="box-image">
				                            <a href="${pageContext.request.contextPath }/movie/movie_view?movie_num=${wishList.movieDTO.movie_num}">
				                                <span class="thumb-image"> 
						                            <img src="${pageContext.request.contextPath }/resources/movie_poster/${wishList.movieDTO.fileName}">
				                                </span>
				                            </a>
			                                	<span class="screentype">
			                                		<a class="arthouse" href="#">아트하우스</a>
			                                	</span>
				                        </div>
				                        <div class="box-contents">
				                            <a href="#">
				                                <strong class="title" style="text-align: center;">${wishList.movieDTO.movie_name}</strong>
				                            </a>
				                            <span class="txt-info" style="text-align: center;">
				                                <i>${wishList.movieDTO.open_date}</i>
				                                <strong>개봉</strong>
<!-- 				                                <em class="dday">D-1</em> -->
				                            </span>
				                            <span class="like"> 
				                                      <button class="btn-del">내가선택한영화</button>
				                                <span class="count"> 
				                                    <strong>${wishList.movieDTO.wish}<span>명이 선택</span></strong> 
				                                    <i class="corner-RT"></i>
				                                    <i class="corner-LT"></i>
				                                    <i class="corner-LB"></i>
				                                    <i class="corner-RB"></i>
				                                    <i class="corner-arrow"></i>
				                                </span>
				                                <a class="link-reservation" href="#">예매</a>
				                            </span>
				                        </div>
				                         <button class="btn-del" title="${wishList.movie_num }" type="button">
					                    	<img src="${pageContext.request.contextPath }/resources/images/common/btn/btn_del02.png">
					                    </button>
				                    </li>
				                </c:forEach>
						        </ul>
						    </div>
						    <c:if test="${wishLeftbar > 0}">
						    <div class="paging">
					<ul id="paging_point" style="text-align: center;">
						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							<li style="text-decoration: none; display: inline-block; padding: 0 8px; color: #333333; font-family: Verdana, Geneva, sans-serif; font-size: 14px; font-weight: bold; line-height: 28px;" class=" on">
								<a href="wishList?curPage=${i}&kind=${kind}&search=${search}" title="${i}페이지 선택">${i}</a>
							</li>
						</c:forEach>
						<c:if test="${pager.curBlock lt pager.totalBlock}">
							<li class="paging-side">
								<a href="wishList?curPage=${pager.lastNum+1}&kind=${kind}&search=${search}"><button style="line-height: 26px; color: inherit; text-decoration: none;margin-top: 30px;" class="btn-paging next" type="button">다음</button></a>
							</li>
						</c:if>
					</ul>
				</div></c:if>
					    </div>
					</div>
				</div>
			</div>
        	
        	<!-- ///////////////// -->

			<!-- 내용 끝 -->
			</div>
			<!-- ///////////////////////////////// -->
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	</div>
</body>
</html>