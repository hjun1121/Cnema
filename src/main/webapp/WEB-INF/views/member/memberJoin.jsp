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
		var idCheck = false;
		var pwCheck = false;
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
					if(id.length>=6 && id.length<=12){
						if(data.trim() == 'ok'){
							$("#id_ch").html('<p style="color: green">사용 가능 아이디입니다.</p>');	
							idCheck= true;
						}else{
							$("#id_ch").html('<p style="color: red">중복된 아이디입니다.</p>');	
							idCheck= false;
						}
					}else{
						$("#id_ch").html('<p style="color: red">아이디는 6~12 글자 입니다.</p>');	
						idCheck= false;
					}
				}
			}); 
			
		});
		//id 중복체크 끝
		
		// pw 확인 시작
		$("#pw1").change(function(){
			var pw1= $("#pw1").val();
			var pwpw=false; //특문 유무
			for(var i=0; i<pw1.length;i++){
				if(pw1.charAt(i) == '!' || pw1.charAt(i) == '@' || pw1.charAt(i) =='#' || pw1.charAt(i) =='$' || pw1.charAt(i) =='%' || pw1.charAt(i) =='^' || pw1.charAt(i) =='&' || pw1.charAt(i) =='*'){
					i= pw1.length;
					pwpw=true;
				}else{
				}
			}
			
			if(pwpw==true && pw1.length>7 && pw1.length<13 ){
				
				$("#pw_ch").html('<p style="color: red">비밀번호를 확인해주세요</p>');
				$("#pw2").val("");
				$("#pw2").removeAttr("readonly")
				pwCheck = false;
				
			}else{
				$("#pw_ch").html('<p style="color: red">비밀번호는 1개 이상의 특수문자 와 8~12 자리 </p>');
				$("#pw2").val("");
				
				$("#pw2").attr("readonly", "readonly")
				pwCheck = false;
			}
		});
		
		
		$("#pw2").change(function(){
			var pw1= $("#pw1").val();
			var pw2= $("#pw2").val();
			if(pw1 == pw2){
				$("#pw_ch").html('<p style="color: green">비밀번호 확인 완료</p>');
				pwCheck = true;
			}else{
				$("#pw_ch").html('<p style="color: red">비밀번호가 다릅니다</p>');
				pwCheck = false;
			}
		});	
		
		// pw 확인 끝
		
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
		
		//email List 시작
		$("#mailList").change(function(){
			var ml = $("#mailList").val();
			
			if(ml == 0){
				$("#email2").prop('readonly', false)
				$("#email2").val("");
				$("#email2").focus();
			}else{
				$("#email2").val(ml);
				$("#email2").prop('readonly', true)
			}
		});
		
		//email List 끝
		$("#mailCheck").click(function(){
			var email1 = $("#email1").val();
			var email2 = $("#email2").val();
			var email = email1 +'@'+email2;
			$("#email").val(email);
			
			$.ajax({
				url:"../ajax/emailCheck",
				type:"post",
				data:{
				},
				success:function(data){
					$("#email_ch").html(data);
				}
			});
			
		})
		
		$("#joinBtn").click(function(){
			var f = $("#f").val();
			var m = $("#m").val();
			var l = $("#l").val();
			var phone = f+'-'+m+'-'+l;
			$("#phone").val(phone);
			
			document.frm.submit();
		})
	});

</script>
</head>
<body>
	<h2>Member Join</h2>
	<form action="memberJoin" method="post" name="frm" enctype="multipart/form-data">
		프사<input type="file" name="file">
		<p>id <input type="text" id="id" name="id"></p>
		<div id="id_ch"></div>
		<p>pw <input type="text" id="pw1" name="pw"></p>
		<p>pwC <input type="text" id="pw2" ></p>
		<div id="pw_ch"></div>
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
		<input type="hidden" id="phone" name="phone">
		
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
		<input type="button" id="mailCheck" value="이메일 인증">
		</p>
		<div id="email_ch">
		
		</div>
		
		<input type="hidden" id="email" name="email">
		<p></p>
		<input type="text" id="postCode" name="postCode" placeholder="우편번호" readonly="readonly">
		<input type="button" id="addrCheck" value="우편번호 찾기" readonly="readonly" >
		<br>
		<input type="text" id="addr" name="addr1" placeholder="주소" readonly="readonly">
		<input type="text" id="addr2" name="addr2" placeholder="나머지주소">
		
		<br>
		<input type="button" id="joinBtn" value="조인">
	</form>
	
	
	
</body>
</html>