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
<link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/content_prepaid_card_170421.css">
<link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/module.css">
    <link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/reset.css">
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
		var wish_num = $(this).attr("title");
		location.href="./wishListDel?wish_num="+wish_num;
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
				                <a href="#">
				                    <em>${fn:length(wList)}</em>
				                    <strong>위시리스트</strong>
				                </a>
				            </div>
				        </div>
				    </div>
				    <div class="box-round-wgray">
				        <div class="box-round-inner">
				            <div class="inner-contents-log">
				                <a href="#">
				                    <em>${fn:length(mList)}</em>
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
						        <p><em>${fn:length(wList)}건</em></p>
						         <div class="set-combo">
				                <label for="year">내가 본 영화 년도별 정렬</label>
				                <select id="kind" name="date">
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
				                            <a href="../movie/movie_view?movie_num=${wishList.movieDTO.movie_num}">
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
				                                <strong class="title">${wishList.movieDTO.movie_name}</strong>
				                            </a>
				                            <span class="txt-info">
				                                <i>${wishList.movieDTO.open_date}</i>
				                                <strong>개봉</strong>
				                                <em class="dday">D-1</em>
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
				                         <button class="btn-del" title="${wishList.wish_num }" type="button">
					                    	<img src="${pageContext.request.contextPath }/resources/images/common/btn/btn_del02.png">
					                    </button>
				                    </li>
				                </c:forEach>
						        </ul>
						    </div>
					    </div>
					</div>
				</div>
			</div>
        	
        	<!-- ///////////////// -->
        	
			<%-- <h3>위시 리스트 ${fn:length(wList)}건</h3>
				<form action="wishList" method="POST">
					<c:forEach items="${wList}" var="wishList">
						<input type="hidden" name="wish_num" value="${wishList.wish_num }">
						<a href="../movie/movie_view?movie_num=${wishList.movieDTO.movie_num}">
						<img alt="" src="${pageContext.request.contextPath }/resources/movie_poster/${wishList.movieDTO.fileName}">
						</a><br>
						영화명 : ${wishList.movieDTO.movie_name}<br>
						개봉일 : ${wishList.movieDTO.open_date} 개봉<br>
						좋아요수 :${wishList.movieDTO.wish}<br>
						<button>예매</button><br>
						<input type="submit" value="X"><br>
						----<br>
					</c:forEach>
				</form> 
	
			 --%>

			<!-- 내용 끝 -->
			</div>
			<!-- ///////////////////////////////// -->
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	</div>
</body>
</html>