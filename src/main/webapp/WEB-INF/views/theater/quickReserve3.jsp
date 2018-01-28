<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/headerBar.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/theater/quickReserve3.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$("#seatN").html('${reserve2DTO.seatName}');
		$("#qrPrice").html('${reserve2DTO.price}');
		/*  */
		$("#leftBtn2").click(function(){
			window.history.back();
		});
		
		/*  */
		var v_point = ${member.v_point};    //멤버에 잔여 포인트
		var price = ${reserve2.price };  // 총 결제 돈
		/* 쿠폰리스트 불러오기 */
		$("#couponBtn").click(function(){
			$.ajax({
				url:"../ajax/qrCouponList",
				type:"post",
				data:{
				},
				success:function(data){
					$("#couponList").html(data);
				}
			});
		});
		/* 쿠폰 사용 */
		$("#couponList").on("click",".coupons",function(){
			var c_num = $(this).val();	//c_num
			$.ajax({
				url:"../ajax/qrCoupon",
				type:"post",
				data:{
					price : price,
					c_num : c_num
				},
				success:function(data){
					$("#couponDiscount").css("display","");
					$(".cDis").html(data.trim()); //이거바굼
					var cDiscount = $("#cDiscount").html();
					$("#pDiscount").html("0");
					$("#point").val("");
					$("#pointDiscount").css("display","none");
					
					var nowPrice = price-cDiscount;
					$("#nowPrice").html(nowPrice);
					$("#useCoupon").val(c_num);
					$("#price").val(nowPrice);
					$("#usePoint").val("0");
					$("#price").val(nowPrice);
				}
			});
		});
		
		/* 쿠폰 취소하기 */
		$("#deleteBtn").click(function(){
			$(".cDis").html("0");  //이거바굼
			var cDiscount = $("#cDiscount").html();
			var pDiscount = $("#pDiscount").html();
			$(".coupons").prop("checked","");
			
			$("#couponDiscount").css("display","none");
			var nowPrice = price-cDiscount-pDiscount;
			$("#nowPrice").html(nowPrice);
			$("#useCoupon").val("0");
			$("#price").val(nowPrice);
			
		});
		
		/* 포인트 쓰기 */
		$("#point").change(function(){
			var point = $("#point").val(); //입력 포인트
			var cDiscount = $("#cDiscount").html(); // 쿠폰할인금액
			var nowPrice = price-cDiscount;
			if(v_point<point){
				alert("잔여 포인트가 부족합니다.");
				$("#point").val("");
				var pDiscount = $("#point").val();
				$("#pDiscount").html("0");
				var nowPrice = price-cDiscount-pDiscount;
				$("#nowPrice").html(nowPrice);	
				$("#pointDiscount").css("display","none");
				
				$("#usePoint").val("0");
				$("#price").val(nowPrice);
				
				$("#point").focus();
			}else if(point<100){
				if(point==""){
					
				}else{
					alert("포인트는 100점이상 사용가능 합니다");
					$("#point").val("");
				}

				var pDiscount = $("#point").val();
				$("#pDiscount").html("0");
				var nowPrice = price-cDiscount-pDiscount;
				$("#nowPrice").html(nowPrice);	
				$("#pointDiscount").css("display","none");
				
				$("#usePoint").val("0");
				$("#price").val(nowPrice);
				
				$("#point").focus();
			}else if(nowPrice*1<point*1){
				alert("최종가격보다 많이 쓸 수 없습니다.");
				$("#point").val(nowPrice);
				
				var pDiscount = $("#point").val();
				$("#pDiscount").html(pDiscount);
				var nowPrice = price-cDiscount-pDiscount;
				$("#nowPrice").html(nowPrice);	
				$("#pointDiscount").css("display","");
				
				$("#usePoint").val(nowPrice);
				$("#price").val(nowPrice);
				
			}else{
				var pDiscount = $("#point").val();
				$("#pointDiscount").css("display","");
				$("#pDiscount").html(pDiscount);
				var nowPrice = price-cDiscount-pDiscount;
				$("#nowPrice").html(nowPrice);
				
				$("#usePoint").val(pDiscount);
				$("#price").val(nowPrice);
				
			}
		});
		/* 모두쓰기 */
		$("#allPoint").click(function(){
			var point = $("#point").val(); //입력 포인트
			var cDiscount = $("#cDiscount").html(); // 쿠폰할인금액
			var nowPrice = price-cDiscount;
			
			if(v_point<100){
				alert("포인트는 100점이상 사용가능합니다")
				
				$("#point").val("");

				var pDiscount = $("#point").val();
				$("#pDiscount").html(pDiscount);
				var nowPrice = price-cDiscount-pDiscount;
				$("#nowPrice").html(nowPrice);	
				$("#pointDiscount").css("display","none");
				
				$("#usePoint").val("0");
				$("#price").val(nowPrice);
				
				$("#point").focus();
				
			}else if(nowPrice<v_point){
				$("#point").val(nowPrice);
				
				var pDiscount = $("#point").val();
				$("#pDiscount").html(pDiscount);
				var nowPrice = price-cDiscount-pDiscount;
				$("#nowPrice").html(nowPrice);	
				$("#pointDiscount").css("display","");
				
				$("#usePoint").val(pDiscount);
				$("#price").val(nowPrice);
				
			}else{
				$("#point").val(v_point);
				
				var pDiscount = $("#point").val();
				$("#pDiscount").html(pDiscount);
				var nowPrice = price-cDiscount-pDiscount;
				$("#nowPrice").html(nowPrice);	
				$("#pointDiscount").css("display","");
				
				$("#usePoint").val(pDiscount);
				$("#price").val(nowPrice);
			}
		});
		/*  */
		$("#rightBtn3").click(function(){
			var movie_num = $("#movie_num").val();
			var theater_num = $("#theater_num").val();
			var day_num = $("#day_num").val();
			var schedule_num = $("#schedule_num").val();
			var adult_num = $("#adult_num").val();
			var teen_num = $("#teen_num").val();
			var pCount = $("#pCount").val();
			var price = $("#price").val();
			if(price == 0){
				var ch = confirm("결제금액이 0 원 이므로 바로 예매됩니다.");
				if(ch == true){
					document.reserve.submit();
				}
			}else{
				document.reserve.submit();
			}
			
		});

		
		/*  */
	});
