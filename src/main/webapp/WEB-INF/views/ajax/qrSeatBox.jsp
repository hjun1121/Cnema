<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<table border="1" style="background-color: yellow;">
	<tr>
		<th>일반</th>
		<td class="adult seat" title="0" style="background-color: white;">0</td>
		<td class="adult seat" title="1">1</td>
		<td class="adult seat" title="2">2</td>
		<td class="adult seat" title="3">3</td>
		<td class="adult seat" title="4">4</td>
		<td class="adult seat" title="5">5</td>
		<td class="adult seat" title="6">6</td>
	</tr>
	<tr>
		<th>청소년</th>
		<td class="teen seat" title="0" style="background-color: white;">0</td>
		<td class="teen seat" title="1">1</td>
		<td class="teen seat" title="2">2</td>
		<td class="teen seat" title="3">3</td>
		<td class="teen seat" title="4">4</td>
		<td class="teen seat" title="5">5</td>
		<td class="teen seat" title="6">6</td>
	</tr>
</table>

<table border="1" style="background-color: yellow;">
	<c:forEach begin="1" end="${screenDTO.x_num }" varStatus="c">
		<tr>
			<c:forEach begin="1" end="${screenDTO.y_num }" varStatus="co">
				<td id="seat${(c.count-1)*screenDTO.y_num+ co.count }" class="seats" title="${(c.count-1)*screenDTO.y_num+ co.count }">
					<a href="#"  onclick="return false;">${(c.count-1)*screenDTO.y_num+ co.count }</a>
				</td>	
			</c:forEach>
		</tr>
	</c:forEach>
</table>