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
</head>
<body>
   <jsp:include page="/WEB-INF/views/include/nav.jsp" />
   <jsp:include page="/WEB-INF/views/myPage/memberInquire.jsp" />
   <p><br/></p>
   <div class="container">
     <img src="${ctp}/images/baesong1.jpg" style="width: 100%;" />
     <img src="${ctp}/images/baesong2.jpg" style="width: 100%;" />
     <img src="${ctp}/images/baesong3.jpg" style="width: 100%;" />

     <div class="content">
        <p>*영업일은 공휴일, 주말을 제외한 평일을 의미합니다. 상기 배송기일은 예상치이며 현지 배송사정 및 통관 상황에 따라 보장되지 않을 수 있습니다.</p>
        <p>**고객님의 상품이 한국에 도착하면 통관 과정을 거친 뒤 국내 배송이 시작됩니다. 통관 과정에서 고객님의 확인이 필요할 수 있습니다.</p>

        <h3>상품이 준비되고 출고되는 기간</h3>
        <ul>
          <li>상품의 출고일은 상품의 준비 상태 및 재고 상태에 따라 달라집니다.</li>
          <li>상품의 재고가 있는 경우 출고 준비를 위해 보통 1-2 영업일이 소요됩니다.</li>
          <li>상품의 재고가 없는 경우에는 통상적으로 9 영업일 이상 소요되며, 공급사의 스케줄에 따라 달라집니다. 대략적인 재입고 예정일은 상품 구매 페이지에서 확인하실 수 있습니다.</li>
        </ul>
 
        <h3>출고 후 배송완료까지 걸리는 기간</h3>
        <p>주문 시 선택하신 배송옵션마다 소요되는 기간이 다릅니다. 배송옵션별 기간은 아래 정보를 참고해주세요.</p>

        <h4>배송옵션</h4>
        <ul>
          <li>ECMS 익스프레스: 약 6-10 영업일 소요, 기본 배송료 ₩19,800</li>
          <li>FEDEX (페덱스): 약 3-7 영업일 소요, 기본 배송료 ₩22,800</li>
        </ul>

        <p>* 주문 상품의 무게나 크기에 따라 특정 배송옵션 선택이 불가능할 수 있습니다. * 영업일: 공휴일, 주말을 제외한 평일. * 위 배송 기간은 통관에 소요되는 시간을 제외한 '출고 이후 예상 배송 기간'입니다. 배송 기간은 상품의 크기와 종류 및 배송사 사정에 의해 다소 달라질 수 있습니다. 통관에 소요되는 기간은 배송 기간에 포함되지 않으며, 통관에서 문제 및 지연 발생시 당사 노르딕네스트에서는 책임지지 않습니다. 또한 위 예상 배송 기간은 예상치로 당사 노르딕네스트에서 보장하지 않습니다.</p>

        <h3>주문 후 배송 처리 과정</h3>
        <p>주문 접수부터 포장, 출고 후 배송까지의 과정을 참고해주세요:</p>
        <ol>
          <li>주문확인서가 이메일로 발송됩니다. 기입하신 주소와 연락처 등을 꼼꼼하게 확인해주세요.</li>
          <li>주문 접수 후 포장이 시작됩니다. 두 개 이상의 물품을 구입하셨다면 모든 제품의 재고가 있을 시에 출고됩니다.</li>
          <li>안전하게 포장되어 스웨덴 창고에서 국제 배송을 위해 출고됩니다. 출고 직후 배송확인서가 이메일로 발송됩니다.</li>
          <li>고객님의 상품이 한국에 도착하면 통관 과정을 거친 뒤 국내 배송이 시작됩니다.</li>
          <li>통관 과정에서 고객님의 확인이 필요할 수 있습니다. 통관 과정에 대한 자세한 내용은 페이지 하단을 참고해주세요.</li>
          <li>배송 및 통관 관련 정보는 각 배송사에서 카카오톡 알림톡 또는 문자 메세지로 안내드립니다.</li>
          <li>배송이 완료됩니다. 수령인 부재로 미배달 시 관할 배송 업체로 반드시 연락해주시기 바랍니다.</li>
      </ol>

      <h3>주문 상품 통관</h3>

      <h4>ECMS 익스프레스</h4>
      <ul>
        <li>롯데 글로벌로지스에서 통관 및 국내배송을 대행합니다.</li>
        <li>총 상품가액이 $150을 초과할 시 통관 과정에서 관부가세가 발생할 수 있습니다.</li>
        <li>통관 및 국내배송과 관련한 자세한 정보는 고객님의 카카오톡으로 발송되는 알림톡 메시지를 참조해주시기 바랍니다.</li>
      </ul>

      <h4>FEDEX (페덱스)</h4>
      <ul>
        <li>상품이 출고되면 고객님께 배송 관련 정보를 이메일 또는 문자메시지로 안내드립니다.</li>
        <li>총 상품가액이 $150을 초과하는 경우 통관 과정에서 관부가세가 발생할 수 있습니다.</li>
        <li>통관 및 국내배송과 관련한 자세한 정보는 고객님의 카카오톡으로 발송되는 알림톡 메시지를 참조해주시기 바랍니다.</li>
      </ul>

      <p>이 외에 더 자세한 정보를 원하신다면 사이트 이용약관을 참고해주세요.</p>

      <p>빠르고 편리하게, 즐거운 쇼핑 하시기 바랍니다.</p>
    </div>
  </div>
  <p><br/></p>
  <img src="${ctp}/images/doublebard.jpg" style="width: 100%; height: 70px;" />
  <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
