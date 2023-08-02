<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <style type="text/css">
    .container {
      font-size: 16px;
    }
    .container h1{
    	font-weight: bold;
    	font-size: 60px;
    }
    .container p {
      margin-bottom: 30px;
    }
  </style>
</head>
<body>
   <jsp:include page="/WEB-INF/views/include/nav.jsp" />
   <jsp:include page="/WEB-INF/views/myPage/memberInquire.jsp" />
   <p><br/></p>
   <div class="container">
     <h1>배송 조회</h1>
     <p>주문하신 제품이 출고되면 운송장 번호와 함께 배송 확인 이메일을 보내드립니다. 보내드린 운송장 번호로 각 배송사 배송추적 페이지에서 배송 조회가 가능합니다.</p>
     <p>고객님의 주문은 선택하신 배송방법을 통해 스웨덴에서 한국으로 바로 발송됩니다. 한국에 주문이 도착하면 우체국 또는 해당 운송사로 인계됩니다.</p>
     <p><a href="https://www.ecmsglobal.com/ko-kr/index.html">ECMS 배송조회</a></p>
     <p><a href="https://www.fedex.com/ko-kr/home.html#">FEDEX (페덱스) 배송조회</a></p>     
     <img src="${ctp}/images/baesong1.jpg" style="width: 100%;" />
     <img src="${ctp}/images/baesong2.jpg" style="width: 100%;" />
     <img src="${ctp}/images/baesong3.jpg" style="width: 100%;" />
   </div>
   <p><br/></p>
   <img src="${ctp}/images/doublebard.jpg" style="width: 100%; height: 70px;" />
   <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
