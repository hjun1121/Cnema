<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>이벤트 수정하기</h2>
<form action="eventUpdate" method="post" id="frm" enctype="multipart/form-data">
<div class="eventViewhead">
    <h3><input type="text" name="title" value="${view.title }"></h3> 
    <em class="date">
        <span>기간: </span>
        <input type="date" name="s_date" value="${view.s_date }">~ 
        <input type="date" name="e_date" value="${view.e_date }">
    </em>
</div>
<div class="eventViewContents">
<textarea name="contents" rows="10" cols="30"> ${view.contents}</textarea>

</div>

<!--  파일수정하기  -->
<div class="eventViewFile">
파일수정
<input type="file" name="file">
</div>


<a href="eventList">cancel</a>
		
<input type="submit" id="updateBtn" value="update"> 
</form>	
	
</body>
</html>