<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="dto.Hotel"%>
<% List<Hotel> list = (List) request.getAttribute("markedHotelList"); %>
<%@ include file="/layout/header.jsp" %>
<meta charset="UTF-8">
<title>찜한 숙소 목록</title>
<style>
.roomimg {
	width: 350px;
	height: 250px;
	border:none;
	border-radius: 10px;
}

tr, td {
	text-align: center;
	font-size: 20px;
}

table {
	border: #ccc;
	margin: 5%;
	font-family: 'Jua', sans-serif;
	margin-left: -1%;

}
</style>

<h2>♥내가 찜한 호텔 목록♥</h2>

<% int mo = list.size()/3; %>
<% int na = list.size()%3; %>
<% int newStart  = 0; %>


<% for (int i=0; i<mo*3;i++) { %>
    <table border="1" style="display:inline">
        <tr>
             <th colspan="2"><a href="/hotel/detail?hotel_no=<%= list.get(i).getHotel_no() %>"><img src="/upload/<%= list.get(i).getHotel_photo() %>" class="roomimg" alt="이미지 아님"></a></th>
        </tr>
        <tr>
            <td><%= list.get(i).getHotel_name() %></td>
            <td>을 찜한 사람 <%= list.get(i).getMark_hit() %>명</td>
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
             <th colspan="2"><a href="/hotel/detail?hotel_no=<%= list.get(i).getHotel_no() %>"><img src="/upload/<%= list.get(i).getHotel_photo() %>" class="roomimg" alt="이미지 아님"></a></th>
        </tr>
        <tr>
            <td><%= list.get(i).getHotel_name() %></td>
            <td>총 찜 횟수 : <%= list.get(i).getMark_hit() %> </td>
        </tr>
    </table>
<% } %> 


<%@ include file="/layout/footer.jsp" %>