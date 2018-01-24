<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/myPage/movieReview.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>평점 작성</title>
<script type="text/javascript">
$(function(){
	var good = $("#good").val();
	var bad = $("#bad").val();
	$("#good").click(function(){
		$("#review").val(good);
	});
	$("#bad").click(function(){
		$("#review").val(bad);
	});
});
</script>
</head>
<body>

<div class="layer-contents on-shadow" style="width:710px;">
   <div class="popup-general">
       <div class="popwrap">
       		<h1>평점작성</h1>     
            <div class="pop-contents write-mygrade">
            	<div class="mygrade-cont">
            		<div class="movietit">
            			<strong id="pointTitle">${movieDTO.movie_name }</strong>
                    </div>
                    
                    <div class="likeornot">
                    	<div class="writerinfo">
                    		<div class="box-image">
                          		<span class="thumb-image">
                          	    	<img src="#" alt="사용자 프로필">
                          	        	<span class="profile-mask"></span>
                          	     </span>         
                          	</div>         
                          	<span class="writer-name"></span>
                         </div>         
                        <div class="likebox t1" id="EggSelect">
        					<div class="likebox-inner">          
        						<label for="likeornot1-1">           
        							<input type="button" id="good" value="좋았어요~^^">         
                   					<span class="txt" style="font-size: 12px;">좋았어요~^^</span>
                             	</label>
                            </div>       
                        </div>        
                        <div class="likebox t2">         
                              <div class="likebox-inner">
                              	<label for="likeornot1-2">
                                	<input type="button" id="bad" value="흠~좀 별로였어요;;;">           
                                    <span class="txt" style="font-size: 12px;">흠~좀 별로였어요;;;</span>
                                </label>         
                              </div>        
                        </div>       
                        </div>
                        <form action="movieReview" name="rFrm" method="POST">
							<input type="hidden" name="movie_num" value="${movieDTO.movie_num }">
                       			<div class="textbox">       
                        			<textarea id="review" name="review" title="영화평점 입력" cols="70" rows="2" maxlength="140" placeholder="운영원칙에 어긋나는 게시물로 판단되는 글은 제재 조치를 받을 수 있습니다."></textarea>       
                        		</div> 
	                        <div class="footbox">       
	                            <div class="rbox"> 
	                                <input type="submit" class="round red on"  value="작성완료">    
	                            </div>       
	                       	</div>  
                       	</form>      
                    </div>
				</div>     
			</div>
		</div>
	</div>

<%-- <h3>평점주기</h3>
<h2>${movieDTO.movie_name }</h2>
<input type="button" id="good" value="좋았어요~^^">
<input type="button" id="bad" value="흠~좀 별로였어요;;;">

<form action="movieReview" name="rFrm" method="POST">
	<input type="hidden" name="movie_num" value="${movieDTO.movie_num }">
	<textarea name="review" id="review"></textarea>
	<input type="submit" value="작성완료">
</form> --%>
</body>
</html>