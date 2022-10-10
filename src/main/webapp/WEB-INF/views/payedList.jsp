<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<% List<Map<String, Object>> list = (List) request.getAttribute("list"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용내역</title>
</head>
<body>
<%	for(int i=0; i< list.size(); i++) { %>
    <table border="1">
        <tr>
            <th colspan="2"><img src="/upload/<%= list.get(i).get("hotel_photo") %>" alt="이미지 아님" width="50" height="50"></th>
        </tr>
        <tr>
            <td> <%= list.get(i).get("hotel_name") %></td>
            <td> <%= list.get(i).get("room_type") %></td>
            <td> 리뷰쓰기  </td>
        </tr>
    </table>

<% } %>




</body>
</html>