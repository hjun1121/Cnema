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
<c:set scope="session" var="agree" value=""></c:set>
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
					<c:forEach items="${event_list }" begin="0" end="3" var="dto" varStatus="c">
					 
						<c:if test="${c.count eq 1 }">
							<div class="mySlides mainSlides" style="display: block;">
							<div class="numbertext">${c.count } / 3</div>
							<img src="${pageContext.request.contextPath }/resources/board/${dto.fileName}" style="width:980px; height:450px;">
							</div>
						</c:if>
						<c:if test="${c.count ne 1 }">
							<div class="mySlides mainSlides">
							<div class="numbertext">${c.count } / 3</div>
							<img src="${pageContext.request.contextPath }/resources/board/${dto.fileName}" style="width:980px; height:450px;">
							</div>
						</c:if>
					</c:forEach> 
					
						<a class="prev" onclick="plusSlides(-1)" style="right: 938px;">&#10094;</a>
						<a class="next" onclick="plusSlides(1)">&#10095;</a>
					
					</div>
				</div>
			</div>
			<h3><img src="${pageContext.request.contextPath }/resources/images/common/title/h3_movie_selection.gif" alt="MOVIE SELECTION"></h3>
			<div class="cols-movie">
			
				<c:forEach items="${movieList }" var="movie" begin="0" step="1">
					<div id="Selection_L" class="col-slider">
	        			<iframe src="${movie.teaser_url }" width="733" height="388" title="영화광고-1987" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="Movie_Selection_L" id="Movie_Selection_L"></iframe>
					</div>
					<div id="Selection_R" class="col-ad">
						<a href="#" target="_blank">
						<img src="${pageContext.request.contextPath }/resources/movie_poster/${movie.fileName}" width="240" height="388" border="0"></a>
					</div>
				</c:forEach>
			</div>
			<h3><img src="${pageContext.request.contextPath }/resources/images/common/title/h3_event.gif" alt="EVENT"></h3>
			
			
			<!--이벤트 띄울화면  -->
			<div class="sect-event">
			<ul>
				<c:forEach items="${ event_list}" var="dto">
		    	<li>
                	<a href="./event/eventView?num=${dto.num}">
                    	<img src="${pageContext.request.contextPath }/resources/board/${dto.fileName}" width="320px;" height="225px;" alt="♡">
                	</a>
            	</li>
            	</c:forEach>
            	<!-- 총 4개 넣어야함 -->
			</ul>
			</div>
		<%-- 	<div class="cols-banner">
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
			</div> --%>
			<!-- ///////////공지사항 시작////////////// -->

			<div id="ctl00_PlaceHolderContent_wrap_notice" class="sect-notice-info cf">
				<h3>공지사항</h3>
			    <div class="sect-notice-list cf">
			        <div class="inner" style="overflow: hidden; position: relative; height: 35px;">
			            <ul style="position: absolute; margin: 0px; padding: 0px; top: 0px;">
			            
			             <c:forEach items="${noticeList }" begin="0" end="5" var="notice">
				            <li class="cf noticeSlides" style="margin: 0px; padding: 0px; height: 35px;">
				                <a href="notice/noticeView?num=${notice.num }">
			                    ${notice.title }
			                    </a>
			                    <span>${notice.reg_date }</span>
			                </li>
			            </c:forEach>
			            
			            </ul>
			        </div>
			    </div>
			</div>

			<!-- ////////////공지사항 끝///////////// -->

		</div>
	</div>
	<!-- /Contaniner -->
	
	<!-- //////////////////////////// -->
	
	<%-- <br>
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
		<a href="member/myPageView">My Page</a>
		<a href="member/memberLogout">Logout</a>
	</c:if> --%>
	
</div>
<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>	
</body>
</html>