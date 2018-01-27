<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/myPage/movieReviewView.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>평점 작성</title>
<script type="text/javascript">
$(function(){
	var good = $("#good").val();
	var bad = $("#bad").val();
	$("#good").click(function(){
		$("#review").val(good);
	});
	$("#bad").click(function(){
		$("#review").val(bad);
	});
});
</script>
</head>
<body>

	<div class="layer-wrap"style=" position: fixed;"tabindex="0">
		<div class="layer-contents on-shadow" style="width: 800px;"id="watched-detailLayer">
			<div class="popwrap">
				<h1>평점쓰기</h1>
				<div class="pop-contents">
					<div id="movie_info_container" class="sect-viw-rated">
						<div class="box-image">
							<span class="thumb-image"> 
								<img src="../resources/movie_poster/${movieDTO.fileName}" alt="${movie.movie_name} 포스터"> 
							</span>
						</div>
						<div class="box-contents">
							<div class="title">
								<strong>${movieDTO.movie_name }</strong>
							</div>
							
							<div>
								<img alt="" src="${pageContext.request.contextPath }/resources/images/myPageView/good.png" style="width:14px; height: 14px; ">
								<input type="button" id="good" style="border: none; background-color: #f6f6f4" value="좋았어요~^^">
								<img alt="" src="${pageContext.request.contextPath }/resources/images/myPageView/sad.png" style="width:14px; height: 14px; ">
								<input type="button" id="bad" style="border: none; background-color: #f6f6f4" value="흠~좀 별로였어요;;;">
							</div>
							<br>
							<form action="movieReview" name="rFrm" method="POST">
								<input type="hidden" name="movie_num" value="${movieDTO.movie_num }">
								<textarea name="review" id="review" style="width: 250px; height: 45px;"></textarea>
								<br><br>
								<input type="submit" style="background-color: red;border: 1px;padding: 5px;color: white;border-radius: 7px;" value="작성완료">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
<%-- <h3>평점주기</h3>
<h2>${movieDTO.movie_name }</h2>
<input type="button" id="good" value="좋았어요~^^">
<input type="button" id="bad" value="흠~좀 별로였어요;;;">

<form action="movieReview" name="rFrm" method="POST">
	<input type="hidden" name="movie_num" value="${movieDTO.movie_num }">
	<textarea name="review" id="review"></textarea>
	<input type="submit" value="작성완료">
</form> --%>

</body>
</html>