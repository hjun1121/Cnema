<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$("#seatN").html('${reserve2DTO.seatName}');
		$("#qrPrice").html('${reserve2DTO.price}');
		/*  */
		$("#leftBtn2").click(function(){
			alert("이전");
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
			var coupon = $(this).val();
			$.ajax({
				url:"../ajax/qrCoupon",
				type:"post",
				data:{
					price : price,
					coupon : coupon
				},
				success:function(data){
					$("#couponDiscount").css("display","");
					$("#cDiscount").html(data.trim());
					var cDiscount = $("#cDiscount").html();
					$("#pDiscount").html("");
					$("#point").val("");
					$("#pointDiscount").css("display","none");
					
					var nowPrice = price-cDiscount;
					$("#nowPrice").html(nowPrice);
				}
			});
		});
		
		/* 쿠폰 취소하기 */
		$("#deleteBtn").click(function(){
			$("#cDiscount").html("");
			var cDiscount = $("#cDiscount").html();
			var pDiscount = $("#pDiscount").html();
			$(".coupons").prop("checked","");
			
			$("#couponDiscount").css("display","none");
			
			$("#nowPrice").html(price-cDiscount-pDiscount);
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
				$("#pDiscount").html(pDiscount);
				var nowPrice = price-cDiscount-pDiscount;
				$("#nowPrice").html(nowPrice);	
				$("#pointDiscount").css("display","none");
				
				$("#point").focus();
			}else if(point<100){
				if(point==""){
					
				}else{
					alert("포인트는 100점이상 사용가능 합니다");
					$("#point").val("");
				}

				var pDiscount = $("#point").val();
				$("#pDiscount").html(pDiscount);
				var nowPrice = price-cDiscount-pDiscount;
				$("#nowPrice").html(nowPrice);	
				$("#pointDiscount").css("display","none");
				
				$("#point").focus();
			}else if(nowPrice*1<point*1){
				alert("최종가격보다 많이 쓸 수 없습니다.");
				$("#point").val(nowPrice);
				
				var pDiscount = $("#point").val();
				$("#pDiscount").html(pDiscount);
				var nowPrice = price-cDiscount-pDiscount;
				$("#nowPrice").html(nowPrice);	
				$("#pointDiscount").css("display","");
				
			}else{
				var pDiscount = $("#point").val();
				$("#pointDiscount").css("display","");
				$("#pDiscount").html(pDiscount);
				var nowPrice = price-cDiscount-pDiscount;
				$("#nowPrice").html(nowPrice);
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
				
				$("#point").focus();
				
			}else if(nowPrice<v_point){
				$("#point").val(nowPrice);
				
				var pDiscount = $("#point").val();
				$("#pDiscount").html(pDiscount);
				var nowPrice = price-cDiscount-pDiscount;
				$("#nowPrice").html(nowPrice);	
				$("#pointDiscount").css("display","");
				
			}else{
				$("#point").val(v_point);
				
				var pDiscount = $("#point").val();
				$("#pDiscount").html(pDiscount);
				var nowPrice = price-cDiscount-pDiscount;
				$("#nowPrice").html(nowPrice);	
				$("#pointDiscount").css("display","");
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
			document.reserve.submit();
		});

		
		/*  */
	});
</script>
<style type="text/css">
	*{
		margin: 0px;
		padding: 0px;
	}

	#all{
		height: 600px;
		background-color: red;
		width: 1000px;
	}
	
	#movie{
		background-color: yellow;
		width: 290px;
		float: left;
		margin-left: 2px;
	}
	#theater{
		background-color: yellow;
		width: 290px;
		float: left;
		margin-left: 2px;
	}
	#day{
		background-color: yellow;
		width: 100px;
		float: left;
		margin-left: 2px;
	}
	#schedule{
		background-color: yellow;
		width: 310px;
		float: left;
		margin-left: 2px;
	}
	
	.head{
		height: 35px;
		background-color: black;
		
	}
	
	.head h2{
		color: white;
		text-align: center;
	}
	ul{
		list-style: none;
	}
	.locationList{
		float: right;
		overflow: auto;
		height: 200px;
	}
</style>
</head>
<body>
	<h2>Quick Reserve3</h2>
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
					<td>보유 포인트</td><td>${member.v_point } <input type="text" id="point" placeholder="사용할포인트 입력"><input type="button" id="allPoint" value="모두쓰기"> </td>
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
		
		<form action="./quickReserveGo" name="reserve" style="clear: both;">
			m<input type="text" id="movie_num" name="movie_num" value="${reserve.movie_num }">
			t<input type="text" id="theater_num" name="theater_num" value="${reserve.theater_num }">
			d<input type="text" id="day_num" name="day_num" value="${reserve.day_num }">
			sc<input type="text" id="schedule_num" name="schedule_num" value="${reserve.schedule_num }">
			<br>
			ad<input type="text" id="adult_num" name="adult_num" value="${reserve2.adult_num }">
			te<input type="text" id="teen_num" name="teen_num" value="${reserve2.teen_num }">
			pC<input type="text" id="pCount" name="pCount" value="${reserve2.pCount }">
			pe<input type="text" id="people" name="people" value="${reserve2.people }">
			<input type="text" id="price" name="price" value="${reserve2.price }">
			<div id="seatList">
			<c:forEach items="${seat_num }" var="seat">
				<input type="text" class="ss" name="seat_num" value="${seat }">
			</c:forEach>
			</div>
		</form>
	</div>
</body>

</html>






