<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%-- 	<ul>
		<c:forEach items="${movieList }" var="movieDTO">
			<li style="float: none;">${movieDTO.movie_name }</li>
			<c:forEach items="${movieDTO.sList}" var="sList" varStatus="count">
				<c:forEach items="${sList }" var="sc" varStatus="count">
					<c:if test="${count.first }">
					${sc.screen_num }관
					</c:if>
				<a href="#" class="schedules" id="${movieDTO.movie_num }" onclick="return false;" title="${sc.schedule_num }">${sc.in_time }</a>
					<c:if test="${count.last }">
					<br>
					</c:if>
				</c:forEach>
			</c:forEach>
		</c:forEach>
	</ul> --%>
	
<ul>
	<c:forEach items="${movieList }" var="movieDTO">
  		<li>
      		<div class="col-times">
          		<div class="info-movie">
              		<span class="ico-grade grade-12">12세 이상</span> 
              		<a href="#"><strong>${movieDTO.movie_name }</strong></a>
              		<i>드라마,&nbsp;환타지</i>/ <i>139분</i>/ <i>2017.12.20개봉</i>
          		</div>
          		<c:forEach items="${movieDTO.sList}" var="sList" varStatus="count">
        			<div class="type-hall">
           			<c:forEach items="${sList }" var="sc" varStatus="count">	
                		<c:if test="${count.first }">
                			<div class="info-hall">
                      		<ul>
                             	<li>${sc.screen_num }관 6층</li>
                             	<li>총124석</li>
                         	</ul>
                      		</div>
                     	</c:if>
                    	<div class="info-timetable" style="float: left;">
                     		<ul>
                        		<li>
                        			<a href="#" class="schedules" id="${movieDTO.movie_num }" onclick="return false;" title="${sc.schedule_num }">
	                         			<em>${sc.in_time }</em>
	                         			<span class="txt-lightblue">
	                         				<span class="hidden">잔여좌석</span>113석
	                         			</span>
                        			</a>
				          		</li>
                        	</ul>
                    	</div>
                	</c:forEach>
            		</div>
            	</c:forEach>
      		</div>
 		 </li>
 	</c:forEach>
</ul>