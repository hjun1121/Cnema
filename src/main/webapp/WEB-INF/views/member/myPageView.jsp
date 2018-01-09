<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MY CNEMA HOME</title>
</head>
<body>
<h1>My Page</h1>
	<!-- 나의 정보 -->
	${myInfo.name}님  ${myInfo.id}<br>
	고객님은 sysdate ${myInfo.type}입니다.<br>
	
	<!-- 나의 포인트 -->
	CJ ONE 사용가능 포인트   ${myInfo.v_point}점<br>
	CJ ONE 누적 포인트 ${myInfo.a_point}점<br>
	
	<!-- 쿠폰내역 -->
	<h3>나의 쿠폰</h3>
	금액 할인 :
	할인률 :
	
	<!-- 나의 예매 내역 -->
	<h3>내가 본 영화</h3>
	<a href="../myPage/movieHistory">내가 본 영화</a>
	<h3>위시 리스트</h3>
	<a href="../myPage/wishList">위시 리스트</a>
	
	<!-- 쿠폰 및 포인트 사용 -->
	<h3>Point 내역</h3>
	<a href="../myPage/pointHistory">Point 내역</a>
	<h3>나의 쿠폰</h3>
	<a href="../myPage/couponHistory">나의 쿠폰</a>

	<!-- 정보 수정 -->
	<h3>정보 수정</h3>
	<a href="">정보 수정</a>
	<h3>프로필 관리</h3>
	<a href="">프로필 관리</a>
	<h3>회원 탈퇴</h3>
	<a href="../myPage/withdrawalCheck">회원 탈퇴</a>
	
	<!-- 나의 문의내역 -->
	<h3>나의 문의 내역</h3>
	<a href="">나의 문의 내역</a>
	
	<!-- Admin -->
	<h3>영화 목록</h3>
	<a href="../admin/movieList">영화 목록</a>
	<h3>회원 목록</h3>
	<a href="">회원 목록</a>
</body>
</html>