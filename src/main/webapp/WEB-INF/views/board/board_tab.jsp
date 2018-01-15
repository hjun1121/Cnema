<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.board_container{
	width: 1200px;
	height:1000px;
	margin:0 auto;
	margin-top:40px;
 
}

#board_tab{
	background-color: gray;
	width:200px;
	height: 500px;
	display:inline-block;
	float: left;

}
#board_tab ul {
	margin:0 auto;
    list-style-type: none;
    width: 180px;
    background-color: #f1f1f1;
}

#board_tab li a {
    display: block;
    color: #000;
    padding: 8px 16px;
    text-decoration: none;
}

#board_tab li a.active {
    background-color: #e71a0f;
    color: white;
}

#board_tab li a:hover:not(.active) {
    background-color: #e71a0f;
    color: white;
}

</style>
</head>
<body>
  <div id="board_tab">
  		<ul>
            <li class=""><a href="#">고객센터 메인<i></i></a></li>
            <li class=""><a href="../notice/noticeList">공지/뉴스<i></i></a></li>
            <li class=""><a href="../event/eventList">이벤트<i></i></a></li>
            <li class=""><a href="../qna/qnaWrite">이메일 문의<i></i></a></li>
        </ul>
  </div>
</body>
</html>