<%@page import="dto.ReviewImage"%>
<%@page import="dto.Review"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% List<Review> reviewList = (List) request.getAttribute("reviewList"); %>
<%List<List<ReviewImage>> reviewimageList = (List) request.getAttribute("reviewimageList"); %>
<%	request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>


<table>
<tr>
	<th>이메일</th> 
	<th>리뷰내용</th>
	<th>사진1</th>
	<th>사진2</th>
	<th>사진3</th>
</tr>

<%	for(int i=0; i< reviewList.size(); i++) { %>
<tr>
	<td><%=reviewList.get(i).getUser_email() %></td>
	<td><%=reviewList.get(i).getReview_content() %></td>
	<td><img src="/upload/<%=reviewimageList.get(i).get(i).getStoredname() %>" alt="이미지 아님" width="50" height="50"></td>
  	<td><img src="/upload/<%=reviewimageList.get(i).get(i+1).getStoredname() %>" alt="이미지 아님" width="50" height="50"></td>
 	<td><img src="/upload/<%=reviewimageList.get(i).get(2).getStoredname() %>" alt="이미지 아님" width="50" height="50"></td>

</tr>
<%	} %>


</table>


</div>

</body>
</html>