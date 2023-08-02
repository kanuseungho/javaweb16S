<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>500 Error - Page Not Found</title>
  <!-- Add Bootstrap CSS link here -->
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
    <!-- Add custom CSS for styling -->
  <style>
    body {
      background-color: #f8f9fa;
    }
    .container {
      padding: 20px;
      border: 2px solid #FFA500; /* Thicker blue border */
      border-radius: 10px;
      background-color: #fff;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      margin: 200px auto;
      max-width: 400px; /* Adjust the maximum width to your preference */
      background-image: url("https://example.com/path/to/your/background-image.jpg");
      background-repeat: repeat; /* Repeat the pattern */
    }
    .error-image {
      max-width: 200px;
      margin: 20px auto;
      display: block;
      animation: bounce 1s infinite alternate; /* Add the bouncing animation */
    }
    @keyframes bounce {
      from {
        transform: translateY(0);
      }
      to {
        transform: translateY(-10px);
      }
    }
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<div class="container">
  <div class="text-center">
    <img src="${ctp}/images/images.jpg" class="error-image" />
    <h2>500 Error - Page Not Found</h2>
    <p>현재 제공되지 않는 페이지 입니다. 다시 접속해 주세요.</p>    
    <!-- You can add more custom text or styling here -->
    <%-- <div>
      <a href="${ctp}/errorPage/errorMain" class="btn btn-success">돌아가기</a>
    </div> --%>    
  </div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- Add Bootstrap JS and jQuery script links here -->
<script src="${ctp}/js/jquery.min.js"></script>
<script src="${ctp}/js/bootstrap.min.js"></script>
</body>
</html>
