<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Notice Write Form</h1>
	
	<form action="noticeWrite" method="post" id="frm">
		<table>
		<tr>
			<td><input type="text" name="title" placeholder="제목을 입력해주세요."></td>
			<td><input type="text" name="writer" value="${member.id}" readonly="readonly"></td>
		</tr>
		<tr>
			<td class="content" colspan="2"><textarea id="contents" name="contents" draggable="false" placeholder="내용을 입력해주세요."></textarea></td>
		</tr>
	</table>
	

	<input type="submit" id="savebutton" value="글쓰기">
	</form>
</body>
</html>