</script>
</head>
<body>
	<div id="cgvwrap">
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/header.jsp"></c:import>
			<!-- //////////////////////////////// -->
			<div id="contaniner" class="">
        	<!-- 상단바 시작 -->
        	<div class="linemap-wrap">
           		<div class="sect-linemap">
                	<div class="sect-bcrumb">
                    	<ul>
                        	<li>
                        		<a href="#"><img alt="home" src="${pageContext.request.contextPath }/resources/images/common/btn/btn_home.png"></a>
                        	</li>
                            <li>
                                <a href="#">예매</a>
                            </li>
                            <li class="last">
                            	빠른예매
                            </li>
                    	</ul>
                	</div>
            	</div>
        	</div>
        	<!-- 상단바 끝 -->
        	
        	<!-- 내용시작 -->
	<%-- <h2>Quick Reserve3</h2>
	<div id="all">
		<div id="couponAll">
			<ul>
				<li>쿠폰 <input type="button" id="couponBtn" value="쿠폰불러오기"> <input type="button" id="deleteBtn" value="쿠폰제거"></li>
			</ul>
			<div id="couponList" style="height: 84px; width: 250px; overflow: auto;" >
				
			</div>
		</div>
		<div id="pointList">
			<table>
				<tr>
					<td>보유 포인트</td><td>${member.v_point } <input type="text" id="point" placeholder="사용할포인트 입력">
					<input type="button" id="allPoint" value="모두쓰기"> </td>
				</tr>
			</table>
		</div>
		
		<div id="priceShow">
			총가격 :<span id="allPrice">${reserve2DTO.price}</span> <br> 
			<div id="couponDiscount" style="display: none;">쿠폰할인:<span id="cDiscount"></span></div> 
			<div id="pointDiscount" style="display: none;">포인트할인:<span id="pDiscount"></span></div>
			최종가격 :<span id="nowPrice">${reserve2DTO.price}</span>
		</div>
	</div>
	<div id="bottom_area">
		
		<form action="">
		<input type="button" id="leftBtn2" value="이전" style="float: left;">
			<table border="1"  style="float: left; width: 217px; height: 118px;" id="qrMovie">
				<tr>
					<td rowspan="2"><img width="75px;" height="106px;" alt="" src="../resources/movie_poster/${movie.fileName }"></td>
					<td>${movie.movie_name }</td>
				</tr>
				<tr>
					<td>${movie.age_limit }</td>
				</tr>
				
			</table>
			
			<table border="1" style="float: left; margin-left: 10px; width: 214px; height: 120px;" id="qrTheater">
				<tr>
					<td>극장</td><td>${theater.location }</td>
				</tr>
				<tr>
					<td>일시</td><td>
					<c:if test="${day ne '2000-01-01' }">
						${day }
					</c:if>
					</td>
				</tr>
				<tr>
					<td>상영관</td><td>${screenDTO.room_num }
					<c:if test="${!empty screenDTO }">관</c:if>
					${screenDTO.floor }층
					</td>
				</tr>
				<tr>
					<td>인원</td><td>${reserve2.people }</td>
				</tr>										
			</table>
			<table border="1" style="float: left; margin-left: 10px; width: 217px; height: 120px;" id="qrSeat">
				<tr>
					<td id="seatN">좌석선택</td>
				</tr>											
			</table>
			<table border="1" style="float: left; margin-left: 10px; width: 217px; height: 120px;" >
				<tr>
					<td id="qrPrice"></td>
				</tr>											
			</table>			
		<input type="button" id="rightBtn3" value="결제">	
		</form>
		
		<form action="./quickReservePay" method="post" name="reserve" style="clear: both;">
			m<input type="text" id="movie_num" name="movie_num" value="${reserve.movie_num }">
			t<input type="text" id="theater_num" name="theater_num" value="${reserve.theater_num }">
			d<input type="text" id="day_num" name="day_num" value="${reserve.day_num }">
			sc<input type="text" id="schedule_num" name="schedule_num" value="${reserve.schedule_num }">
			<br>
			ad<input type="text" id="adult_num" name="adult_num" value="${reserve2.adult_num }">
			te<input type="text" id="teen_num" name="teen_num" value="${reserve2.teen_num }">
			pC<input type="text" id="pCount" name="people" value="${reserve2.pCount }">
			pe<input type="text" id="people" name="pCount" value="${reserve2.people }">
			<input type="text" id="total_price" name="total_price" value="${reserve2.price }">
			<div id="seatList">
			<c:forEach items="${seat_num }" var="seat">
				<input type="text" class="ss" name="seat_num" value="${seat }">
			</c:forEach>
			</div>
			c_num<input type="text" id="useCoupon" name="c_num" value="0">
			point<input type="text" id="usePoint" name="point" value="0">
			nowPrice<input type="text" id="price" name="price" value="${reserve2.price }">
		</form>
	</div> --%>
				<!-- ////////////////////////////// -->
	<div id="contents">
		<!-- 빠른예매 -->
		<div id="ticket" class="ticket ko">
			<div class="navi"></div>
				<div class="steps">
					<div class="step step3" style="display: block;">
						<div id="all" class="ticket_payment_method">
							<h4 class="ts3_titlebar ts3_t1 non-special" style="margin-top: 40px;">
								<span class="header">STEP 1. </span>
								<span class="title">쿠폰 사용</span>
							</h4>
							<div class="tpm_wrap tpm_point opened">
								<div class="tpm_header"></div>
								<div class="tpm_body">
									<div class="tpm_row">
										<div class="tpm_box clear"></div>
									</div>
									<div class="tpm_row">
										<div class="tpm_box">
											<div id="couponAll">
												<h5>CNEMA 쿠폰사용</h5>
												<div class="form_con">
													<div class="button_con">
														<a class="button gray" href="#" onclick="return false;">
															<span><input class="btn___3" type="button" id="couponBtn" value="쿠폰불러오기"></span>
														</a>
														<a class="button white" href="#" onclick="return false;">
															<span><input class="btn___4" type="button" id="deleteBtn" value="쿠폰제거"></span>
														</a>
													</div>
													<div class="inner_con">
													<dl>
														<dt>
															<label>사용가능 쿠폰 : </label>
														</dt>
														
														<dd class="strong">
															<span id="movie_hasNum">
																<div id="couponList" ></div>
															</span>
														</dd>
														
													</dl>
													</div>
													<div class="under_con">
														<div class="float_r">
															<dt>할인금액:</dt>
															<dd class="strong"><span id="cDiscount" class="cDis">0</span>원</dd>
														</div>
													</div>
												</div>
												<div class="dimmCon">&nbsp;</div>
											</div>	
										</div>
									</div>
								</div>
							</div>
							<h4 class="ts3_titlebar ts3_t1" style="margin-top: 40px;">
								<span class="header">STEP 2. </span>
								<span class="title">포인트 사용</span>
							</h4>
							<div class="tpm_wrap opened">
								<div class="tpm_header">
									<h4></h4>
								</div>
								<div class="tpm_body">
									<div class="tpm_row">
										<div class="tpm_box">
											<div id="pointList">
												<h5>CNEMA보유 포인트</h5>
												<div class="form_con">
													<div class="tpm_coupon_button">
														<a class="gray  btn_listUp" href="#" onclick="return false;">
															<span>
																<input class="btn___3" type="button" id="allPoint" value="모두쓰기">
															</span>
														</a>
													</div>
													<div class="inner_con2">
														<dt><label class="noneInput">보유포인트</label>:</dt>
														<dd class="amtValue"><span class="hasPoint">${member.v_point } </span>원</dd>
														<dt class="secondTit"><label>적용금액</label>:</dt>
														<dd><input type="text" class="textBox2" id="point">원</dd>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="ticket_payment_summary">
						    <div id="priceShow" class="tps_wrap" style="top: 0px;">
								<div class="tps_body">
									<div class="summary_box total_box">
										<div class="payment_header">결제하실 금액</div>
										<div class="payment_footer">
									    	<div class="result">
									    		<span class="num verdana" id="allPrice">${reserve2DTO.price}</span><span class="won">원</span>
								        	</div>
								    	</div>
									</div>
									<div class="summary_box discount_box">
										<div class="payment_header">할인내역</div>
										<div class="payment_body"></div>
										<div class="payment_footer">
									    	<div class="label">
									        	<span>쿠폰할인 금액</span>
									    	</div>
									    	<div class="result">
									        	<span class="num verdana"><span id="cDiscount" class="cDis">0</span></span><span class="won">원</span>
									    	</div>
								    	</div>
								    	<div class="payment_footer">
									    	<div class="label">
									        	<span>포인트할인 금액</span>
									    	</div>
									    	<div class="result">
									        	<span class="num verdana"><span id="pDiscount">0</span></span><span class="won">원</span>
									    	</div>
								    	</div>
									</div>
									<div class="summary_box payment_box">
										<div class="payment_header">결제내역</div>
										<div class="payment_footer">
									   		<div class="label">
						                    	<span>남은 결제금액</span>
						                	</div>
						                	<div class="result">
						                		<span class="num verdana" id="nowPrice">${reserve2DTO.price}</span><span class="won">원</span>
						                	</div>
						            	</div>
									</div>
								</div>
							</div>
						</div>
						
					<div class="ticket_payment_clear"></div>
					<div id="bottom_area">
							<form action="">
							<input type="button" id="leftBtn2" value="이전" >
								<table border="1"  id="qrMovie">
									<tr>
										<td rowspan="2"><img width="75px;" height="106px;" alt="" src="../resources/movie_poster/${movie.fileName }"></td>
										<td>${movie.movie_name }</td>
									</tr>
									<tr>
										<td>${movie.age_limit }</td>
									</tr>
									
								</table>
								
								<table border="1" id="qrTheater">
									<tr>
										<td>극장</td><td>${theater.location }</td>
									</tr>
									<tr>
										<td>일시</td><td>
										<c:if test="${day ne '2000-01-01' }">
											${day }
										</c:if>
										</td>
									</tr>
									<tr>
										<td>상영관</td><td>${screenDTO.room_num }
										<c:if test="${!empty screenDTO }">관</c:if>
										${screenDTO.floor }층
										</td>
									</tr>
									<tr>
										<td>인원</td><td>${reserve2.people }</td>
									</tr>										
								</table>
								<table border="1" id="qrSeat">
									<tr>
										<td id="seatN">좌석선택</td>
									</tr>											
								</table>
							<input type="button" id="rightBtn3" value="결제">	
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	<div style="display: none;">
		<form action="./quickReservePay" method="post" name="reserve" style="clear: both;">
			m<input type="text" id="movie_num" name="movie_num" value="${reserve.movie_num }">
			t<input type="text" id="theater_num" name="theater_num" value="${reserve.theater_num }">
			d<input type="text" id="day_num" name="day_num" value="${reserve.day_num }">
			sc<input type="text" id="schedule_num" name="schedule_num" value="${reserve.schedule_num }">
			<br>
			ad<input type="text" id="adult_num" name="adult_num" value="${reserve2.adult_num }">
			te<input type="text" id="teen_num" name="teen_num" value="${reserve2.teen_num }">
			pC<input type="text" id="pCount" name="people" value="${reserve2.pCount }">
			pe<input type="text" id="people" name="pCount" value="${reserve2.people }">
			<input type="text" id="total_price" name="total_price" value="${reserve2.price }">
			<div id="seatList">
			<c:forEach items="${seat_num }" var="seat">
				<input type="text" class="ss" name="seat_num" value="${seat }">
			</c:forEach>
			</div>
			c_num<input type="text" id="useCoupon" name="c_num" value="0">
			point<input type="text" id="usePoint" name="point" value="0">
			nowPrice<input type="text" id="price" name="price" value="${reserve2.price }">
		</form>
	</div>			
	<!-- 내용 끝 -->
			</div>
			<!-- ///////////////////////////////// -->
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	</div>
	
</body>
</html>
