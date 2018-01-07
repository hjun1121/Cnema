<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Notice Update Form</h1>
	
	<form action="noticeUpdate" method="post" id="frm">
		<input type="hidden" name="num" value="${view.num}">
		<table>
		<tr>
			<td><input type="text" name="title" value="${view.title}"></td>
			<td><input type="text" name="writer" value="${view.writer}" readonly="readonly"></td>
		</tr>
		<tr>
			<td class="content" colspan="2"><textarea id="contents" name="contents" draggable="false">${view.contents}</textarea></td>
		</tr>
		
	</table>
		<input type="submit" id="savebutton" value="수정">
	</form>
</body>
</html>