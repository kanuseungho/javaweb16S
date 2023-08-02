<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="/WEB-INF/views/errorPage.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Error Page</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <style>
    /* Add your custom CSS styles here */
    /* For example, you can style the container and error message */
    .container {
      margin-top: 50px;
    }
    .error-message {
      color: red;
      font-size: 18px;
      font-weight: bold;
    }
  </style>
</head>
<body>
  <jsp:include page="/WEB-INF/views/include/nav.jsp" />
  <p><br/></p>
  <div class="container">
    <h2>에러를 발생시켜주는 JSP 파일</h2>
    <%
      try {
        int su = 10 / 0;
        out.print("결과: " + su + "<br/>");
      } catch (ArithmeticException e) {
        // Handle the error and display a custom error message
        String errorMessage = "An error occurred: Division by zero!";
        request.setAttribute("errorMessage", errorMessage);
        request.getRequestDispatcher("/WEB-INF/views/errorPage.jsp").forward(request, response);
      }
    %>
    <p>
      <a href="errorMain" class="btn btn-success">돌아가기</a>
    </p>
  </div>
  <p><br/></p>
  <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
