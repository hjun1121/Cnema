<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.box-title{
	text-align: center;
	margin:0 auto;
display: inline-block;
}
.box-image{
	display: inline-block;
}

.endList ul {
 
    border-color: #b8b6aa;

    list-style: none;
}
 .endList li{
    height: 91px;
    border-top: 1px solid #d6d4ca;
}
 .box-image {
    margin-right: 20px;
    margin-top: 4px;
}

.box-image a {
    display: block;
        color: inherit;
    text-decoration: none;
}

 

.endList li em {
    display: inline-block;
    font-family: 'NanumBarunGothicBold';
}


</style>


<div class="endList">
	<ul>
			<c:forEach items="${list}" var="dto">
			<li>
			<!-- 리스트의 이미지 -->
           	<div class="box-image">
        	<a href="../event/eventView?num=${dto.num}">
            <span>
             <img src="${pageContext.request.contextPath}/resources/board/${dto.fileName}"width="100px" height="83px">
            </span>
            </a>
            </div>
            <!--리스트의 제목  -->
             <div class="box-title">
                 <a href="../event/eventView?num=${dto.num}">
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
	
	</div>