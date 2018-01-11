<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>메인</title>

<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/main/slide.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/main/main.css">


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
/* 메인슬라이드 */
$(function(){
var myIndex = 0;
carousel();
	
	function carousel() {
	    var i;
	    var x = document.getElementsByClassName("mainSlides");
	    for (i = 0; i < x.length; i++) {
	       x[i].style.display = "none";  
	    }
	    myIndex++;
	    if (myIndex > x.length) {myIndex = 1}    
	    x[myIndex-1].style.display = "block";  
	    setTimeout(carousel, 2000); // Change image every 2 seconds
	}
})
</script>


<script type="text/javascript">
/* 공지슬라이드 */
 $(function(){
	var slideIndex = 0;
	carousel();
	
	function carousel() {
	    var i;
	    var x = document.getElementsByClassName("noticeSlides");
	    for (i = 0; i < x.length; i++) {
	      x[i].style.display = "none";
	    }
	    slideIndex++;
	    if (slideIndex > x.length) {slideIndex = 1} 
	    x[slideIndex-1].style.display = "block";
	    setTimeout(carousel, 2000); 
	}
 })
</script>

<script type="text/javascript">
	var message = '${message}';
	if(message != ""){
		alert(message);
	}
	
	
</script>

<script type="text/javascript">
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>


</head>
	<title> CNEMA</title>
<body>

<div id="cgvwrap"  style="text-align: center;">
<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/header.jsp"></c:import>
	<!-- 띄움 -->
    <div id="ctl00_sect_txt_banner" class="sect_txt_banner"><div class="inner"></div></div>
	<!-- 띄움 -->

	<!-- //////////////////////////// -->
	
	<!-- Contaniner -->
	<div id="contaniner" class="bg-bricks main bg-bricks">
		<div id="contents">
			<div class="sect-common">
				<div class="slider" id="slider">
					<div class="item-wrap">
						<div class="mySlides mainSlides" style="display: block;">
						  <div class="numbertext">1 / 3</div>
						  <img src="${pageContext.request.contextPath }/resources/images/main/1.png" style="width:100%">
						  <div class="text">Caption Text</div>
						</div>
						
						<div class="mySlides mainSlides">
						  <div class="numbertext">2 / 3</div>
						  <img src="${pageContext.request.contextPath }/resources/images/main/2.png" style="width:100%">
						  <div class="text">Caption Two</div>
						</div>
						
						<div class="mySlides mainSlides">
						  <div class="numbertext">3 / 3</div>
						  <img src="${pageContext.request.contextPath }/resources/images/main/3.png" style="width:100%">
						  <div class="text">Caption Three</div>
						</div>
						
						<a class="prev" onclick="plusSlides(-1)" style="right: 938px;">&#10094;</a>
						<a class="next" onclick="plusSlides(1)">&#10095;</a>
					
					</div>
				</div>
			</div>
			<h3><img src="${pageContext.request.contextPath }/resources/images/common/title/h3_movie_selection.gif" alt="MOVIE SELECTION"></h3>
			<div class="cols-movie">
				<div id="Selection_L" class="col-slider">
        			<iframe src="https://www.youtube.com/embed/5O5PVvHTWRo" width="733" height="388" title="영화광고-1987" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="Movie_Selection_L" id="Movie_Selection_L"></iframe>
				</div>
				<div id="Selection_R" class="col-ad">
					<a href="#" target="_blank">
					<img src="${pageContext.request.contextPath }/resources/images/main/1ONOHF5TDF_2.jpg" width="240" height="388" border="0"></a>
				</div>
			</div>
			<h3><img src="${pageContext.request.contextPath }/resources/images/common/title/h3_event.gif" alt="EVENT"></h3>
			<div class="sect-event">
			<ul>
				<c:forEach begin="0" end="3" varStatus="i">
		    	<li>
                	<a href="#">
                    	<img src="${pageContext.request.contextPath }/resources/images/main/aaa.png" alt="♡">
                	</a>
            	</li>
            	</c:forEach>
            	<!-- 총 4개 넣어야함 -->
			</ul>
			</div>
			<div class="cols-banner">
				<div class="col-ad">
					<div class="box-com">
		    			<div class="box-inner">
                			<a href="#"><img src="${pageContext.request.contextPath }/resources/images/main/bbb.png" alt="1"></a>
            			</div>
					</div>
				</div>
				<div class="col-hd">
					<a href="#">
						<img src="${pageContext.request.contextPath }/resources/images/main/ccc.png" alt="2"></a>
				</div>
				<div class="col-collage">
					<div class="box-com">
						<div class="box-inner">
                			<a href="#"><img src="${pageContext.request.contextPath }/resources/images/main/bbb.png" alt="3"></a>
            			</div>
					</div>
				</div>
			</div>
			<!-- ///////////공지사항 시작////////////// -->

			<div id="ctl00_PlaceHolderContent_wrap_notice" class="sect-notice-info cf">
				<h3>공지사항</h3>
			    <div class="sect-notice-list cf">
			        <div class="inner" style="overflow: hidden; position: relative; height: 35px;">
			            <ul style="position: absolute; margin: 0px; padding: 0px; top: 0px;">
			            <li class="cf noticeSlides" style="margin: 0px; padding: 0px; height: 35px;">
			                <a href="#">
		                    [시스템 점검]1월 정기 시스템 안내
		                    </a>
		                    <span>2018.01.05</span>
		                </li>
		                <li class="cf noticeSlides" style="margin: 0px; padding: 0px; height: 35px;">
			                <a href="#">
		                    [극장] 판매 개시일 변경
		                    </a>
		                    <span>2017.11.14</span>
		                </li>
		                <li class="cf noticeSlides" style="margin: 0px; padding: 0px; height: 35px;">
			                <a href="#">
		                    [기타]CGV 개인정보처리방침 개정 공지
		                    </a>
		                    <span>2017.09.28</span>
		                </li>
		                <li class="cf noticeSlides" style="margin: 0px; padding: 0px; height: 35px;">
			                <a href="#">
		                    [기타]CGV 개인정보처리방침 개정 공지
		                    </a>
		                    <span>2017.08.18</span>
		                </li>
		                <li class="cf noticeSlides" style="margin: 0px; padding: 0px; height: 35px;">
			                <a href="#">
		                    [시스템 점검]8월 정기 시스템 안내
		                    </a>
		                    <span>2017.08.08</span>
			            <li>
			            </ul>
			        </div>
			    </div>
			</div>

			<!-- ////////////공지사항 끝///////////// -->

		</div>
	</div>
	<!-- /Contaniner -->
	
	<!-- //////////////////////////// -->
	
	<br>
	<a href="home/kim">김</a>
	<a href="home/ssin">신</a>
	<a href="home/park">박</a>
			
	
	<br><br><br>
	<c:if test="${empty member }">
		<a href="member/joinAgree">Join</a>
		<a href="member/memberLogin">Login</a>
		<a href="member/idFind">Id Find</a>
		<a href="member/pwFind">Pw Find</a>
	</c:if>
	<c:if test="${!empty member }">

	<h2>${member.id } 님 환영합니다</h2>
		<img height="100px" width="100px" src="resources/profil/${member.fileName }">
		<a href="member/myPageView?id=${member.id }">My Page</a>
		<a href="member/memberLogout">Logout</a>
	</c:if>
	
</div>
<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>	
</body>
</html>