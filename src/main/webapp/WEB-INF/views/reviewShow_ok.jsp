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
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
    <link
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet"
    />
 <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
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
<%-- 
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
                    <th><%=userList.get(i).getUser_pic() %> <%=userlist.get(i).getUser_email() %> </th>
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
<%	} %>  --%>


<%	for(int i=0; i< reviewList.size(); i++) { %>
     <div class="reviewArea">
        <div class="reviewHeader">
          <h2 class="subTitle">리뷰 (2)</h2>
          <select>
          <option value="last">최신순</option>
            <option value="recommand">추천순</option>
          </select>
        </div>
        <ul class="reviewList">
          <li>
            <div class="profile">
              <img
                src="http://placeimg.com/100/100/arch/sepia"
                alt="user image"
                width="50px"
                height="50px"
              />
              <div class="reviewInfo">
                <div><%=reviewList.get(i).getReview_score() %></div>
                <div>
                  <span><%=userlist.get(i).getUser_email()%></span><span><%=reviewList.get(i).getReview_date() %></span><span>객실명</span>
                </div>
              </div>
            </div>
            <div class="reviewContent">
              <div class="imgArea">
              <%	for(int j=0; j< reviewimageList.get(i).size(); j++) { %>
                <img src="/upload/<%=reviewimageList.get(i).get(j).getStoredname() %>" alt="이미지 아님" width="50" height="50">
                  <%	} %> 
              </div>
              <p>
                Lorem Ipsum is simply dummy text of the printing and typesetting
                industry. Lorem Ipsum has been the industry's standard dummy
                text ever since the 1500s, when an unknown printer took a galley
                of type and scrambled it to make a type specimen book. It has
                survived not only five centuries, but also the leap into
                electronic typesetting, remaining essentially unchanged. It was
                popularised in the 1960s with the release of Letraset sheets
                containing Lorem Ipsum passages, and more recently with desktop
                publishing software like Aldus PageMaker including versions of
                Lorem Ipsum.
              </p>
            </div>
          </li>
        </ul>
      </div>
<%	} %> 

</body>
</html>