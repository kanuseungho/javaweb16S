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
    
    .container h3 {
      font-size: 20px;
      font-weight: bold;
      margin-bottom: 10px;
    }
    
    .container p {
      margin-bottom: 10px;
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
     <h2>고객서비스 운영안내</h2>
     <p>어떤 색상이 여러분의 집에 가장 잘 어울릴 지, 주문한 물건이 언제 도착할 지 등 저희 고객센터는 노르딕네스트와의 경험의 시작부터 끝까지 모든 과정에서 도움을 드리고 있습니다. 언제든 도움이 필요하실 때 연락 부탁드립니다.</p>
     <h3>카카오톡 문의</h3>
     <p>노르딕네스트 카카오톡 채널 추가 후 챗봇 또는 1:1 상담 기능을 이용해보세요! (바로가기)</p>
     <h3>사이트 내 채팅문의</h3>
     <p>사이트 내 쇼핑 중 문의사항이 있는 경우 우측 하단의 채팅버튼을 클릭하거나 여기를 눌러 바로 1:1 상담 기능을 이용해보세요!</p>
     <p>※채팅 운영시간: 평일 10시 ~ 16시</p>
     <h3>한국어 이메일문의</h3>
     <p>이메일문의의 경우 영업일 기준 24시간 내 회신을 드리는 것을 목표로 합니다.</p>
     <div class="contact-info">
       <p>고객센터 이메일주소: info@nordicnest.kr</p>
       <p>카카오톡 1:1 채팅문의: 클릭하고 바로가기</p>
     </div>
     <h3>주소</h3>
     <p>Nordic Nest AB</p>
     <p>Stämpelvägen 3, SE-394 70 KALMAR, SWEDEN</p>
     <p>Org.nr: 556628-1597 VAT: SE556628159701</p>
     <p>고객서비스 휴무일은 아래와 같습니다.</p>
     <p>이메일 고객센터에 한해 휴무일에도 신규 문의 접수는 가능하며, 영업일 중 모든 문의에 순차적으로 답변 드리겠습니다.</p>
     <p>스웨덴 공휴일 중 주문 상품의 발송 등 일부 업무가 중단됨에 따라 문의 및 클레임 처리에 영향이 있을 수 있는 점 많은 양해 부탁드립니다.</p>
     <p>(스웨덴의 공휴일: 5월 1일/5월 18일/6월 6일/6월 23일/12월 25일/12월 26일)</p>
     <p>이메일 고객센터: 한국의 공휴일과 스웨덴의 공휴일</p>
     <p>홈페이지 및 카카오톡 채팅상담: 한국의 공휴일</p>
     <p>문의사항이 있으시면 언제든지 연락해주시기 바랍니다.</p>
   </div>
   <p><br/></p>
   <img src="${ctp}/images/doublebard.jpg" style="width: 100%; height: 70px;" />
   <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
