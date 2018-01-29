<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/headerBar.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/boardMain/boardTab.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/paging.css">
<title>Insert title here</title>
<style type="text/css">


.box-title{
	text-align: center;
	margin:0 auto;
display: inline-block;
}
.box-image{
	display: inline-block;
}

.firstList ul {
  
    
    border-color: #b8b6aa;

    list-style: none;
}
.firstList li{
    height: 91px;
    border-top: 1px solid #d6d4ca;
}
.firstList .box-image {
    margin-right: 20px;
    margin-top: 4px;
}

.box-image a {
    display: block;
        color: inherit;
    text-decoration: none;
}


.firstList li em {
    display: inline-block;
    font-family: 'NanumBarunGothicBold';
}

.submenu{
	width:100%;
	height: 40px;

}
#btn1{
	
    padding: 3px 9px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
    margin: 0 auto;
    -webkit-transition-duration: 0.4s; 
    transition-duration: 0.4s;
    cursor: pointer;
    border-radius: 5px;
    color: #e71a0f; 
    border: 2px solid #e71a0f;
    margin-top:20px;
}
#btn1:hover {
    background-color: #e71a0f;
    color: white;
}
#ingEvent , #endEvent {
	
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

#endEvent{
	  display: inline-block;
    background-color: #5b5b58; 
    color: #ffffff; 

    border: 2px solid #5b5b58;
    margin-left: 10px;

}

.submenu .tit{
	color: #222;
    font-weight: bold;
    display:inline-block;
    font-size: 26px;
    text-align: left;
    vertical-align: middle;
}
</style>
<script type="text/javascript">
	
$(function(){
	
	
	
	$("#endEvent").click(function(){
		
		$.ajax({
			url:"../ajax/endList",
			type:"POST",
			data:{
			 sel: false
			},
			success:function(data){
				$(".firstList").hide();
				$("#eventList").html(data);
				},
			error : function(){
				
			}
		});
	});
	
$("#ingEvent").click(function(){
		
		/* $.ajax({
			url:"../ajax/endList",
			type:"POST",
			data:{
				sel:true
			},
			success:function(data){
				$("#eventList").html(data);
				},
			error : function(){
				
			}
		}); */
		
		location.href="../event/eventList";
	});
	
	
	
});
	
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
                                <a href="#">이벤트</a>
                            </li>
                            <li class="last">
                            	목록
                            </li>
                    	</ul>
                	</div>
            	</div>
        	</div>
        	<!-- 상단바 끝 -->
        	
	
	
	<div class="board_container">
	<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/boardTab/eventTab.jsp"></c:import>

 
 
	
	<div class="board_contents">

    <div class="submenu">
    	<span class="tit">이벤트</span>
    	<button id="endEvent">종료된 이벤트</button>
   		 <button id="ingEvent">진행중인 이벤트</button>
    </div>
   
    <br>
   
   

	<div id="eventList"></div> 
	
	<div class="firstList">
	<ul>
			<c:forEach items="${list}" var="dto">
			<li>
			<!-- 리스트의 이미지 -->
           	<div class="box-image">
        	<a href="eventView?num=${dto.num}">
            <span>
             <img src="${pageContext.request.contextPath}/resources/board/${dto.fileName}"width="100px" height="83px">
            </span>
            </a>
            </div>
            <!--리스트의 제목  -->
             <div class="box-title">
                 <a href="eventView?num=${dto.num}">
                <strong>${dto.title }</strong>
                </a>
                   <em class="date">
                            <span>기간: </span>
                            ${dto.s_date} ~ ${dto.e_date}
                        </em>
                    </div>
                </li>
		
			</c:forEach>
		</ul>
	
	   	        <div class="paging">
					<ul id="paging_point">
						<c:if test="${pager.curBlock gt 1}">
							<li class="paging-side">
								<a href="#"><button style="line-height: 26px;" class="btn-paging prev" type="button">이전</button></a>
							</li>						
						</c:if>
						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							<li style="text-decoration: none; " class=" on">
								<a href="#" title="${i}페이지 선택">${i}</a>
							</li>
						</c:forEach>
						<c:if test="${pager.curBlock lt pager.totalBlock}">
							<li class="paging-side">
								<a href="#"><button style="line-height: 26px;" class="btn-paging next" type="button">다음</button></a>
							</li>
						</c:if>
					</ul>
				</div>
</div>	
	<c:if test="${not empty member and member.type eq 20  }">
	<div id="btn1"><a href="./eventWrite">글쓰기</a></div>
	</c:if>
</div>			
			</div><!--게시판 내용  -->
	
	
	</div>
	
	
	<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	
</div>
</body>
</html>