<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="col-detail">
			<div class="customer_top">
				<h2>공지/뉴스</h2>
				<p>CGV의 주요한 이슈 및 여러가지 소식들을 확인하실 수 있습니다.</p>
			</div>
			<div class="board_view_area">
				<ul class="top_title_faq">
					<li class="title">${view.title}</li>
					<li class="stit_area">
						<span>등록일<em class="regist_day">${view.reg_date}</em></span>
						<span class="check_tit_area">조회수<em class="check_num">${view.hit}</em></span>
					</li>
				</ul>
				<div class="view_area">
					 ${view.contents}
				<a href="./noticeList">목록으로</a>
				<a href="./noticeUpdate?num=${view.num}">update</a>
				<a href="./noticeDelete?num=${view.num}">delete</a>
			</div>
		</div>
	</div>
</body>
</html>