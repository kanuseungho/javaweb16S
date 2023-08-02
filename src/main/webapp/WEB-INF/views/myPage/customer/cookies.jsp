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
    
    .container h2 {
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 20px;
    }

    .container p { 
      margin-bottom: 10px;
      margin-top: 10px;
    }
    
    .container .contact-info {
      margin-bottom: 30px;
    }
  </style>
</head>
<body>
   <jsp:include page="/WEB-INF/views/include/nav.jsp" />
   <jsp:include page="/WEB-INF/views/myPage/memberInquire.jsp" />
   <p><br/></p>
   <div class="container">
     <h2>쿠키에 대하여</h2>
     <p>노르딕네스트는 당사의 웹 사이트에서 쿠키라고 불리는 기술을 사용하고 있습니다. 쿠키는 고객님이 웹사이트를 방문 할 때 고객님의 인터넷 브라우저에 자동으로 보내지는 일련의 텍스트로, 일종의 정보 파일입니다. 이후 고객님께서 저희 웹 사이트를 다시 방문하실 때 브라우저는 그 일련의 텍스트를 저희에게 전송하고, 이를 이용하여 특정 컴퓨터에서 웹 사이트에 방문하는 횟수를 기록합니다. 이 기술로 웹 사이트의 방문자 수와 방문자들이 얼마 동안 웹 사이트를 이용하는지 측정할 수 있습니다. 또한 방문자는 같은 정보를 계속 입력할 필요가 없습니다. 이러한 기술은 은행을 비롯한 대부분의 웹사이트에서 쓰이는 기술입니다.</p>
     <p>쿠키에는 어떠한 개인정보도 포함되어있지 않으며, 이를 이용하여 특정인을 추적하는 것은 불가능합니다. 쿠기 기술을 원하지 않으시면, 브라우저의 환경설정에서 쿠키를 받지 않도록 설정하실 수 있습니다. 인터넷 익스플로러의 경우 “도구” 메뉴에서 이에 대한 더 자세한 정보를 얻으실 수 있습니다. 쿠키를 받지 않기로 설정하시면 노르딕네스트는 nordicnest.kr 웹 사이트의 정확성을 보증할 수 없습니다.</p>
   </div>
   <p><br/></p>
   <img src="${ctp}/images/doublebard.jpg" style="width: 100%; height: 70px; margin-top: 180px;" />
   <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>