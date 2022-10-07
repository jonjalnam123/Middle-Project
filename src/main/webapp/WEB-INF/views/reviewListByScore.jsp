<%@page import="dto.Semi_User"%>
<%@page import="dto.ReviewImage"%>
<%@page import="dto.Review"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% List<Review> reviewList = (List) request.getAttribute("reviewList"); %>
<% List<List<ReviewImage>> reviewimageList = (List) request.getAttribute("reviewimageList"); %>
<% List<Semi_User> userlist = (List) request.getAttribute("userlist"); %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
%>


<%	request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c2f47283a16fca78743abba9b8a1f5ba&autoload=false"></script>
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
<script type="text/javascript">
	$(document).ready(function() {
	 	$("#select").change(function() {		
			var hotel_no = 1
			var selectedOption = this.value;

			$.ajax({
				type: "GET" ,
				url: "/review/list?hotel_no=1&selectedOption="+selectedOption,
				datatype: "html",
				success: function(data) {
					console.log("성공");
					$("#result").html(data);
				}
				
			})   //ajax 끝 }
			
		}) 
	 	})
</script>



</head>
<body> 
<<<<<<< HEAD
<h1> 별점순 리뷰 </h1>
     <div class="reviewArea">
        <div class="reviewHeader">
          <h2 class="subTitle">리뷰 총 ( <%=reviewList.size() %> ) 개</h2>
          <select id="select">
            <option value="byScore">추천순</option>
            <option value="byDate">최신순</option>
          </select>
        </div>
 		<div id="result" class ="result">
=======
<h1>추천순 페이지 호출 성</h1>
>>>>>>> branch 'develop' of https://github.com/heejuu321/semi.git

         <%	for(int i=0; i< reviewList.size(); i++) { %>
        <ul class="reviewList">
          <li>
            <div class="profile">
              <img src="/upload/<%=userlist.get(i).getUser_pic() %>" alt="이미지 아님" width="50" height="50">
              <div class="reviewInfo">
                <div><%=reviewList.get(i).getReview_score() %>점</div>
                <div>
                  <span><%=userlist.get(i).getUser_email()%></span><span><%= sf.format(reviewList.get(i).getReview_date()) %></span><span><%=reviewList.get(i).getRoom_type() %></span>
                
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
                <%=reviewList.get(i).getReview_content() %>
              </p>
            </div>
          </li>
        </ul>
          <%	} %> 
                    </div>
      </div>

</body>
</html>