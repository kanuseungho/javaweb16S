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
    .containers {
      margin-top: 200px;
      display: flex;
      justify-content: center;
    }
  </style>
</head>
<body>  
  <p><br/></p>
  <div class="containers">
    <div>
      <input type="button" onclick="location.href='${ctp}/myPage/customer/contactopeninghours';" value="영업시간" class="btn btn-warning"/>
      <input type="button" onclick="location.href='${ctp}/myPage/customer/tracktrace';" value="배송 조회" class="btn btn-warning"/>
      <input type="button" onclick="location.href='${ctp}/myPage/customer/shippinginformation';" value="배송 정보" class="btn btn-warning"/>
      <input type="button" onclick="location.href='${ctp}/myPage/customer/returnpolicy';" value="교환&환불 안내" class="btn btn-warning"/>
      <input type="button" onclick="location.href='${ctp}/myPage/customer/returns';" value="반품 요청 및 클레임 등록" class="btn btn-warning"/>
      <input type="button" onclick="location.href='${ctp}/myPage/customer/termsconditions';" value="사이트 이용 약관" class="btn btn-warning"/>
      <input type="button" onclick="location.href='${ctp}/myPage/customer/privacypolicy';" value="개인 정보 보호 정책" class="btn btn-warning"/>
      <input type="button" onclick="location.href='${ctp}/myPage/customer/cookies';" value="쿠키에 대하여" class="btn btn-warning"/>
      <input type="button" onclick="location.href='${ctp}/myPage/customer/faq';" value="FAQ-자주묻는질문" class="btn btn-warning"/>
    </div>
  </div>
  <p><br/></p>
</body>
</html>
