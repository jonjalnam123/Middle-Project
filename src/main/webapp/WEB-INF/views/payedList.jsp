<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="dto.Booking"%>
<%@page import="dto.Payment"%>
<% List<Map<String, Object>> list = (List) request.getAttribute("list"); %>
<%@ include file="/layout/header.jsp"%>

<h2>내가 결제한 호텔 목록</h2>

<% int mo = list.size()/4; %>
<% int na = list.size()%4; %>
<% int newStart = 0;%>
<%	for(int i=0; i< mo*4; i++) { %>
    <table style="display:inline" border="0" width="250" height="300">
        <tr>
            <th  width="250" height="100" border="5" colspan="4"><img src="/upload/<%= list.get(i).get("hotel_photo") %>" alt="이미지 아님" width="250" height="100"></th>
        </tr>
        <tr>
            <td> <%= list.get(i).get("hotel_name") %></td>
            <td> <%= list.get(i).get("room_type") %></td>
            <td> 해당 호텔 no : <%= ((Booking) list.get(i).get("b")).getHotel_no()  %>></td>
            <td> <a href="./review/write?hotel_no=<%= ((Booking) list.get(i).get("b")).getHotel_no()  %>&pay_no=<%= ((Payment) list.get(i).get("p")).getPay_no() %>&booking_no=<%= ((Booking) list.get(i).get("b")).getBooking_no()
 %>&room_type=<%= list.get(i).get("room_type") %>&user_no=<%= ((Booking) list.get(i).get("b")).getUser_no() %>"> 리뷰쓰기  </td>
        </tr>
        <tr>
        	<td> 결제 일자 : <%= ((Payment) list.get(i).get("p")).getPay_date() %></td>
        </tr>
    </table>
<% } %>


<%@ include file="/layout/footer.jsp"%>