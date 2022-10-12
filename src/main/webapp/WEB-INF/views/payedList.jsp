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
</head>
<body>
<h2>내가 결제한 호텔 목록</h2>
<%	for(int i=0; i< list.size(); i++) { %>
    <table border="1">
        <tr>
            <th colspan="2"><img src="/upload/<%= list.get(i).get("hotel_photo") %>" alt="이미지 아님" width="50" height="50"></th>
        </tr>
        <tr>
            <td> <%= list.get(i).get("hotel_name") %></td>
            <td> <%= list.get(i).get("room_type") %></td>
            <td>  
<a href="./review/write?hotel_no=<%= ((Booking) list.get(0).get("b")).getHotel_no()  %>&pay_no=<%= ((Payment) list.get(0).get("p")).getPay_no() %>&booking_no=<%= ((Booking) list.get(0).get("b")).getBooking_no()
 %>&room_type=<%= list.get(i).get("room_type") %>&user_no=<%= ((Booking) list.get(0).get("b")).getUser_no() %>">리뷰쓰기  </td>
        </tr>
    </table>

<% } %>




</body>
</html>