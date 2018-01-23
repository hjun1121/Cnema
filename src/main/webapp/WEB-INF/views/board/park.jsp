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

<title>게시판</title>
<style type="text/css">



#event_contents{
	
	height: 380px;
	display: block;
}
#qna_contents{
/* background-color: green; */
	height: 380px;
	display: block;
	margin-top:15px;
}

#notice_contents{
/* background-color:purple; */
	height: 270px;
	display: block;
	margin-top:15px;
}
hr{
 width: 820px;
 float: left;
 margin-bottom: 10px;

}
.submenu{
width:100%;
height:45px;
display: block;
/* background-color: yellow; */
}
#ingBtn , #endBtn {
	
    padding: 5px 10px;
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

#endBtn{
	  display: inline-block;
    background-color: #5b5b58; 
    color: #ffffff; 

    border: 2px solid #5b5b58;
    margin-left: 10px;
    margin-right:30px;

}
 .tit{
	color: #222;
    font-weight: bold;
    display:inline-block;
    font-size: 24px;
    text-align: left;
    vertical-align: middle;
}
.email_inquiry{
	background-color: #ede9dd;
	width:250px;
	height: 300px;
	display:inline-block;
   float: left;
}
#email_image { 
	width:100px;
	display: block;
	margin:0 auto;
	margin-top:50px;
}
.email_tit{
	text-align: center;
	

}

.my_advice{
	background-color: #edf1e9;
	width:250px;
	height: 300px;
	display:inline-block;
	 
}
#advice_image { 
	width:100px;
	display: block;
	margin:0 auto;
	margin-top:50px;
}
.advice_tit{
	text-align: center;
	

}


.board_button {
    border: none;
    padding: 10px 24px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
    margin: 0 auto;
    -webkit-transition-duration: 0.4s; 
    transition-duration: 0.4s;
    cursor: pointer;
    border-radius: 10px;
    background-color: #ede9dd; 
    color: black; 
    border: 2px solid #e71a0f;
    
    
}
.board_button2{
	background-color:#edf1e9;
	 border: none;
    padding: 10px 24px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
    margin: 0 auto;
    -webkit-transition-duration: 0.4s; 
    transition-duration: 0.4s;
    cursor: pointer;
    border-radius: 10px;
    color: black; 
    border: 2px solid #e71a0f;
}
.board_button2:hover {
    background-color: #e71a0f;
    color: white;
}

.board_button:hover {
    background-color: #e71a0f;
    color: white;
}

.board_qna_btn{
	width:120px;
	height:70px;
	margin: 0 auto;
	margin-top:50px;
	
}
section{
display:inline-block;
width:32%;
height: 250px;
margin-right:5px;
}
.eventList_image{
    width: 95%;
    height: 95%;

}
.tit{
margin-left:15px;
}
#notice_contents .tit {
    color: #222;
    font-size: 16px;
    font-weight: bold;
}
#notice_contents .txt {
    margin-top: 20px;
}
#notice_contents .txt li a {
    float: left;
    overflow: hidden;
    display: inline-block;
    width: 400px;
    color: #222;
    white-space: nowrap;
    text-overflow: ellipsis;
    text-align: left;
}
#notice_contents .txt li a:hover, .notice_area .txt li a:active {
    font-weight: bold;
    text-decoration: underline;
}

#notice_contents .txt .day {
    color: #222;
    font-size: 11px;
}
</style>
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
                                <a href="#">공지사항</a>
                            </li>
                            <li class="last">
                            	전체
                            </li>
                    	</ul>
                	</div>
            	</div>
        	</div>
        	<!-- 상단바 끝 -->	
        	
        	
        	<!-- 내용 시작 -->
<div class="board_container">
 	
<!-- tab부분 -->
 <c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/boardTab/mainTab.jsp"></c:import>
  
  <div class="board_contents">
  	<div id="event_contents">
  	

      <div class="submenu">
       <span class="tit">이벤트</span>
         <a id="endBtn" href="../event/eventList" ><i>종료된 이벤트</i></a>
         <a id="ingBtn" href="../event/eventList" ><i>진행중인 이벤트</i></a>
     </div>
     <hr>
     
     <c:forEach items="${event_list}" var="dto">
     <section> 
     <a href="../event/eventView?num=${dto.num}">
     <img class="eventList_image" src="${pageContext.request.contextPath}/resources/board/${dto.fileName}"></a>
     <p> <a href="../event/eventView?num=${dto.num}"><strong>${dto.title}</strong></a> 
     <br><br>
	  <strong>기간:</strong>&nbsp; ${dto.s_date} &nbsp;~&nbsp; ${dto.e_date} <br>
     </p>
     </section>
  	</c:forEach>
  	
  	
  	</div>
  	
  	<div id="qna_contents">
  	<span class="tit">문의</span><br><br>
  		<hr>
  		<div class="email_inquiry">
			<img id="email_image" alt="" src="${pageContext.request.contextPath }/resources/images/board/qnaicon.PNG">
			<p class="email_tit"> <strong>이메일 문의</strong> <br><br>
			24시간 365일 언제든지 문의해주세요.<br></p>
			<div class="board_qna_btn"><a class="board_button" href="../qna/qnaWrite">문의하기</a></div>
       </div>
  
  	 <div class="my_advice">
		  	 <img id="advice_image" alt="" src="${pageContext.request.contextPath }/resources/images/board/myqna.PNG">
			<p class="advice_tit">내 상담 내역 확인<br><br>
				문의하신 내용을 확인하실 수 있습니다.<br></p>
           <form action="../qna/qnaMyList" method="post">
			<input type="hidden" name="id" value="${member.id }">
			<div class="board_qna_btn"><input type="submit" class="board_button2" value="문의내역 조회"></div>	
			</form>
           </div>
  	</div>
  	
  	
  	<div id="notice_contents">
  		 <a href="../notice/noticeList"><span class="tit">공지/뉴스</span></a>
			<a href="../notice/noticeList"><img alt="" src="${pageContext.request.contextPath }/resources/images/board/plus.PNG"> </a><br>
			<hr>
			<c:forEach items="${notice_list}" var="dto">
			<ul class="txt">
                <li><a href="${pageContext.request.contextPath }/notice/noticeView?num=${dto.num}">${dto.title}</a><span class="day">${dto.reg_date}</span></li>
            </ul>
			</c:forEach>
  	</div>
  
  	<a href="../qna/qnaList">qnaList</a>
  	<a href="../community/pageContentsWrite">페이지 글 쓰기</a>
  		</div>     
  </div> 	
        	
			<!-- 내용 끝 -->
			
			</div>
			<!-- ///////////////////////////////// -->
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	</div>










</body>
</html>