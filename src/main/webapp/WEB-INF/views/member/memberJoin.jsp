<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	$(function(){
		
		//id 중복체크 시작
		$("#id").change(function(){
			var id = $("#id").val();
			
			$.ajax({
				url: "../ajax/idCheck",
				type: "POST",
				data: {
					id : id
				},
				success: function(data){
					$("#id_ch").html('<p style="color: green">사용 가능 아이디입니다.</p>');
				}
			});
			
		});
		//id 중복체크 끝
		
		//주소검색 시작
		$("#addrCheck").click(function(){
			new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = ''; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수

	                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    fullAddr = data.roadAddress;

	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    fullAddr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	                if(data.userSelectedType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                $("#postCode").val(data.zonecode);  //5자리 새우편번호 사용
					$("#addr").val(fullAddr);
	                // 커서를 상세주소 필드로 이동한다.
	                $("#addr2").focus();
	            }
	        }).open();
		    
		});
		//주소검색 끝
		
	});

</script>
</head>
<body>
	<h2>Member Join</h2>
	
	<form action="memberJoin" method="post">
		<p>id <input type="text" id="id" name="id"></p>
		<div id="id_ch">idid</div>
		<p>pw <input type="text" name="pw"></p>
		<p>pw2 <input type="text" ></p>
		<div id="pw_ch">pwpw</div>
		<p>name <input type="text" name="name"></p>
		<p>birth <input type="date" name="birth"></p>
		<p>남<input type="radio" name="gender" value="m" checked="checked">
		여<input type="radio" name="gender" value="f"> </p>
		
		<p>phone 
			<select id="f" >
   				<option value="">선택하세요</option>
   				<option value="010">010</option>
				<option value="011">011</option>
			</select>
			-
			<input type="text" id="m">
			-
			<input type="text" id="l">
		</p>
		<input type="text" name="phone">
		
		<p>email
		<input type="text" id="email1">@
		<input type="text" id="email2">
		<select id = "mailList">
   			<option value="0">직접입력</option>
			<option value="naver.com">naver.com</option>
			<option value="daum.net">daum.net</option>
			<option value="gmail.com">gmail.com</option>
			<option value="hotmail.com">hotmail.com</option>
		</select>
		</p>
		<input type="text" name="email">
		<p></p>
		<input type="text" id="postCode" name="postCode" placeholder="우편번호" readonly="readonly">
		<input type="button" id="addrCheck" value="우편번호 찾기" readonly="readonly" >
		<br>
		<input type="text" id="addr" name="addr" placeholder="주소" readonly="readonly">
		<input type="text" id="addr2" name="addr2" placeholder="나머지주소">
		
		
	</form>
	
	
	
</body>
</html>