<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/myPage/movieReviewView.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>평점 보기</title>
</head>
<body>

	<div class="layer-wrap"style=" position: fixed;"tabindex="0">
		<div class="layer-contents on-shadow" style="width: 800px;"id="watched-detailLayer">
			<div class="popwrap">
				<h1>평점보기</h1>
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
							<br>
							<form action="movieReviewDel" method="POST">
								<input type="hidden" id="movie_num" name="movie_num" value="${movieDTO.movie_num }">
								<p class="writer-comment" id="review">${reviewDTO.contents }</p>
								<br><br>
								<ul class="writerinfo">
									<li class="writer-name">${myInfo.id }</li>
									<li>${reviewDTO.reg_date }</li>
									<li>
										<c:if test="${reviewDTO.r_type eq 10 }">
											<button class="btn-delete" type="submit" id="watched-detail-delBtn">삭제</button>
										</c:if>
										<c:if test="${reviewDTO.r_type ne 10 }">
											<button class="btn-delete" type="button" id="watched-detail-delBtn">삭제된 리뷰</button>
										</c:if>
									</li>
								</ul>
							</form>
						</div>
					</div>
				</div>
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