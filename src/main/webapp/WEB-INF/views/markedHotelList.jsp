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
</head>
<body>
<h1>내가 찜한 숙소</h1>
<%for(int i=0; i<list.size(); i++) { %>
    <table border="1">
        <tr>
             <th colspan="2"><img src="/upload/<%= list.get(i).getHotel_photo() %>" class="htimg" alt="이미지 아님"></th>
        </tr>
        <tr>
            <td><%= list.get(i).getHotel_name() %></td>
            <td><%= list.get(i).getMark_hit() %> </td>
        </tr>
    </table>
<% } %>  
</body>
</html>