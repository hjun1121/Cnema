<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/headerBar.css">
<title>게시판</title>
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
        	
        	
	<h2>박세나꺼</h2>
	<div class="totalBoardContens">
	<!--탭부분  -->
	<div class="snb">
        <ul>
            <li class="on"><a href="#">고객센터 메인<i></i></a></li>
            <li class=""><a href="../notice/noticeList">공지/뉴스<i></i></a></li>
            <li class=""><a href="../event/eventList">이벤트<i></i></a></li>
            <li class=""><a href="../qna/qnaWrite">이메일 문의<i></i></a></li>
        </ul>
    </div>
	
	<div class="total-board">
	<!--이벤트  -->
	<div class="event_Contents">
	 <div class="tit-heading-wrap tit-evt">
       <h3>EVENT</h3>

      <div class="submenu">
         <a href="../event/eventList" class="round red on"><i>진행중인 이벤트</i></a>
     </div>
	</div>
	<div class="sect-eventlist">
    <ul>
                <li>
                    <div class="box-image">
                        <a href="/culture-event/event/detail-view.aspx?idx=17384">
                            <span class="thumb-image">
                                <img src="http://img.cgv.co.kr/Event/Event/2018/0109/15154764404040.jpg" alt="스페셜이벤트 파코니게임 4탄! 주시팡" onerror="errorImage(this)">
                            </span>
                        </a>
                    </div>
                    <div class="box-contents">
                        <a href="/culture-event/event/detail-view.aspx?idx=17384">
                            <em class="txt-lightblue">스페셜이벤트</em>
                            <p>파코니게임 4탄! 주시팡</p>
                        </a>
                        <em class="date">
                            <span>기간: </span>
                            2018.01.09 ~ 2018.01.28
                        </em>
                    </div>
                </li>
            
                <li>
                    <div class="box-image">
                        <a href="/culture-event/event/detail-view.aspx?idx=17337">
                            <span class="thumb-image">
                                <img src="http://img.cgv.co.kr/Event/Event/2017/1229/15145316165870.jpg" alt="아트하우스 아트하우스 이다혜의 에세이클래스" onerror="errorImage(this)">
                            </span>
                        </a>
                    </div>
                    <div class="box-contents">
                        <a href="/culture-event/event/detail-view.aspx?idx=17337">
                            <em class="txt-lightblue">아트하우스</em>
                            <p>아트하우스 이다혜의 에세이클래스</p>
                        </a>
                        <em class="date">
                            <span>기간: </span>
                            2017.12.28 ~ 2018.02.05
                        </em>
                    </div>
                </li>
            
                <li>
                    <div class="box-image">
                        <a href="/culture-event/event/detail-view.aspx?idx=17334">
                            <span class="thumb-image">
                                <img src="http://img.cgv.co.kr/Event/Event/2017/1228/15144391218100.jpg" alt="스페셜이벤트 이달의CGV_1월" onerror="errorImage(this)">
                            </span>
                        </a>
                    </div>
                    <div class="box-contents">
                        <a href="/culture-event/event/detail-view.aspx?idx=17334">
                            <em class="txt-lightblue">스페셜이벤트</em>
                            <p>이달의CGV_1월</p>
                        </a>
                        <em class="date">
                            <span>기간: </span>
                            2017.12.28 ~ 2018.01.31
                        </em>
                    </div>
                </li>
    </ul>
</div>
	</div><!--이벤트 보여주기 끝  -->
		<!-- 이메일 문의 폼으로 넘어가기  -->
		<div class="c_box emaile_inquiry" style="cursor:pointer;">
			<strong class="c_tit email_tit">이메일 문의</strong>
			<span class="c_txt">24시간 365일 언제든지 문의해주세요.</span>
			<a class="round red" href="../qna/qnaWrite"><span style="padding:0 20px;">문의하기</span></a>
         </div>
         <!-- 본인 질문한거 보러가기 -->
         <div class="c_box my_advice" style="cursor:pointer;">
			<strong class="c_tit advice_tit">내 상담 내역 확인</strong>
			<span class="c_txt">문의하신 내용을 확인하실 수 있습니다.</span>
			<!-- <a class="round gray" href="../qna/qnaMyList" target="_blank" title="새창열기"><span style="padding:0 20px;">문의내역 조회</span></a> -->
           <form action="../qna/qnaMyList" method="post">
			<input type="hidden" name="id" value="${member.id }">
			<input type="submit" value="QnaList(MEMBER)">	
			</form>
           </div>
	</div>
	<div class="notice_area">
        <a href="../notice/noticeList">
		<span class="tit">공지/뉴스</span>
        </a>
		<ul class="txt">
                    
         <li><a href="/support/news/detail-view.aspx?idx=7163&amp;type=1">[시스템점검] 1월 정기 시스템 안내</a><span class="day">2018.01.05</span></li>
                        
        <li><a href="/support/news/detail-view.aspx?idx=7126&amp;type=2">[극장] &lt; 2018 CGV 캘린더 &gt; 판매 개시일 변경</a><span class="day">2017.11.14</span></li>
                        
         <li><a href="/support/news/detail-view.aspx?idx=7091&amp;type=4">[기타] CGV 개인정보처리방침 개정 공지</a><span class="day">2017.09.28</span></li>
                        
         <li><a href="/support/news/detail-view.aspx?idx=7058&amp;type=4">[기타] CGV 개인정보처리방침 개정 공지</a><span class="day">2017.08.18</span></li>
                        
          <li><a href="/support/news/detail-view.aspx?idx=7049&amp;type=1">[시스템점검] 8월 정기 시스템 안내</a><span class="day">2017.08.08</span></li>
		</ul>
		<a href="../notice/noticeList" class="more">공지/뉴스 더보기</a>
		
	</div>
	
	
	
	</div><!--전체 감싸는 div  -->
	
	
	<h4>NOTICE</h4>
	<a href="../notice/noticeList">Notice List</a>
	<hr>
	<br>
	<h4>QNA</h4>
	<!--member  --> 
	<form action="../qna/qnaMyList" method="post">
	<input type="hidden" name="id" value="${member.id }">
	<input type="submit" value="QnaList(MEMBER)">	
	</form>
	<!-- Admin -->
	<a href="../qna/qnaList">Qna(Admin)</a>
	
	<a href="../qna/qnaList">Qna(확인용)</a>
	
	<a href="../qna/qnaWrite">문의하기</a>
	
	
	<hr>
	<h4>EVENT</h4>
	<a href="../event/eventList">Event List</a>
	
	<hr>
	<br>
	<a href="../">home</a>
        	
        	
			<!-- 내용 끝 -->
			
			</div>
			<!-- ///////////////////////////////// -->
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	</div>










</body>
</html>