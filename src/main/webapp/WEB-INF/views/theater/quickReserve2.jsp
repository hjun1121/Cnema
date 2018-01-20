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
		/*  */
		$("#all").on("click", ".adult" , function(){
			var adult = $(this).attr("title");
			var teen = $("#teen_num").val();
			var newCount = (adult*1+teen*1);
			if(sCount>newCount){
				alert("인원수보다 선택 자리수가 더 많습니다")
			}else{
				var theater_num = $("#theater_num").val();
				var day_num = $("#day_num").val();
				var schedule_num = $("#schedule_num").val();
				$(".adult").css("background-color","");
				$(this).css("background-color","white");
				$("#adult_num").val(adult);
				if(adult=='0'){
					$("#adult_num").val("");
					if(teen == ''){
						$("#people").val("");
					}else{
						$("#people").val("청소년"+teen+"명");
					}
				}else{
					if(teen == ''){
						$("#people").val("성인"+adult+"명");
					}else{
						$("#people").val("성인"+adult+"명, 청소년"+teen+"명");
					}
				}
				var people = $("#people").val();
				$("#pCount").val(adult*1+teen*1);
				$.ajax({
					url:"../ajax/qrSchedule",
					type:"post",
					data:{
						theater_num:theater_num,
						day_num: day_num,
						schedule_num:schedule_num,
						people: people
					},
					success:function(data){
						$("#qrTheater").html(data);
					}
				});
			}
		});
		/*  */
		$("#all").on("click", ".teen" , function(){
			var teen = $(this).attr("title");
			var adult = $("#adult_num").val();
			var newCount = (adult*1+teen*1);
			if(sCount>newCount){
				alert("인원수보다 선택 자리수가 더 많습니다")
			}else{
				var theater_num = $("#theater_num").val();
				var day_num = $("#day_num").val();
				var schedule_num = $("#schedule_num").val();
				$(".teen").css("background-color","");
				$(this).css("background-color","white");
				$("#teen_num").val(teen);
				if(teen=='0'){
					$("#teen_num").val("");
					if(adult==''){
						$("#people").val("");
					}else{
						$("#people").val("성인"+adult+"명");
					}
				}else{
					if(adult == ''){
						$("#people").val("청소년"+teen+"명");
					}else{
						$("#people").val("성인"+adult+"명, 청소년"+teen+"명");
					}
				}
				var people = $("#people").val();
				$("#pCount").val(adult*1+teen*1);
				$.ajax({
					url:"../ajax/qrSchedule",
					type:"post",
					data:{
						theater_num:theater_num,
						day_num: day_num,
						schedule_num:schedule_num,
						people: people
					},
					success:function(data){
						$("#qrTheater").html(data);
					}
				});
			}
		});
		/*  */
		var sCount = 0;
		$("#all").on("click", ".seats" , function(){
			var pCount = $("#pCount").val();
			if(sCount < pCount){
				$(this).attr("class","seatOn");
				$(this).css("background-color","pink")
				var seat_num = $(this).attr("title");
				$("#seatList").append("<input type='hidden' class='ss' name='seat_num' id='s"+seat_num+"' value='"+seat_num+"'>");
				
				var x_num = ${screenDTO.x_num};//5
				var y_num = ${screenDTO.y_num};//6
				var x = seat_num / y_num;
				var y = seat_num % y_num;

				if(x<=1){
					x='A';
				}else if(x<=2){
					x='B';
				}else if(x<=3){
					x='C';
				}else if(x<=4){
					x='D';					
				}else if(x<=5){
					x='E';					
				}
				
				if(y==0){
					y= y_num;
				}
				if(sCount==0){
					$("#seatN").html("<span id='"+seat_num+"'> &nbsp; "+x+y+"번</span>");
				}else{
					$("#seatN").append("<span id='"+seat_num+"'> &nbsp; "+x+y+"번</span>");
				}
				sCount++;

				var adult_num = $("#adult_num").val();
				var teen_num = $("#teen_num").val();
				$.ajax({
					url:"../ajax/qrPrice",
					type:"post",
					data:{
						sCount:sCount,
						adult_num:adult_num,
						teen_num:teen_num
					},
					success:function(data){
						$("#qrPrice").html(data);
					}
				});
				
				
			}else{
				alert("인원보다 많은자리입니다");
			}
		});
		
		
		/*  */
		$("#all").on("click", ".seatOn" , function(){
			if(confirm("이 좌석을 취소하시겠습니까?")){
				$(this).attr("class","seats");
				$(this).css("background-color","")
				var seat_num = $(this).attr("title");
				$("#s"+seat_num).remove();	
				$("#"+seat_num).remove();
				sCount--;
				
				var adult_num = $("#adult_num").val();
				var teen_num = $("#teen_num").val();
				$.ajax({
					url:"../ajax/qrPrice",
					type:"post",
					data:{
						sCount:sCount,
						adult_num:adult_num,
						teen_num:teen_num
					},
					success:function(data){
						$("#qrPrice").html(data);
					}
				});
				
			}else{
				
			}
			var seat_num = $(this).attr("title");
			var seatList = $("#seat_num").val();
		});
		/*  */
		$("#leftBtn1").click(function(){
			
		});
		/*  */
		$("#rightBtn2").click(function(){
			var movie_num = $("#movie_num").val();
			var theater_num = $("#theater_num").val();
			var day_num = $("#day_num").val();
			var schedule_num = $("#schedule_num").val();
			var adult_num = $("#adult_num").val();
			var teen_num = $("#teen_num").val();
			var pCount = $("#pCount").val();
			if(sCount==pCount && sCount != 0){
				//alert("movie_num :"+movie_num+"\n theater_num :"+theater_num+"\n day_num :"+day_num +"\n schedule_num :"+schedule_num+"\n adult_num :"+adult_num+"\n teen_num :"+teen_num+"\n pCount :"+pCount);
				if(adult_num ==""){
					$("#adult_num").val("0");
				}else if(teen_num ==""){
					$("#teen_num").val("0");
				}
				$("#seatName").val($("#seatN").html());
				$("#price").val($("#qrPrice").html());			
				document.reserve.submit();
			}else{
				alert("인원수와 자리를 확인해주세요");
			}
		});

		/*  */
	});
