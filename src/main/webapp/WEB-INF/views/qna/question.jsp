<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table cellspacing="0" cellpadding="0" class="tbl_notice_list tbl_left">
		<caption>목록</caption>
		<colgroup>
			<col style="width: 140px;">
			<col style="width: 330px;">
		</colgroup>
		<tbody>

			<tr>
				<th scope="row"><label for="inp_name">이름</label></th>
				<td colspan="3"><strong>${member.name}</strong></td>
			</tr>
			<tr>
				<th scope="row">휴대전화</th>
				<td><strong>${member.phone }</strong></td>
				<input type="hidden" id="Mobile1" name="Mobile1" value="">
				<th scope="row">이메일</th>
				<td><strong>${member.email }</strong></td>
				<input type="hidden" id="HiddenEmail1" name="HiddenEmail1"
					value="f14fc398ef45f53e42b0034e44e03f76">
			</tr>
			<tr class="check_info">
				<td colspan="4"><strong>※&nbsp;&nbsp;문의에 대한 빠른 답변을
						위해&nbsp;회원 가입 시 입력하신 연락처를 확인해주세요.</strong> <a
					href="https://www.cjone.com/cjmweb/member/passwd.do?coopco_cd=7010&amp;brnd_cd=1000"
					id="cjone" class="round gray on" title="수정" target="_blank"><span>수정</span></a>
				</td>
			</tr>
			<tr>
				<th scope="row">문의유형 <em><img
						src="http://img.cgv.co.kr/R2014/images/common/ico/ico_redstar.png"
						alt="필수"></em></th>
				<td>
					<ul class="type_list">
						<li id="li_ra_1" class="on"><input type="radio"
							checked="checked" id="inp_type01" name="sel_qnatype" value="1249"><label
							for="inp_type01">문의</label></li>
						<li id="li_ra_2"><input type="radio" id="inp_type02"
							name="sel_qnatype" value="1250"><label for="inp_type02">불만</label></li>
						<li id="li_ra_3"><input type="radio" id="inp_type03"
							name="sel_qnatype" value="1251"><label for="inp_type03">칭찬</label></li>
						<li id="li_ra_4"><input type="radio" id="inp_type04"
							name="sel_qnatype" value="1252"><label for="inp_type04">제안</label></li>
					</ul>
				</td>
			</tr>

			<tr>
				<th scope="row">영화관 선택</th>
				<td colspan="3">
					<ul class="type_list">
						<li class="on"><input type="radio" id="no_sel"
							name="sel_theaterchoise" checked="checked" value="0"><label
							for="no_sel">선택하지 않음</label></li>
						<li><input type="radio" id="sel" name="sel_theaterchoise"
							value="1"><label for="sel">선택함</label></li>
					</ul> 
					
					<label for="sel_regioncode" class="hidden">지역 선택</label> <select
					title="지역 선택" class="sel01" id="sel_regioncode"
					name="sel_regioncode" disabled="disabled" style="width: 114px;">
					<option value="" selected="selected">지역 선택</option>
						<option value="02">경기</option>
						<option value="01">서울</option>
					</select> 
					<label for="sel_theatercode" class="hidden">영화관 선택</label> 
					<select title="영화관 선택" class="sel01" id="sel_theatercode" name="sel_theatercode" disabled="disabled" style="width: 114px;">
					<option value="" selected="selected">영화관선택</option>
						<option value="02">강남</option>
						<option value="01">홍대</option>
					</select>
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="inp_title">제목 <em><img
							src="http://img.cgv.co.kr/R2014/images/common/ico/ico_redstar.png"
							alt="필수"></em></label></th>
				<td colspan="3"><input type="text" id="inp_title"
					name="inp_title" class="inp01" style="width: 672px;"></td>
			</tr>
			<tr>
				<th scope="row"><label for="inp_textbox">내용 <em><img
							src="http://img.cgv.co.kr/R2014/images/common/ico/ico_redstar.png"
							alt="필수"></em></label></th>
				<td colspan="3"><textarea cols="60" rows="5" id="inp_textbox"
						name="inp_textbox" class="inp_txtbox01"
						style="height: 94px !important;"
						onkeyup="javascript:checkByte(this,5000,'sp_ad_content_size_1', 'sp_ad_content_size_2');"
						placeholder="※주민번호 등 개인정보가 포함되지 않도록 유의하시기 바랍니다."></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="voc_upload_file">첨부파일</label></th>
				<td colspan="3"><input type="file" id="upload_file"
					name="voc_upload_file" title="파일 업로드" size="51"
					onclick="javascript:alert('주민번호 등 개인정보가 포함된 파일이 첨부되지 않도록 유의하시기 바랍니다.');">
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>