<%@page import="dto.Semi_User"%>
<%@page import="dto.ReviewImage"%>
<%@page import="dto.Review"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% List<Review> reviewList = (List) request.getAttribute("reviewList"); %>
<% List<List<ReviewImage>> reviewimageList = (List) request.getAttribute("reviewimageList"); %>
<% List<Semi_User> userlist = (List) request.getAttribute("userlist"); %>
<%	request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

table.type01 {
  border-collapse: collapse;
  text-align: center;
  line-height: 1.5;
  margin : 20px 10px;
}
table.type01 th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border: 1px solid #ccc;
}
table.type01 td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border: 1px solid #ccc;
}

</style>


</head>
<body>

<!-- userList.get(i).getUser_pic() -->

<%	for(int i=0; i< reviewList.size(); i++) { %>
<!--//////////////////////////////////////////////////////////////////////////////////////////////////////////  -->
   <table class= "type01">
            <thead>
                <tr>
                    <th rowspan="2"></th>
                    <th colspan="2">별점</th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                 <tr>
                    <th><%-- <%=userList.get(i).getUser_pic() %> --%> <%=userlist.get(i).getUser_email() %> </th>
                    <th>작성날짜</th>
                    <th>객실명</th>
                    <th>　　　　　</th>
                    <th>　　　　</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td colspan="6"><%=reviewList.get(i).getReview_content() %></td>
                </tr>
                <tr>
<!--              <td rowspan="2" colspan="2">사진1</td>
                  <td rowspan="2" colspan="2">사진2</td>
                  <td rowspan="2" colspan="2">사진3</td> -->
                  <%	for(int j=0; j< reviewimageList.get(i).size(); j++) { %>
                  <td rowspan="2" colspan="2"><img src="/upload/<%=reviewimageList.get(i).get(j).getStoredname() %>" alt="이미지 아님" width="50" height="50"></td>
                  <%	} %> 
                </tr>
            </tbody>
        </table>
<!--//////////////////////////////////////////////////////////////////////////////////////////////////////////  -->
<%	} %> 




</body>
</html>