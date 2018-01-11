<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
  
   <c:if test="${type==0 }">
  	다음기회에 이용해 주세요.
  </c:if>
  <c:if test="${type==1 }">
  	축하드립니다 !! 이벤트 당첨 되셨습니다.
  </c:if>
