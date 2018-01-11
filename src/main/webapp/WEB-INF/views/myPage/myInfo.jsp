<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	$(function(){
		var idCheck = false;
		var pwCheck = false;
		
		$("#pw1").change(function(){
			$("#pwc").val('<input type="password" id="pw2" name="pw">');
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
	<h3>회원 정보 수정</h3>
	<form action="memberJoin" method="post" name="frm" enctype="multipart/form-data">
		<table>
			<tr>
				<td>ID</td>
				<td><input type="text" id="id" name="id" value="${memberDTO.id }" readonly="readonly"></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input type="password" id="pw1" name="pw" value="${memberDTO.pw }"><br>
					<div id="pwc"></div>
					<div id="pw_ch"></div></td>
			</tr>
			<tr>
				<td>NAME</td>
				<td><input type="text" id="name" name="name" value="${memberDTO.name }" readonly="readonly"></td>
			</tr>
			<tr>
				<td>BIRTH</td>
				<td><input type="date" id="birth" name="birth" value="${memberDTO.birth }" readonly="readonly"></td>
			</tr>
			<tr>
				<td>GENDER</td>
				<td><input type="text" id="gender" name="gender" value="${memberDTO.gender }" readonly="readonly"></td>
			</tr>
			<tr>
				<td>PHONE</td>
				<td><input type="text" id="phone" name="phone" value="${memberDTO.phone }"></td>
			</tr>
			<tr>
				<td>EMAIL</td>
				<td><input type="text" id="email" name="email" value="${memberDTO.email }"></td>
			</tr>
			<tr>
				<td>POSTCODE</td>
				<td><input type="text" id="postCode" name="postCode" placeholder="우편번호" readonly="readonly" value="${memberDTO.postCode }">
					<input type="button" id="addrCheck" value="우편번호 찾기" readonly="readonly" ></td>
			</tr>
			<tr>
				<td>나머지주소</td>
				<td><input type="text" id="addr" name="addr1" placeholder="주소" readonly="readonly" value="${memberDTO.addr1 }">
					<input type="text" id="addr2" name="addr2" placeholder="나머지주소" value="${memberDTO.addr2 }"></td>
			</tr>
		</table>
		<input type="button" id="joinBtn" value="수정하기">
	</form>
</body>
</html>