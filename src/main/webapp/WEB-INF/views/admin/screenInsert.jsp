<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/headerBar.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/member/myPageView.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/myPage/myInfo.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/theaterList.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/scheduleInsert.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상영관 글쓰기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		var farea = $("#farea").val();
		var ftheater_num = $("#ftheater_num").val();
		
		$(".kind").each(function(){
			if($(this).val()==farea){
				$(this).attr("selected",true);
				$.ajax({
					url:"../ajax/adminLocationList",
					type:"POST",
					data:{		
						area:farea,
						theater_num:ftheater_num
					},
					success:function(data){
						$("#location").html(data);
						$("#location").focus();
					}
				});
			}
		});
		
		$("#room_num").click(function(){
			var location = $("#location").val();
			$.ajax({
				url:"../ajax/adminScreenList2",
				type:"POST",
				data:{		
					theater_num : location
				},
				success:function(data){
					$("#screenList").html(data);
				}
			});
		});
		
				
		$("#area").change(function(){
			var area =$("#area").val();
			if(area =='x'){
				$("#location").html('<option value="x">지역 먼저 선택하세요.</option>');
				$("#screenList").html('');
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
						$("#location").focus();
					}
				});
			}
		});
		
		$("#location").change(function(){
			var location = $("#location").val();
			if(location =='x'){
				$("#screenList").html('');
			} else{
				$.ajax({
					url:"../ajax/adminScreenList2",
					type:"POST",
					data:{		
						theater_num : location
					},
					success:function(data){
						$("#screenList").html(data);
					}
				});
			}
		});
		
		$("#btn").click(function(){
			var area = $("#area").val();
			var location = $("#location").val();
			var room_num = $("#room_num").val();
			var floor = $("#floor").val();
			var x_num = $("#x_num").val();
			var y_num = $("#y_num").val();
			if(area=='x'){
				alert("지역을 선택해주세요");
				$("#area").focus();
			}else if(location =='x'){
				alert("극장을 선택해주세요");
				$("#location").focus();
			}else if(room_num ==""){
				alert("관번호를 입력해주세요");
				$("#room_num").focus();
			}else if(floor ==""){
				alert("층을 입력해주세요");
				$("#floor").focus();
			}else if(x_num ==""){
				alert("행번호를 입력해주세요");
				$("#x_num").focus();
			}else if(y_num ==""){
				alert("열번호를 입력해주세요");
				$("#y_num").focus();
			}else{
				document.frm.submit();
			}
		});
	});
</script>
</head>
<body>
	<div id="cgvwrap">
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/header.jsp"></c:import>
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
                            <li class="last">
                            	상영관 목록
                            </li>
                    	</ul>
                	</div>
            	</div>
        	</div>
        	<!-- 상단바 끝 -->
        	<!-- 내용 시작 -->
        	<div id="contents">
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
	            		<a href="../myPage/myPageView" title="현재 선택">MY CNEMA HOME <i></i></a>
	            	</li>
	            	<li>
	            		<a href="../myPage/movieHistory">나의 예매내역 <i></i></a>
	            			<ul>                      
		                        <li><a href="../myPage/movieHistory">내가 본 영화</a></li>
			                    <li><a href="../myPage/wishList">위시 리스트</a></li>
	                        </ul>
                	</li>
	            	<li>
	                	<a href="../myPage/couponHistory">나의 쿠폰 관리 <i></i></a>
	                	<ul>                      
	                        <li><a href="../myPage/couponHistory">나의 쿠폰</a></li>
	                        <li><a href="../myPage/couponHistory2">사용 내역</a></li>
	                	</ul>

	           		</li>
	            	<li>
                    	<a href="../myPage/pointHistory">나의 포인트 관리 <i></i></a>
	                	<ul>
                        	<li><a href="../myPage/pointHistory">포인트 적립/사용내역</a></li>
	                	</ul>
	            	</li>

	            	<li>
                    	<a href="../myPage/myInfoCheck">회원정보<i></i></a>
	                	<ul>
                        	<li><a href="../myPage/myInfoCheck">회원정보수정</a></li>
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
		                    <li class="on"><a href="../admin/screenList?theater_num=-1">상영관 리스트</a></li>
		                    <li><a href="../admin/scheduleList">상영 리스트</a></li>
		                    <li><a href="../admin/couponList">쿠폰 리스트</a></li>
		                    <li><a href="../admin/memberList?group_num=-1&sort=-1">회원 리스트</a></li>
		                </ul>
			            </li>
		            </c:if>
	        		</ul>
	    			</div>
    			</div>
			<div class="col-detail" id="mycgv_contents">
				<!-- ////////////////////////////// -->
			<div class="tit-mycgv">
			    <h3>상영관 등록</h3>
			</div>
			<p class="info-com">&nbsp;</p>
			<form action="./screenInsert" name="frm" method="POST">			
				<table class="revisionTable">
					<tr>
						<td>지역선택</td>
						<td>
							<c:if test="${theaterDTO ne null}">
								<input type="hidden" id="farea" value="${theaterDTO.area }">
								<input type="hidden" id="ftheater_num" value="${theaterDTO.theater_num }">
							</c:if>
							<c:if test="${theaterDTO eq null}">
								<input type="hidden" id="farea" value="x">
								<input type="hidden" id="ftheater_num" value="${areaDTO.theater_num }">
							</c:if>
							<select id="area" name="area" class="kind selectList">
								<option value="x">지역선택</option>
								<c:forEach items="${areaList }" var="areaDTO">
									<option value="${areaDTO.area }" class="kind">${areaDTO.area }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>극장선택</td>
						<td>
							<select id="location" name="theater_num" class="lkind selectList">
								<option value="x">극장선택</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>관번호</td>
						<td><input type="number" id="room_num" name="room_num" class="noneBorder"></td>
					</tr>
					<tr>
						<td>층</td>
						<td><input type="number" id="floor" name="floor" class="noneBorder"></td>
					</tr>
					<tr>
						<td>열(x)</td>
						<td><input type="number" id="x_num" name="x_num" class="noneBorder" ></td>
					</tr>
					<tr>
						<td>행(y)</td>
						<td><input type="number" id="y_num" name="y_num" class="noneBorder" ></td>
					</tr>
				</table>
				<div class="tbl-data">
				<table id="screenList">
				
				</table>
				</div>
				<div class="set-btn">
					<input type="button" id="btn" class="round inred on" style="width: 58px;" value="등록">
			        <a href="../admin/screenList" class="round gray"><span>취소</span></a>
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