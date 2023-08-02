<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <title>adminContent.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />

</head>
<body>
<p><br/></p>
<div class="container">
<div class="" style="display: flex;">
  <div id="piechart" style="width: 400px; height: 400px;"></div>
  <div id="qwer" style="width: 400px; height: 400px;"></div>
  <div id="qwer4" style="width: 400px; height: 400px;"></div>
</div>
 <div style="display: flex;">
  <div id="qwer2" style="width: 400px; height: 400px;"></div>
  <div id="qwer3" style="width: 400px; height: 400px;"></div>
 </div>
</div>
<p><br/></p>
</body>
</html>