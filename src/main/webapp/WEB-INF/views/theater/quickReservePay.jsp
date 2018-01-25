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
                            <li>
                                <a href="#">빠른예매</a>
                            </li>
                            <li class="last">
                            	결제
                            </li>
                    	</ul>
                	</div>
            	</div>
        	</div>
        	<!-- 상단바 끝 -->
        	
        	<!-- 내용시작 -->

	<form action="./quickReserveGo" method="POST" name="frm">
			<input type="hidden" id="movie_num" name="movie_num" value="${reserve.movie_num }">
			<input type="hidden" id="theater_num" name="theater_num" value="${reserve.theater_num }">
			<input type="hidden" id="day_num" name="day_num" value="${reserve.day_num }">
			<input type="hidden" id="schedule_num" name="schedule_num" value="${reserve.schedule_num }">
			<input type="hidden" id="adult_num" name="adult_num" value="${ticketPrice.adult_num }">
			<input type="hidden" id="teen_num" name="teen_num" value="${ticketPrice.teen_num }">
			<input type="hidden" id="pCount" name="people" value="${ticketPrice.people }">
			<input type="hidden" id="total_price" name="total_price" value="${ticketPrice.total_price }">
			<div id="seatList">
			<c:forEach items="${reserve.seat_num }" var="seat">
				<input type="hidden" class="ss" name="seat_num" value="${seat }">
			</c:forEach>
			</div>
			<input type="hidden" id="useCoupon" name="c_num" value="${ticketPrice.c_num}">
			<input type="hidden" id="usePoint" name="point" value="${ticketPrice.point}">
			<input type="hidden" id="price" name="price" value="${ticketPrice.price }">
	</form>
	<br><br><br><br><br><br><br><br><br>
		<div style="text-align: center;">
		<strong>고객님의 상품이 결제되고 있습니다.</strong>
		<p><img alt="" src="${pageContext.request.contextPath }/resources/images/theater/txt_progress.gif"></p>
		<p><img alt="" src="${pageContext.request.contextPath }/resources/images/theater/img_loading.gif"></p>
		</div>
	<br><br><br><br><br><br><br><br><br>
				<!-- 내용 끝 -->
			</div>
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	</div>
	
</body>
</html>