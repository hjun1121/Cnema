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

.board_container{
	width: 1200px;
	height:1000px;
	margin:0 auto;
	margin-top:40px;
 
}

#board_tab{
	background-color: gray;
	width:200px;
	height: 500px;
	display:inline-block;
	float: left;

}
#board_contents{
	background-color: black;
	width:900px;
	height: 700px;
	display:inline-block;
}	

#event_contents{
	background-color: navy;
	height: 200px;
	display: block;
}
#qna_contents{
background-color: green;
	height: 300px;
	display: block;
}

#notice_contents{
background-color:purple;
	height: 200px;
	display: block;
}

#board_tab ul {
	margin:0 auto;
    list-style-type: none;
    width: 180px;
    background-color: #f1f1f1;
}

#board_tab li a {
    display: block;
    color: #000;
    padding: 8px 16px;
    text-decoration: none;
}

#board_tab li a.active {
    background-color: #e71a0f;
    color: white;
}

#board_tab li a:hover:not(.active) {
    background-color: #e71a0f;
    color: white;
}
.submenu{

    background-color: #e71a0f;
    border: none;
    color: white;
    padding: 10px 25px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
    margin: 4px 2px;
    cursor: pointer;
	float:right;
	border-radius: 10px;
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
.eventList_image{
    width: 290px;
    height:242px;

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
 	
 	<!--tab부분  -->
	<div class="cols-content">
	<div class="col-aside">
    <h2>
        고객센터 메뉴</h2>
    <div class="snb">
        <ul>
            <li class="on" title="현재선택"><a href="#">게시판 메인<i></i></a></li>
            <li class=""><a href="../notice/noticeList">공지/뉴스<i></i></a></li>
            <li class=""><a href="../event/eventList">이벤트<i></i></a></li>            
            <li class=""><a href="../qna/qnaWrite">이메일 문의<i></i></a></li>
            
          
        </ul>
    </div>
    <div class="ad-area">
        <div class="ad-partner01">
            <iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@C_Rectangle" width="160" height="300" title="기업광고-씨티카드" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="C_Rectangle" id="C_Rectangle"></iframe>
        </div>
        <div class="ad-partner02">
            <iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@Image_text" width="160" height="35" title="영화광고-코코" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="Image_text" id="Image_text"></iframe>
        </div>
    </div>
</div>
	
	</div>
	<!--tab end  -->

  
  <div id="board_contents">
  	<div id="event_contents">
  	
       <h2>EVENT</h2>

      <div class="submenu">
         <a href="../event/eventList" ><i>진행중인 이벤트</i></a>
     </div>
     <c:forEach items="${event_list}" var="dto">
     <section> 
     <a href="event/eventView?num=${dto.num}">
     <img class="eventList_image" src="${pageContext.request.contextPath}/resources/board/${dto.fileName}"></a>
     <p> <a href="event/eventView?num=${dto.num}"><strong>${dto.title}</strong></a> 
     <br><br>
	  <strong>기간:</strong>&nbsp; ${dto.s_date} &nbsp;~&nbsp; ${dto.e_date} <br>
     </p>
     </section>
  	</c:forEach>
  	
  	
  	</div>
  
  	<div id="qna_contents">
  		
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
			<c:forEach items="${notice_list}" var="dto">
			<ul class="txt">
                <li><a href="notice/noticeView?num=${dto.num}">${dto.title}</a><span class="day">${dto.reg_date}</span></li>
            </ul>
			</c:forEach>
				<a href="../notice/noticeList" class="more">공지/뉴스 더보기</a>
  	</div>
  
  
  </div>     
  </div> 	
        	
			<!-- 내용 끝 -->
			
			</div>
			<!-- ///////////////////////////////// -->
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	</div>










</body>
</html>