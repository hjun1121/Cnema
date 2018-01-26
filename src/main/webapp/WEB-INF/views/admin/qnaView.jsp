<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/headerBar.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/member/myPageView.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/myPage/myInfoCheck.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Q&A 글보기</title>

<style type="text/css">
.list_container{
	position: relative;
    width: 800px;
	float: right;
	display: inline-block;
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
}

  #otoTitle{
float: left;
width:100%;
    height: 34px;
    background-image: none;
    color: rgb(34, 34, 34);
    font-family: NanumBarunGothicBold, "맑은 고딕", 돋움, Dotum, sans-serif;
    font-size: 17px;
    line-height: 34px;
    text-align: left;
    margin: 0px;
}
#replyTit{
	 font-size: 15px;
	 font-weight: bold;
}

#replyWriteForm{
width: 80%;
height: 50px;

}
#replyWrite{
	width:18%;
	height:55px;
}
</style>
</head>
<body>
	<div id="cgvwrap">
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/header.jsp"></c:import>

			<!-- //////////////////////////////// -->
			
			<div id="contaniner" class="bg-bricks main bg-bricks">
        	<!-- 상단바 시작 -->
        	<div class="linemap-wrap">
           		<div class="sect-linemap">
                	<div class="sect-bcrumb">
                    	<ul>
                        	<li>
                        		<a href="#"><img alt="home" src="${pageContext.request.contextPath }/resources/images/common/btn/btn_home.png"></a>
                        	</li>
                            <li>
                                <a href="#">회원정보</a>
                            </li>
                            <li>
                                <a href="#">관리자</a>
                            </li>
                            <li class="last">
                            	QnaList
                            </li>
                    	</ul>
                	</div>
            	</div>
        	</div>
        	<!-- 상단바 끝 -->
        	
        	
        	<!-- 내용 시작 -->
        	
        	
        	<div id="contents" class="">
            
            <!-- Contents Start -->

			<div class="sect-common">
				<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/info.jsp"></c:import>
			</div>

			<div class="cols-content" id="menu">
    			<div class="col-aside">
					<div class="skipnaiv">
						<a href="#" id="skipMycgvMenu">MYCGV 서브메뉴 건너띄기</a><!-- /////////// -->
					</div>
	    			<h2>MY CGV 서브메뉴</h2>
	    			<div class="snb">
	       			<ul>
	            	<li>
	            		<a href="../myPage/myPageView" title="현재 선택">MY CNEMA HOME <i></i></a>
	            	</li>
	            	<li>
	            		<a href="#">나의 예매내역 <i></i></a>
	            			<ul>                      
		                        <li><a href="../myPage/movieHistory">내가 본 영화</a></li>
			                    <li><a href="../myPage/wishList">위시 리스트</a></li>
	                        </ul>
                	</li>
	            	<li>
	                	<a href="#">나의 쿠폰 관리 <i></i></a>
	                	<ul>                      
	                        <li><a href="../myPage/couponHistory">나의 쿠폰</a></li>
	                	</ul>
	           		</li>
	            	<li>
                    	<a href="#">나의 포인트 관리 <i></i></a>
	                	<ul>
                        	<li><a href="../myPage/pointHistory">포인트 적립/사용내역</a></li>
	                	</ul>
	            	</li>

	            	<li>
                    	<a href="#">회원정보<i></i></a>
	                	<ul>
                        	<li><a href="../myPage/myInfoCheck">회원정보수정</a></li>
	                    	<!-- <li><a href="#">프로필관리</a></li> -->
	                    	<li><a href="../myPage/withdrawalCheck">회원탈퇴</a></li>
	                	</ul>
	            	</li>
		            <li>
	                    <a href="../admin/myQnaList">나의 문의내역 <i></i></a>
		                <ul>
		                    <li class="on"><a href="../admin/myQnaList">1:1문의</a></li>
		                </ul>
		            </li>
		            <c:if test="${!empty member and member.type eq 20 }">
		            <li >
	                    <a href="#">관리자 <i></i></a>
		                <ul>
		                    <li><a href="../admin/movieList">무비 리스트</a></li>
		                    <li><a href="../admin/theaterList">극장 리스트</a></li>
		                    <li><a href="../admin/screenList">상영관 리스트</a></li>
		                    <li><a href="../admin/scheduleList">상영 리스트</a></li>
		                    <li><a href="../admin/couponList">쿠폰 리스트</a></li>
		                    <li><a href="../admin/memberList?group_num=-1">회원 리스트</a></li>
		                </ul>
		            </li>
		            
		            </c:if>
	        		</ul>
	    			</div>
    			</div>
		
	<div class="list_container">
		<span id="otoTitle">1:1 문의 글보기</span><br>
	
				<ul class="top_title_faq">
					<li class="title">[${view.type}]${view.title}</li>
					<li class="stit_area">
						<span>등록일<em class="regist_day">${view.reg_date}</em></span>
						<span class="check_tit_area">지점<em class="check_num">${view.area}:${view.location }</em></span>
					</li>
				</ul>
				<div class="view_area">
					 ${view.contents}
				<!-- <a id="btn1" href="./noticeList">목록으로</a> -->
				
			</div>
			<br><br><br>
		
		<c:if test="${view.reply !=null }">
		<div class="reply-contents">
		<h3 id="replyTit">답변 내용</h3><hr>
        <ul class="writerinfo">
            <li>${view.reply_id }</li>
            <li class="day-writerinfo">${view.reply_date }</li>
        </ul>
         <p>${view.reply }</p>
    </div>
		</c:if>
		<br><br><br>
	<!--  답글 표시 하기 (관리자일때만 보이게 하기) -->
	<c:if test="${member.type == 20 }">
	<div id="reply">
	<form action="qnaUpdate" id="frm" method="post">
		<h3 id="replyTit">답변 달기</h3>
		<hr>
		<input type="hidden" name="num" value="${view.num}">
		<input type="hidden" name="reply_id" value="${member.id}">
		<input type="hidden" name="email" value="${view.email }">
		<textarea name="reply" id="replyWriteForm" rows="5" cols="20"></textarea>
		<c:if test="${view.reply==null}">
		<button type="submit" id="replyWrite">답변 등록</button>
		</c:if>
		<c:if test="${view.reply != null}">
		<button type="submit" id="replyWrite">답변 수정</button>
		</c:if>
		</form>
	</div>
	</c:if>
		<br>	
				<a href="../admin/myQnaList" class="round inblack" id="btn_list"><span>목록으로</span></a>
				<a id="btn3" href="../qna.qnaDelete?num=${view.num}">삭제하기</a>
	
		
		</div>
		
		
		
		
		
		
		
		
			</div>
			</div>
			</div>
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	</div>
</body>
</html>