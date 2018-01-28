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
              		<span class="ico-grade grade-12">${movieDTO.age_limit }</span> 
              		<a href="#"><strong>${movieDTO.movie_name }</strong></a>
              		<i>${movieDTO.type }</i>/ <i>${movieDTO.run_time }분</i>/ <i>${movieDTO.open_date }개봉</i>
          		</div>
          		<c:forEach items="${movieDTO.sList}" var="sList" varStatus="count">
        			<div class="type-hall">
           			<c:forEach items="${sList }" var="sc" varStatus="count">	
                		<c:if test="${count.first }">
                			<div class="info-hall">
                      		<ul>
                             	<li>${sc.screenDTO.room_num }관 ${sc.screenDTO.floor }층</li>
			                    <li>총${sc.screenDTO.x_num*sc.screenDTO.y_num }석</li>
                         	</ul>
                      		</div>
                     	</c:if>
                    	<div class="info-timetable" style="float: left;">
                     		<ul>
                        		<li>
                        			<a href="#" class="schedules" id="${movieDTO.movie_num }" onclick="return false;" title="${sc.schedule_num }">
	                         			<em>${sc.in_time }</em>
	                         			<span class="txt-lightblue">
	                         				<span class="hidden">잔여좌석</span>${sc.screenDTO.x_num*sc.screenDTO.y_num-sc.seatcheck }석
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