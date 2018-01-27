<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="../resources/SE2/js/HuskyEZCreator.js"></script>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/header.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/common.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/footer.css">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/resources/css/temp/headerBar.css">
<title>Insert title here</title>


<script type="text/javascript">
	$(function(){
		//SmartEditor start
		//전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        //textarea ID
        elPlaceHolder: "contents",
        sSkinURI: "../resources/SE2/SmartEditor2Skin.html", 
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : false,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : false, 
        }
    });
     
    //전송버튼 클릭이벤트
    $("#savebutton").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
         
        // 이부분에 에디터 validation 검증
         
        //폼 submit
        $("#frm").submit();
    })
		
		//CKEDITOR.replace( 'contents' );
		
	
			 
		 //쌤 방식
	/* 	var index = 0;
		var count = 0;
		$("#add").click(function(){
			if(count < 5){
				var s = '<div id="d'+index+'">';
				s = s+'<input type="file" name="f1"><span class="del" title="d'+index+'">X</span></div>';
				$("#files").append(s);
				count++;
				index++;
			}else{
				alert("fail");
			}
		})
		
		$("#files").on("click",".del",function(){
			var id = $(this).attr("title");
			$("#"+id).remove();
			index--;
		}); */
		
	});
</script>
<style type="text/css">

._4jy0{border:1px solid;
border-radius:2px;
box-sizing:content-box;
font-size:12px;
-webkit-font-smoothing:antialiased;
font-weight:bold;justify-content:center;
padding:0 8px;position:relative;
text-align:center;text-shadow:none;
vertical-align:middle}
#facebook .sf ._4jy0
{font-family:system-ui, -apple-system, BlinkMacSystemFont, '.SFNSText-Regular', sans-serif}
._4jy0:before{content:'';display:inline-block;height:20px;vertical-align:middle}
html ._4jy0:focus{box-shadow:0 0 1px 2px rgba(88, 144, 255, .75), 0 1px 1px rgba(0, 0, 0, .15);outline:none}
._19_u ._4jy0:focus,._4jy0._5f0v:focus{box-shadow:none}
._4jy0{transition:200ms cubic-bezier(.08,.52,.52,1) background-color, 200ms cubic-bezier(.08,.52,.52,1) box-shadow, 200ms cubic-bezier(.08,.52,.52,1) transform}
._4jy0:active{transition:none}
.mac ._4jy0:not(._42fr):active{box-shadow:none;transform:scale(.98)}
._4jy0 .img{bottom:1px;position:relative;vertical-align:middle}
form.async_saving ._4jy0 .img,a.async_saving._4jy0 .img,._4jy0._42fr .img{opacity:.5}
._517h,._59pe:focus,._59pe:hover{background-color:#f6f7f9;border-color:#ced0d4;color:#4b4f56}
._64lx ._517h,._64lx ._59pe:focus,._64lx ._59pe:hover{background-color:#eff1f3;border-color:#bec2c9}
._517h:hover{background-color:#e9ebee}._517h:active,._517h._42fs{background-color:#dddfe2;border-color:#bec2c9}
form.async_saving ._517h,a.async_saving._517h,._517h._42fr{background-color:#f6f7f9;border-color:#dddfe2;color:#bec2c9}
._517h._42fs{color:#4080ff}._4jy1,._4jy2{color:#fff}._4jy1{background-color:#4267b2;border-color:#4267b2}
._4jy1:hover{background-color:#365899;border-color:#365899}._4jy1:active,._4jy1._42fs{background-color:#29487d;border-color:#29487d}
form.async_saving ._4jy1,a.async_saving._4jy1,._4jy1._42fr{background-color:#9cb4d8;border-color:#9cb4d8}
._4jy2{background-color:#42b72a;border-color:#42b72a}._4jy2:hover{background-color:#36a420;border-color:#36a420}
._4jy2:active,._4jy2._42fs{background-color:#2b9217;border-color:#2b9217}
form.async_saving ._4jy2,a.async_saving._4jy2,._4jy2._42fr{background-color:#ace0a2;border-color:#ace0a2}
._59pe,form.async_saving ._59pe,a.async_saving._59pe,._59pe._42fr{background:none;border-color:transparent}
._517i,._517i._42fr:active,._517i._42fr._42fs{height:18px;line-height:18px}
._4jy3,._4jy3._42fr:active,._4jy3._42fr._42fs{line-height:22px}
._4jy4,._4jy4._42fr:active,._4jy4._42fr._42fs{line-height:26px;padding:0 10px}
._4jy5,._4jy5._42fr:active,._4jy5._42fr._42fs{line-height:34px;padding:0 16px}
._4jy6,._4jy6._42fr:active,._4jy6._42fr._42fs{line-height:42px;padding:0 24px}
._51xa ._4jy0 {float:right; border-radius:0;display:inline-block;margin:0 !important;margin-left:-1px !important;position:relative;z-index:1}
._51xa>._4jy0:first-child,._51xa>:first-child ._4jy0{border-radius:2px 0 0 2px;margin-left:0 !important}
._51xa>._4jy0:last-child,._51xa>:last-child ._4jy0{border-radius:0 2px 2px 0}
._51xa>._4jy0:only-child,._51xa>:only-child ._4jy0{border-radius:2px}
._51xa ._4jy0._42fr{z-index:0}._51xa ._4jy0._4jy1,._51xa ._4jy0._4jy2{z-index:2}
._51xa ._4jy0:focus{z-index:3}
._51xa ._4jy1+.uiPopover>._4jy1:not(:focus):after{background-color:#f6f7f9;bottom:-1px;content:'';display:block;left:-1px;position:absolute;top:-1px;width:1px}
._4jy0._52nf{cursor:default}._9c6._9c6{background-clip:padding-box;border-color:rgba(0, 0, 0, .4)}
._3y89 ._4jy0{border-bottom-width:0;border-top-width:0}
._3y89>._4jy0:first-child,._3y89>:first-child ._4jy0{border-left-width:0;border-radius:1px 0 0 1px}
._3y89>._4jy0:last-child,._3y89>:last-child ._4jy0{border-radius:0 1px 1px 0;border-right-width:0}

#frm{
width:500px;
height: 259px;
margin :0 auto;
}
.board_contents,#contents{
width:400px;
height: 250px;
	
}



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
                                <a href="#">커뮤니티</a>
                            </li>
                            <li>
                                <a href="#">페이지</a>
                            </li>
                            <li class="last">
                            	글쓰기
                            </li>
                    	</ul>
                	</div>
            	</div>
        	</div>
        	<!-- 상단바 끝 -->
        	
	
	
	<div class="board_contents">
	<div id="writeTab"> </div>
	<form action="../community/pageContentsWrite"  method="post" id="frm">
		<input type="hidden" id="page_num"  name="page_num" value="${page_num}">
		<textarea  name ="contents" id="contents" rows="10" cols="30" style="width: 400px;" ></textarea>
	
	<div class="_51xa">
	<button class="_1mf7 _4jy0 _4jy3 _4jy1 _51sy selected _42ft" id="savebutton" data-testid="react-composer-post-button" type="submit" value="1">
	<span class="">게시</span>
	</button>
	</div>

	</form>
	
	</div>
	
	
	</div>
	
	
	<c:import url="${pageScope.pageContext.request.contextPath }/WEB-INF/views/temp/footer.jsp"></c:import>
	</div>
</body>
</html>