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
	<div class="eventTitle">
    <h3>EVENT</h3>
    <hr>
    <div class="submenu">
    <button id="ingEvent">진행중인 이벤트</button>
    <button id="endEvent">종료된 이벤트</button>
    
    </div>
</div>
	<div>
		<ul>
			<c:forEach items="${list}" var="dto">
			<li>
			<!-- 리스트의 이미지 -->
           	<div class="box-image">
        	<a href="eventView?num=${dto.num}">
            <span>
             <img src="${pageContext.request.contextPath}/resources/board/${dto.fileName}">
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
	
	
	</div>

	
	
	<div>
		<c:if test="${pager.curBlock gt 1}">
			<span class="list" title="${pager.startNum-1}">[이전]</span>
		</c:if>
		<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			<span class="list" title="${i}">${i}</span>
		</c:forEach>
		<c:if test="${pager.curBlock lt pager.totalBlock}">
			<span class="list" title="${pager.lastNum+1}">[다음]</span>
		</c:if>
	</div>
	
	<a href="./eventWrite">글쓰기</a>
</body>
</html>