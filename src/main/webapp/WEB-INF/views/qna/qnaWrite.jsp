<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="qnaWrite" method="post" enctype="multipart/form-data">
		<table>
		<tr>
			<th>이른</th>
			<td>${member.name}</td>
		</tr>
		<tr>
			<th>휴대전화</th>
			<td>${member.phone }</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${member.email}</td>
		</tr>
		<tr>
			<th>문의유형</th>
			<td>
			<input type="radio" name="typesel" value="10">문의
			<input type="radio" name="typesel" value="11">불만
			<input type="radio" name="typesel" value="12">칭찬
			<input type="radio" name="typesel" value="13">제안
			</td>
		</tr>
		<tr>
		
	
		<!-- 지점 정보 불러오기!!  -->
			<th>영화관 선택</th>
			<td>
				<select id="areasel" name="areasel">
					<option selected="selected">지역선택</option>
					<c:forEach items="${area_list}" var="dto">
					<option>${dto.area}</option>
					</c:forEach>
				</select>
			</td>
			<td>
			<select id="locationsel" name="locationsel">
					<option selected="selected">영화관선택</option>
					<c:forEach items="${area_list}" var="dto">
					<option>${dto.location}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<!-- 지점 정보 불러올 부분!! -->
		
		
		
		<tr>
			<th>제목</th>
			<td>
			<input type="text" name="title">
			</td>
		</tr>
		
		<tr>
			<th>내용</th>
			<td>
			<textarea name="contents" rows="5" cols="20"></textarea>
			</td>
		
		</tr>
		
		<tr>
			<td><input type="hidden" name="writer" value="${member.id}"></td>
		</tr>
		<!-- 파일 추가  -->
		<tr>
			<th>첨부파일</th>
			<td><input type="file" name="file"></td>
		</tr>
			</table>
				
	
	<a href="../home/park">취소</a>
	
	<input type="submit" value="등록하기">
		
</form>
	
	
	</body>
</html>