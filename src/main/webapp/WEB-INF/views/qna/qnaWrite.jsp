<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/headerBar.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/boardMain/boardTab.css">
<title>Insert title here</title>
<style type="text/css">
table {
    border-top: solid 1px #d6d4ca;
    border-bottom: solid 1px #b8b6aa;
    font-size: 12px;
    line-height: 1.2;
    color: #666;
    font-family: 'NanumBarunGothic', '맑은 고딕', '돋움', Dotum, sans-serif;
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
}
#qnaWriteForm{
	display: inline-block;
	width:700px;
	height:600px;
	margin-left:50px;


}
.board_container{
	width: 1200px;
	margin:0 auto;
	margin-top:40px;
 
}
th{
    line-height: 27px;
    vertical-align: top;
    padding: 15px 0px 15px 13px;
    border-top: 1px solid #d6d4ca;
    text-align: left;
    font-weight: normal
}

td{
	padding: 15px 5px;
    text-align: left;
	border-top: solid 1px #d6d4ca;
	font-weight: normal;
    line-height: 1.5em;
    vertical-align: middle
}
#titleInput{
 width:620px;
 height: 30px;
border: 1px solid #ccc;
}
textarea{
width:620px;
border: 1px solid #ccc;
}

#titleInput, textarea,#areasel,#locationsel{

background-color: #f1f0e5;

}
#btnSection{
	width:100%;
}
#btn1{
    padding: 10px 15px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
    margin: 0 auto;
    -webkit-transition-duration: 0.4s; 
    transition-duration: 0.4s;
    cursor: pointer;
    border-radius: 5px;
    background-color: #ede9dd; 
    color: #7b7b7b; 
 	border:  2px solid #7b7b7b;
 
	

}

#btn2{
	
    padding: 10px 15px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
    margin: 0 auto;
    -webkit-transition-duration: 0.4s; 
    transition-duration: 0.4s;
    cursor: pointer;
    border-radius: 5px;
    background-color: #e71a0f; 
    color: #ffffff; 
    border: 2px solid #e71a0f;
    float:right;
}


</style>
<script type="text/javascript">
function move() {
	location.href="../home/park";
	
}


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
                        		<a href="../">
                        		<img alt="home" src="${pageContext.request.contextPath }/resources/images/common/btn/btn_home.png"></a>
                        	</li>
                            <li>
                                <a href="#">게시판</a>
                            </li>
                            <li>
                                <a href="#">문의</a>
                            </li>
                            <li class="last">
                            	글쓰기
                            </li>
                    	</ul>
                	</div>
            	</div>
        	</div>
        	<!-- 상단바 끝 -->
        	
	<div class="board_container">
	<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/boardTab/qnaTab.jsp"></c:import>
	
	<form action="qnaWrite" method="post" enctype="multipart/form-data" id="qnaWriteForm">
	<div class="customer_top">
		<h2 class="tit">이메일 문의</h2>
		<p class="stit">불편사항이나 문의사항을 남겨주시면 최대한 신속하게 답변 드리겠습니다.</p>
	</div><br>
		<table>
		<tr>
			<th>이름</th>
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
			<input type="radio" name="typesel" value="10" checked="checked">문의
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
			<input type="text" name="title" id="titleInput">
			</td>
		</tr>
		
		<tr>
			<th>내용</th>
			<td>
			<textarea name="contents" rows="15" cols="100" draggable="false"></textarea>
			</td>
		
		</tr>
		
		
			
		
		<!-- 파일 추가  -->
		<tr>
			<th>첨부파일</th>
			<td><input type="file" name="file"></td>
		</tr>
			</table>
				<br>
	<input type="hidden" name="writer" value="${member.id}">
	<div id="btnSection">
	<input type="button" id="btn1" onclick="move()" value="등록취소">
	<input type="submit" id="btn2" value="등록하기">
	</div>	
</form>
		
		
		
		</div><!--게시판 내용  -->
	
	
	</div>
	
	
	<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	
</div>
	</body>
</html>