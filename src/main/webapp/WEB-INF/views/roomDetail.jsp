<%@page import="dto.Room"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% List<Room> roominfo = (List) request.getAttribute("roominfo"); %>

<style type="text/css">

table {
border: 1px solid #ccc;
}

tr, td {
text-align: center;
vertical-align : middle;
font-size: 30px;
}

</style>

<% for (int i = 0; i < roominfo.size(); i++) { %>
<table class="table">

		<tr>
			<td rowspan="5" style="width: 500px;">
			<img src="/upload/<%=roominfo.get(i).getRoom_img() %>" class="roomimg" alt="이미지 아님">
			</td>
			<td colspan="3"><%=roominfo.get(i).getRoom_type() %></td>
		</tr>
			<tr>
				<td>수용인원</td>
				<td><%=roominfo.get(i).getPeople() %></td>
				<td><%=roominfo.get(i).getMax_people() %></td>
			</tr>
			<tr>
				<td>가격</td>
				<td colspan="2"><%=roominfo.get(i).getRoom_price() %></td>
			</tr>
			<tr>
				<td colspan="3">예약하기</td>
			</tr>
	</table>
			<hr>
			<% } %>

    