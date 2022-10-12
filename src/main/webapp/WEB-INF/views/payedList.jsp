<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="dto.Booking"%>
<%@page import="dto.Payment"%>
<% List<Map<String, Object>> list = (List) request.getAttribute("list"); %>

<!-- 아리님이 넘겨주는 파라미터 : hotel_no, pay_no, booking_no, room_type, user_no -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용내역</title>
<style>
.roomimg {
	width: 350px;
	height: 250px;
	border:none;
	border-radius: 10px;
}


table {
	border: #ccc;
	margin: 5%;
	font-family: 'Jua', sans-serif;
	margin-left: -10%;

}
</style>
</head>
<body>
<h2>♥내가 결제한 호텔 목록♥</h2>

<% int mo = list.size()/4; %>
<% int na = list.size()%4; %>
<% int newStart  = 0; %>


<% for (int i=0; i<mo*4;i++) { %>
    <table class="table" style="display:inline" border="0" width="250" height="300">
        <tr>
            <th width="250" height="100" border="0" colspan="4"><img src="/upload/<%= list.get(i).get("hotel_photo") %>" class="roomimg"  alt="이미지 아님" width="200" height="100"></th>
        </tr>
        <tr>
            <td> <%= list.get(i).get("hotel_name") %></td>
            <td> <%= list.get(i).get("room_type") %></td>
            <%-- <td> 해당 호텔 no : <%= ((Booking) list.get(i).get("b")).getHotel_no()  %>></td> --%>
            <td> <a href="./review/write?hotel_no=<%= ((Booking) list.get(i).get("b")).getHotel_no()  %>&pay_no=<%= ((Payment) list.get(i).get("p")).getPay_no() %>&booking_no=<%= ((Booking) list.get(i).get("b")).getBooking_no()
 %>&room_type=<%= list.get(i).get("room_type") %>&user_no=<%= ((Booking) list.get(i).get("b")).getUser_no() %>"> 리뷰쓰기  </td>
        </tr>
        <tr>
        	<td colspan="4" > 결제 일자 : <%= ((Payment) list.get(i).get("p")).getPay_date() %></td>
        </tr>
    </table>
    <% newStart++; %>
    <% if(newStart != 0 && newStart %4 ==0) {%>
    <br>
    <% } %>
<% } %>


<% for (int i=newStart; i<list.size();i++) { %>

    <table class="reviewArea" style="display:inline" border="1" width="250" height="300">
        <tr>
            <th width="250" height="100" border="0" colspan="4"><img src="/upload/<%= list.get(i).get("hotel_photo") %>" alt="이미지 아님" width="200" height="100"></th>
        </tr>
        <tr>
            <td> <%= list.get(i).get("hotel_name") %></td>
            <td> <%= list.get(i).get("room_type") %></td>
            <%-- <td> 해당 호텔 no : <%= ((Booking) list.get(i).get("b")).getHotel_no()  %>></td> --%>
            <td> <a href="./review/write?hotel_no=<%= ((Booking) list.get(i).get("b")).getHotel_no()  %>&pay_no=<%= ((Payment) list.get(i).get("p")).getPay_no() %>&booking_no=<%= ((Booking) list.get(i).get("b")).getBooking_no()
 %>&room_type=<%= list.get(i).get("room_type") %>&user_no=<%= ((Booking) list.get(i).get("b")).getUser_no() %>"> 리뷰쓰기  </td>
        </tr>
        <tr>
        	<td> 결제 일자 : <%= ((Payment) list.get(i).get("p")).getPay_date() %></td>
        </tr>
    </table>

<% } %>

</body>
</html>