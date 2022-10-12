<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="dto.Hotel"%>
<% List<Hotel> list = (List) request.getAttribute("markedHotelList"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.roomimg {
	width: 350px;
	height: 250px;
	border:none;
	border-radius: 10px;
}
</style>
</head>
<body>
<h2>♥내가 찜한 호텔 목록♥</h2>

<% int mo = list.size()/3; %>
<% int na = list.size()%3; %>
<% int newStart  = 0; %>


<% for (int i=0; i<mo*3;i++) { %>
    <table border="1" style="display:inline">
        <tr>
             <th colspan="2"><img src="/upload/<%= list.get(i).getHotel_photo() %>" class="roomimg" alt="이미지 아님"></th>
        </tr>
        <tr>
            <td><%= list.get(i).getHotel_name() %></td>
            <td>총 찜 횟수 : <%= list.get(i).getMark_hit() %> </td>
        </tr>
    </table>
    <% newStart++; %>
    <% if(newStart != 0 && newStart %3 ==0) {%>
    <br>
    <% } %>
<% } %> 



<% for (int i=newStart; i<mo*3;i++) { %>
    <table border="1" style="display:inline">
        <tr>
             <th colspan="2"><img src="/upload/<%= list.get(i).getHotel_photo() %>" class="roomimg" alt="이미지 아님"></th>
        </tr>
        <tr>
            <td><%= list.get(i).getHotel_name() %></td>
            <td>총 찜 횟수 : <%= list.get(i).getMark_hit() %> </td>
        </tr>
    </table>
<% } %> 


</body>
</html>