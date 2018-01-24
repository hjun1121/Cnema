<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/eggupdate.css">
 <link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/module.css">
 
    <link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/common.css">
    <link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/reset.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>평점 보기</title>
</head>
<body>

	<div class="layer-wrap"style="margin-top: -152px; margin-left: -400px; position: fixed;"tabindex="0">
		<div class="layer-contents on-shadow" style="width: 800px;"id="watched-detailLayer">
			<div class="popwrap">
				<h1>평점보기</h1>
				<div class="pop-contents">
					<div id="movie_info_container" class="sect-viw-rated">
						<div class="box-image">
							<span class="thumb-image"> 
								<img alt="인시디어스: 두번째 집 포스터" src="#"> 
								<span class="ico-grade grade-15">15세 이상</span>
							</span>
						</div>
						<div class="box-contents">
							<div class="title">
								<strong>인시디어스: 두번째 집</strong>
							</div>
							<ul class="writerinfo">
								<li class="writer-opinion">
									<span class="egg-icon good"></span>좋았어요
								</li>
							</ul>
							<p class="writer-comment">재밋엇어요</p>
							<ul class="writerinfo">
								<li class="writer-name">dl**gus349</li>
								<li>2018.01.24</li>
								<li><button class="btn-delete" type="button" id="watched-detail-delBtn">삭제</button></li>
							</ul>
						</div>
					</div>
				</div>
				<button type="button" class="btn-close" id="watched-detail-closeBtn">평점보기
				팝업 닫기</button>
			</div>
		</div>
	</div>

<%-- 
	<h3>평점보기</h3>

<h2>${movieDTO.movie_name }</h2>

<form action="movieReviewDel" method="POST">
	<input type="hidden" id="movie_num" name="movie_num" value="${movieDTO.movie_num }">
	<textarea name="review" id="review">${reviewDTO.contents }</textarea>
	<input type="text" name="id" value="${myInfo.id }">
	<input type="text" name="reg_date" value="${reviewDTO.reg_date }">
	<c:if test="${reviewDTO.r_type eq 10 }">
		<input type="submit" value="X삭제">
	</c:if>
	<c:if test="${reviewDTO.r_type ne 10 }">
		<input type="button" value="삭제된 리뷰">
	</c:if>
</form> --%>
</body>
</html>