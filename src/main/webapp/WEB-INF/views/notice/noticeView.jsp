<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/headerBar.css">

<title>Insert title here</title>
<style type="text/css">
.board_container{
	width: 1200px;
	height:1000px;
	margin:0 auto;
	margin-top:40px;
 
}
.noticeViewPage{

display: inline-block;
	width:800px;
	height:600px;
	margin-left:50px;
}

#btn3{
    padding: 7px 10px;
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
	
    padding: 7px 10px;
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
}
/* #btn1{
	
    background: #222222;
    border: 2px solid #222222;
    color: #ffffff;
    line-height: 21px;
    text-align: center;
    vertical-align: middle;
    display: inline-block;
    position: relative;
    cursor: pointer;
    margin: 0;
    padding: 0;
    font-size: 12px;
    overflow: visible;
   	border: 1px solid #5b5b58;
} */
.round.inblack{ background:#222222; border:2px solid #222222; color:#ffffff; line-height:21px;  border-radius: 3px; float:right;}
.round.inblack:before{ left:-2px; top:-2px; background-position:-10px -10px; z-index:1;}
.round.inblack:after{ left:-2px; bottom:-2px; background-position:-10px -15px;}
.round.inblack > *{ border:1px solid #5b5b58;}
.round.inblack > *:before{ right:-3px; top:-3px; background-position:-15px -10px;}
.round.inblack > *:after{ right:-3px; bottom:-3px; background-position:-15px -15px;}
.round , .round > *{ display:inline-block; position:relative;  }
.round {line-height:23px; font-family:'NanumBarunGothicBold'; text-align:center; vertical-align:middle;}
.round > *{ box-sizing:border-box; -moz-box-sizing:border-box; width:100%; /* height:100%; */ padding:0 5px;} /* 20140620 Del padding-top:2px !important; */
*+html .round{ white-space:nowrap; }
*+html .round > *{  border:none !important; padding:0; cursor:pointer; }

.board_view_area{

    margin-top: 19px;


}

.top_title_faq {
    overflow: hidden;
    padding: 11px;
    border-top: solid 1px #b8b6aa;
    background-color: #edebe1;
 }
ul {
    list-style: none;
}
.top_title_faq .title {
    float: left;
    font-size: 12px;
    font-weight: bold;
    display: inline-block;
    overflow: hidden;
    width: 520px;
    white-space: nowrap;
    text-overflow: ellipsis;
}

.title {
    
    color: #333333;
    
}
.top_title_faq .stit_area {
    float: right;
    font-size: 11px;
    line-height: 16px;
}
.top_title_faq .stit_area .regist_day, .check_num{
    margin-left: 9px;
    font-size: 12px;
    font-family: 'Verdana';
    color: #222;
}
.top_title_faq .stit_area em {
    line-height: 16px;
    vertical-align: middle;
}
em {
    font-style: normal;
}
.top_title_faq .stit_area .check_tit_area {
    margin-left: 30px;
}

.view_area {
    padding: 35px 13px;
    border-bottom: solid 1px #b8b6aa;
    line-height: 24px;
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
                            	글보기
                            </li>
                    	</ul>
                	</div>
            	</div>
        	</div>
        	<!-- 상단바 끝 -->
        	
	
	
	<div class="board_container">
	<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/board/board_tab.jsp"></c:import>

<div class="noticeViewPage">
			<div class="customer_top">
				<h2>공지/뉴스</h2>
				<p>CGV의 주요한 이슈 및 여러가지 소식들을 확인하실 수 있습니다.</p>
			</div>
			<div class="board_view_area">
				<ul class="top_title_faq">
					<li class="title">${view.title}</li>
					<li class="stit_area">
						<span>등록일<em class="regist_day">${view.reg_date}</em></span>
						<span class="check_tit_area">조회수<em class="check_num">${view.hit}</em></span>
					</li>
				</ul>
				<div class="view_area">
					 ${view.contents}
				<!-- <a id="btn1" href="./noticeList">목록으로</a> -->
				
			</div>
			<br>
				<a href="./noticeList" class="round inblack" id="btn_list"><span>목록으로</span></a>
				<a id="btn2" href="./noticeUpdate?num=${view.num}">수정하기</a>
				<a id="btn3" href="./noticeDelete?num=${view.num}">삭제하기</a>
		</div>
	</div>
	
			
			</div><!--게시판 내용  -->
	
	
	</div>
	
	
	<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	
</div>
</body>
</html>