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
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/member/idPwFind.css">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4ae9a40e6a14e760a32a8f15af0199e0"></script>
<script type="text/javascript">
	$(function(){
		
		$(".areas").each(function(){
			var area = $("#areaName").val();
			if($(this).val() == area){
				$(this).attr("selected",true);
			}
		});
		
		$(".locations").each(function(){
			var location = $("#theater_num").val();
			if($(this).val() == location){
				$(this).attr("selected",true);
			}
		});		
		
		$("#area").change(function(){
			var area = $(this).val();
			
			$("#areaName").val(area);
			$("#theater_num").val("");
			
			$.ajax({
				url:"../ajax/adminLocationList",
				type:"POST",
				data:{		
					area:area,
					theater_num:0
				},
				success:function(data){
					$("#location").html(data);
					$("#location").focus();
				}
			});
		});
		
		$("#location").change(function(){
			var area = $("#area").val();
			var location = $("#location").val();
			$("#areaName").val(area);
			$("#theater_num").val(location);
			
			document.frm.submit();
		});

		
	});
</script>
<script type="text/javascript">
	$(function(){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new daum.maps.LatLng(${x_position }, ${y_position}), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		var markerPosition  = new daum.maps.LatLng(${x_position }, ${y_position}); 
		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
		 position: markerPosition
		});
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng; 
		    // 마커 위치를 클릭한 위치로 옮깁니다
		    marker.setPosition(latlng);
		    var resultDiv = document.getElementById('clickLatlng'); 
		});
		
		$("#load").click(function(){
			var theater_num = $("#theater_num").val();
			
			var location = $("#theaterName").val();
			var x = $("#x_position").val();
			var y = $("#y_position").val();
			if(theater_num==""){
				alert("극장을 선택해주세요");
				$("#location").focus();
			}else{
				window.open("http://map.daum.net/link/to/CGV"+location+","+x+","+y);
			}
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
                        		<a href="#"><img alt="home" src="${pageContext.request.contextPath }/resources/images/common/btn/btn_home.png"></a>
                        	</li>
                            <li>
                                <a href="#">찾아오시는 길</a>
                            </li>
                            <li class="last">
                            	지도
                            </li>
                    	</ul>
                	</div>
            	</div>
        	</div>
        	<!-- 상단바 끝 -->
        	
        	<!-- 내용 시작 -->
        	<div style="height: 500px; width: 750px; margin-top: 30px; margin-left: 300px;">
				<select id="area">
					<option class="areas">서울</option>	
					<c:forEach items="${theaterList }" var="theaterDTO">
						<option class="areas">${theaterDTO.area }</option>
					</c:forEach>			
				</select>
							
				<select id="location">
					<c:forEach items="${locationList }" var="location">
						<option value="${location.theater_num }" class="locations" >${location.location }</option>
					</c:forEach>
				</select>
			 <input type="button" id="load" value="길찾기">

			<div id="map" style="width:750px;height:350px; margin-top: 10px;"></div>
        	</div>
			
			<div>
				<form action="../common/map" name="frm" style="display: none;" >
					<input type="text" id="areaName" name="area" value="${area }">
					<input type="text" id="theater_num" name="theater_num" value="${theater_num }">
					<input type="text" id="theaterName" value="${theaterName }">
					<input type="text" id="x_position" name="x_position" value="${x_position }">
					<input type="text" id="y_position" name="y_position" value="${y_position }">
				</form>
			
			</div>
			<!-- 내용 끝 -->
			
			</div>
			<!-- ///////////////////////////////// -->
		<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	</div>
</body>
</html>