<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/headerBar.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/member/myPageView.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/myPage/myInfo.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/scheduleInsert.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>상영시간표 글쓰기(관리자용)</title>
<script type="text/javascript">
$(function(){

	$("#area").change(function(){
		var area =$("#area").val();
		if(area =='x'){
			$("#location").html('<option value="x">지역 선택</option>');
			$("#screen").html('<option>극장선택</option>');
		} else{
			$.ajax({
				url:"../ajax/adminLocationList",
				type:"POST",
				data:{		
					area:area,
					theater_num:0
				},
				success:function(data){
					$("#location").html(data);
					$("#screen").html('<option>극장선택</option>');
					$("#location").focus();
				}
			});
		}
		
	});

	$("#location").change(function(){
		var theater_num = $("#location").val();
		if(theater_num =='x'){
			$("#screen").html('<option>극장선택</option>');
		}else {
			$.ajax({
				url:"../ajax/adminScreenList",
				type:"POST",
				data:{		
					theater_num:theater_num
				},
				success:function(data){
					$("#screen").html(data);
					$("#screen").focus();
				}
			});
		}
		
	});
	$("#day").change(function(){
		var day = $("#day").val();
		$("#in_time").val("");
	});
	
 	$("#in_time").click(function(){
		var day = $("#day").val();
		if(day =='x'){
			alert("날짜를 선택해주세요");
			$("#day").focus();
		}
	}); 
	
	$("#in_time").change(function(){
		var in_time = $("#in_time").val();
		var movie_num = $("#movie").val();
		var day = $("#day").val();
		if(movie_num=='x'){
			alert("영화를 선택해 주세요");
			$("#in_time").val("");
			$("#movie").focus();
		}else if(day=='x'){
			alert("날짜를 선택해 주세요");
			$("#in_time").val("");
			$("#day").focus();
		}else{
			$.ajax({
				url:"../ajax/inTime",
				type:"POST",
				data:{		
					movie_num:movie_num,
					in_time:in_time,
					day:day
				},
				success:function(data){
					$("#out_time").val(data.trim());
				}
			});
		}
	});
	
	$("#btn").click(function(){
		var area =$("#area").val();
		var location = $("#location").val();
		var screen = $("#screen").val();
		var movie = $("#movie").val();
		var day = $("#day").val();
		var count = $("#count").val();
 		if(area == 'x'){
			alert("지역을 선택해주세요");
			$("#area").focus();
		}else if(location =='x'){
			alert("극장을 선택해주세요");
			$("#location").focus();
		}else if(screen =='x'){
			alert("스크린을 선택해주세요");
			$("#screen").focus();
		}else if(movie =='x'){
			alert("영화를 선택해주세요");		
			$("#movie").focus();
		}else if(day =='x'){
			alert("날짜를 선택해주세요");		
			$("#day").focus();	
		}else {
			document.frm.submit();
		}
	})
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
                            <li>
                            	<a href="#">상영 시간표</a>
                            </li>
                            <li class="last">
                            	상영시간표 등록
                            </li>
                    	</ul>
                	</div>
            	</div>
        	</div>
        	<!-- 상단바 끝 -->
        	
        	
        	<!-- 내용 시작 -->
        	
        	
        	<div id="contents">
            
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
	            		<a href="#">나의 예매내역 <i></i></a>
	            			<ul>                      
		                        <li><a href="../myPage/movieHistory">내가 본 영화</a></li>
			                    <li><a href="../myPage/wishList">위시 리스트</a></li>
	                        </ul>
                	</li>
	            	<li>
	                	<a href="#">나의 쿠폰 관리 <i></i></a>
	                	<ul>                      
	                        <li><a href="../myPage/couponHistory">나의 쿠폰</a></li>
	                	</ul>
	           		</li>
	            	<li>
                    	<a href="#">나의 포인트 관리 <i></i></a>
	                	<ul>
                        	<li><a href="../myPage/pointHistory">포인트 적립/사용내역</a></li>
	                	</ul>
	            	</li>

	            	<li>
                    	<a href="#">회원정보<i></i></a>
	                	<ul>
                        	<li><a href="../myPage/myInfoCheck">회원정보수정</a></li>
	                    	<!-- <li><a href="#">프로필관리</a></li> -->
	                    	<li><a href="../myPage/withdrawalCheck">회원탈퇴</a></li>
	                	</ul>
	            	</li>
		            <li>
	                    <a href="../admin/myQnaList">나의 문의내역 <i></i></a>
		                <ul>
		                    <li><a href="../admin/myQnaList">1:1문의</a></li>
		                </ul>
		            </li>
		            <c:if test="${!empty member and member.type eq 20 }">
			            <li class="on">
		                    <a href="#">관리자 <i></i></a>
			               <ul>
		                    <li><a href="../admin/movieList">무비 리스트</a></li>
		                    <li><a href="../admin/theaterList">극장 리스트</a></li>
		                    <li><a href="../admin/screenList?theater_num=-1">상영관 리스트</a></li>
		                    <li class="on"><a href="../admin/scheduleList">상영 리스트</a></li>
		                    <li><a href="../admin/couponList">쿠폰 리스트</a></li>
		                    <li><a href="../admin/memberList?group_num=-1&sort=-1">회원 리스트</a></li>
		                </ul>
			            </li>
		            </c:if>
	        		</ul>
	    			</div>
    			</div>
			<div class="col-detail" id="mycgv_contents">
			
			<div class="tit-mycgv">
			    <h3>상영시간표 등록</h3>
			</div>
			<p class="info-com">&nbsp;</p>
			<form action="./scheduleInsert" name="frm" method="POST">			
				<table  class="revisionTable">
					<tr>
						<td>지역선택</td>
						<td>
							<select id="area" name="area" class="selectList">
								<option value="x">지역선택</option>
								<c:forEach items="${areaList }" var="areaDTO">
									<option value="${areaDTO.area }">${areaDTO.area }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>극장선택</td>
						<td>
							<select id="location" name="theater_num" class="selectList">
								<option value="x">지역선택</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>스크린</td>
						<td>
							<select id="screen" name="screen_num" class="selectList">
								<option value="x">극장선택</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>영화번호</td>
						<td>
							<select id="movie" name="movie_num" class="selectList">
								<option value="x">영화선택</option>
								<c:forEach items="${movieList }" var="movieDTO">
								<option value="${movieDTO.movie_num }">${movieDTO.movie_name }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>상영날짜</td>
						<td>
							<select id="day" name="day" class="selectList">
								<option value="x">날짜선택</option>
								<c:forEach items="${dayList }" var="dayDTO">
									<option value="${dayDTO.day_num }">${dayDTO.day_num }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>시작시간</td>
						<td><input type="time" id="in_time" name="in_time" class="noneBorder"></td>
					</tr>
					<tr>
						<td>종료시간</td>
						<td><input type="time" id="out_time" name="out_time" readonly="readonly" class="noneBorder"></td>
					</tr>
					<tr>
						<td>다음시간</td>
						<td><input type="text" id="next_time" name="next_time" class="noneBorder"></td>
					</tr>
					<tr>
						<td>회차</td>
						<td>
							<select id="count" name="count" class="selectList">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
							</select>
						</td>
					</tr>
				</table>
				<div class="set-btn">
					<input type="button" id="btn" class="round inred on" style="width: 58px;" value="등록">
			        <a href="../admin/scheduleList" class="round gray"><span>취소</span></a>
			    </div>
			</form>

	<!-- //내용에 따라 바뀜// -->
		</div>
		</div>
		</div>
			</div>
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	</div>
</body>
</html>