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
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/scheduleInsert.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상영관 글쓰기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		var farea = $("#farea").val();
		var flocation = $("#flocation").val();
		
		$(".kind").each(function(){
			if($(this).val()==farea){
				$(this).attr("selected",true);
				$.ajax({
					url:"../ajax/adminLocationList",
					type:"POST",
					data:{		
						area:farea
					},
					success:function(data){
						$("#location").html(data);
						$("#location").focus();
					}
				});
			}
		});
		
		$(".lkind").each(function(){
			if($(this).val()==flocation){
				$(this).attr("selected",true);
				$.ajax({
					url:"../ajax/adminLocationList",
					type:"POST",
					data:{		
						area:farea
					},
					success:function(data){
						$("#location").html(data);
						$("#location").focus();
					}
				});
			}
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
						area:area
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
            
            <!-- Contents Start -->

			<div class="sect-common">
    			<div class="mycgv-info-wrap">
					<div class="skipnaiv">
						<a href="#" id="skipPersoninfo">개인화영역 건너띄기</a>
					</div>
       				<div class="sect-person-info">
        				<h2 class="hidden">개인화 영역</h2> 
        					<div class="box-image">
								<span class="thumb-image">
									<img src="${pageContext.request.contextPath }/resources/images/myPageView/default_profile.gif" alt="프로필 사진">
									<span class="profile-mask"></span>
								</span>
        					</div>
        					<div class="box-contents newtype">
				        		<div class="person-info">
				        			<strong>${myInfo.name}님</strong>
				        			<em>${myInfo.id}</em>
				        			
				        		</div>
        					<div class="grade-info">
	        					<c:set var="now" value="<%=new java.util.Date()%>" />
								<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy년MM월dd일" /></c:set> 
                    			<p style="margin-bottom:4px;color: #342929;font-family: 'NanumBarunGothicBold', '맑은 고딕', '돋움', Dotum, sans-serif;font-size: 20px;line-height: 20px;">
                         			 고객님은 <c:out value="${sysYear}" /> 
                         			<strong class="txt-purple">
                         			<c:if test="${myInfo.type eq 10}">
                         				일반 회원
                         			</c:if>
                         			<c:if test="${myInfo.type eq 20}">
                         				관리자
                         			</c:if>
                         			<c:if test="${myInfo.type eq 11}">
                         				VIP 회원
                         			</c:if>
                         			</strong>입니다.             
                   			 	</p>
        						
                    			<div class="mycgv_btn_special2">
                       				<h5 class="special_tit">SPECIAL MEMBERSHIP</h5><!-- special_tit (X) -->
				    			</div>
			        		</div>
			        	</div>
			        </div>
        			<div class="cols-benefit-info">
			        	<div class="col-my-coupon">
			        		<h3>MY COUPON</h3>
			        		<ul>
			        			<li>
			        				<strong>VIP쿠폰</strong>
			        				<span><em>7</em> 개</span>
			        			</li>
			        			<li>
			        				<strong>CGV 할인쿠폰</strong>
			        				<span><em>0</em> 개</span>
			        			</li>
			        			<li>
			        				<strong>영화관람권</strong>
			        				<span><em>0</em> 개</span>
			        			</li>
			        		</ul>
			        	</div>
			                <div class="col-one-point">
			               	<h3>CJ ONE POINT</h3>
			        		<a href="#">CJ ONE POINT 더보기</a>
			        		<ul>
			        			<li>
			        				<strong>사용가능 포인트</strong>
			        				<span><em class="txt-maroon">${myInfo.v_point}</em> 점</span>
			        			</li>
			        		    <li class="tooltip_list cf">
			        				<strong>누적 포인트</strong>
			
			                        <div class="tooltip_con tc2"><span></span></div>
			        				<span><em><fmt:formatNumber value="${myInfo.a_point}" type="number"/></em> 점</span>
			        			</li>
			        		</ul>
			        	</div>
			        	<div class="col-favorite-theater">
			        		<h3 class="hidden">자주가는 CGV</h3>
				    		<div class="sect-favorite">
					            <ul id="favoriteTheaters"><!-- ////////////////// -->
			                            <li><a href="#"><span>1<em>순위</em></span>CGV북수원</a></li>
			                            <li><a href="#"><span>2<em>순위</em></span>CGV수원</a></li>
			                            <li><a href="#"><span>3<em>순위</em></span>CGV시흥</a></li>
			                            <li><a href="#"><span>4<em>순위</em></span></a></li>
			                            <li><a href="#"><span>5<em>순위</em></span></a></li>
					            </ul>
					            <button id="btn_set_my_favorite" title="새창" type="button" class="setting">자주가는 극장<br>설정하기</button><!-- ///// -->
					        </div>
				        </div>
			          
			        </div>
			    </div>
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
	                    	<li><a href="../myPage/withdrawalCheck">회원탈퇴</a></li>
	                	</ul>
	            	</li>
		            <li>
	                    <a href="#">나의 문의내역 <i></i></a>
		                <ul>
		                    <li><a href="#">1:1 문의</a></li>
		                </ul>
		            </li>
		            <c:if test="${!empty member and member.type eq 20 }">
			            <li class="on">
		                    <a href="#">관리자 <i></i></a>
			                <ul>
			                    <li><a href="../admin/movieList">무비 리스트</a></li>
			                    <li><a href="../admin/theaterList">극장 리스트</a></li>
			                    <li class="on"><a href="../admin/screenList">상영관 리스트</a></li>
			                    <li><a href="../admin/scheduleList">상영 리스트</a></li>
			                    <li><a href="../admin/couponList">쿠폰 리스트</a></li>
			                    <li><a href="../admin/memberList?group_num=-1">회원 리스트</a></li>
			                </ul>
			            </li>
		            </c:if>
	        		</ul>
	    			</div>
    			</div>
			<div class="col-detail" id="mycgv_contents">
				
				<h3>스크린 추가 </h3>
				<form action="./screenInsert" name="frm" method="POST">
					<table>
						<tr>
							<td>지역</td>
							<td>극장</td>
							<td>관번호</td>
							<td>층</td>
							<td>열(x)</td>
							<td>행(y)</td>
						</tr>
						<tr>
							<td>
								<input type="hidden" id="farea" value="${theaterDTO.area }">
								<input type="hidden" id="flocation" value="${theaterDTO.location }">
								<select id="area" name="area" class="kind">
									<option value="x">지역선택</option>
									<c:forEach items="${areaList }" var="areaDTO">
										<option value="${areaDTO.area }" class="kind">${areaDTO.area }</option>
									</c:forEach>
								</select>
							</td>
							<td>
								<select id="location" name="theater_num" class="lkind">
									<option value="x">극장선택</option>
								</select>
							</td>
							<td><input type="number" id="room_num" name="room_num" ></td>
							<td><input type="number" id="floor" name="floor" ></td>
							<td><input type="number" id="x_num" name="x_num" ></td>
							<td><input type="number" id="y_num" name="y_num" ></td>
						</tr>
						
					</table>
					
					<table id="screenList">
				
					</table>
					
					<input type="button" id="btn" value="확인">
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