</script>
<style type="text/css">
	*{
		margin: 0px;
		padding: 0px;
	}
	div{
		height: 600px;
	}

	#all{
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
	<h2>Quick Reserve2</h2>
	<div id="all">
		<table border="1" style="background-color: yellow;">
			<tr>
				<th>일반</th>
				<td class="adult seat" title="0" style="background-color: white;">0</td>
				<td class="adult seat" title="1">1</td>
				<td class="adult seat" title="2">2</td>
				<td class="adult seat" title="3">3</td>
				<td class="adult seat" title="4">4</td>
				<td class="adult seat" title="5">5</td>
				<td class="adult seat" title="6">6</td>
			</tr>
			<tr>
				<th>청소년</th>
				<td class="teen seat" title="0" style="background-color: white;">0</td>
				<td class="teen seat" title="1">1</td>
				<td class="teen seat" title="2">2</td>
				<td class="teen seat" title="3">3</td>
				<td class="teen seat" title="4">4</td>
				<td class="teen seat" title="5">5</td>
				<td class="teen seat" title="6">6</td>
			</tr>
		</table>
		
		<table border="1" style="background-color: yellow;">
			<c:forEach begin="1" end="${screenDTO.x_num }" varStatus="c">
				<tr>
					<c:if test="${c.count eq 1 }"><td>A</td></c:if>
					<c:if test="${c.count eq 2 }"><td>B</td></c:if>
					<c:if test="${c.count eq 3 }"><td>C</td></c:if>
					<c:if test="${c.count eq 4 }"><td>D</td></c:if>
					<c:if test="${c.count eq 5 }"><td>E</td></c:if>
					<c:if test="${c.count eq 6 }"><td>F</td></c:if>
					<c:if test="${c.count eq 7 }"><td>G</td></c:if>
					<c:if test="${c.count eq 8 }"><td>H</td></c:if>
					<c:if test="${c.count eq 9 }"><td>I</td></c:if>
					<c:if test="${c.count eq 10 }"><td>J</td></c:if>
					<c:if test="${c.count eq 11 }"><td>K</td></c:if>
					<c:if test="${c.count eq 12 }"><td>L</td></c:if>
					

					
					<c:forEach begin="1" end="${screenDTO.y_num }" varStatus="co">
					
						<c:forEach items="${seatCheck }" var="seat">
							<c:if test="${seat eq (c.count-1)*screenDTO.y_num+ co.count}">
								<c:set var="check" value="${(c.count-1)*screenDTO.y_num+ co.count }"></c:set>
							</c:if>
						</c:forEach>
						
						<c:if test="${check eq (c.count-1)*screenDTO.y_num+ co.count }">
							<td id="seat${(c.count-1)*screenDTO.y_num+ co.count }" style="background-color: blue;" title="${(c.count-1)*screenDTO.y_num+ co.count }">
								${co.count }
							</td>					
						</c:if>
						<c:if test="${check ne (c.count-1)*screenDTO.y_num+ co.count }">
							<td id="seat${(c.count-1)*screenDTO.y_num+ co.count }" class="seats" title="${(c.count-1)*screenDTO.y_num+ co.count }">
								<a href="#"  onclick="return false;">${co.count }</a>
							</td>				
						</c:if>
					</c:forEach>
				</tr>
			</c:forEach>
		</table>

	</div>
	<div id="bottom_area">
		
		<form action="">
		<input type="button" id="leftBtn1" value="이전" style="float: left;">
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
					<td>인원</td><td></td>
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
		<input type="button" id="rightBtn2" value="결제">	
		</form>
		
		<form action="./quickReserve3" method="post" name="reserve" style="clear: both;">
			<input type="hidden" id="movie_num" name="movie_num" value="${reserve.movie_num }">
			<input type="hidden" id="theater_num" name="theater_num" value="${reserve.theater_num }">
			<input type="hidden" id="day_num" name="day_num" value="${reserve.day_num }">
			<input type="hidden" id="schedule_num" name="schedule_num" value="${reserve.schedule_num }">
			<br>
			<input type="hidden" id="adult_num" name="adult_num" value="">
			<input type="hidden" id="teen_num" name="teen_num" value="">
			<input type="hidden" id="pCount" name="pCount" value="0">
			<input type="hidden" id="people" name="people">
			<input type="hidden" id="seatName" name="seatName">
			<input type="hidden" id="price" name="price">
			<div id="seatList">
			
			</div>
		</form>
	</div>
</body>

</html>






