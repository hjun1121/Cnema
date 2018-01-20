<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 결제</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	$(function(){
		
		var price = ${ticketPrice.price };
		
		if(price>0){
			var IMP = window.IMP; // 생략가능
			IMP.init('imp94197155'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			
			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '영화명:${movie}',
			    amount : ${ticketPrice.price},
			    buyer_email : '${member.email}',
			    buyer_name : '${member.id}',
			    buyer_tel : '${member.phone}',
			    buyer_addr : '${member.addr1}'+'${member.addr2}',
			    buyer_postcode : '${member.postCode}',
			    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			        
			        document.frm.submit();
			        
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			        location.href="./marketTotalList.market?library=${library}&ln=${ln}";
			    }
			});
			
		}else{
			 document.frm.submit();
		}
		
	});
</script>
</head>
<body>

	<form action="./quickReserveGo" method="POST" name="frm">
			<input type="text" id="movie_num" name="movie_num" value="${reserve.movie_num }">
			<input type="text" id="theater_num" name="theater_num" value="${reserve.theater_num }">
			<input type="text" id="day_num" name="day_num" value="${reserve.day_num }">
			<input type="text" id="schedule_num" name="schedule_num" value="${reserve.schedule_num }">
			<br>
			<input type="text" id="adult_num" name="adult_num" value="${ticketPrice.adult_num }">
			<input type="text" id="teen_num" name="teen_num" value="${ticketPrice.teen_num }">
			<input type="text" id="pCount" name="people" value="${ticketPrice.people }">
			<input type="text" id="total_price" name="total_price" value="${ticketPrice.total_price }">
			<div id="seatList">
			<c:forEach items="${reserve.seat_num }" var="seat">
				<input type="text" class="ss" name="seat_num" value="${seat }">
			</c:forEach>
			</div>
			<input type="text" id="useCoupon" name="c_num" value="${ticketPrice.c_num}">
			<input type="text" id="usePoint" name="point" value="${ticketPrice.point}">
			<input type="text" id="price" name="price" value="${ticketPrice.price }">
	</form>
	
</body>
</html>