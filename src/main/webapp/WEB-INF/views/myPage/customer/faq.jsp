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
    /* 아코디언 스타일 */
    .accordion {
      width: 100%;
    }

    .item {
      border: 1px solid #ddd;
      margin-bottom: 5px;
    }

    .item-header {
      background-color: #FFFFFF;
      padding: 10px;
      cursor: pointer;
    } 

    .item-content {
      max-height: 0;
      overflow: hidden;
      transition: max-height 0.5s ease; /* max-height에 애니메이션 효과 추가 */
    }

    /* 내용이 보이지 않을 때, 헤더 스타일을 변경하여 클릭 가능한 것임을 나타냄 */
    .item:not(.active) .item-header {
      background-color: #FFFFFF;
    }

    /* 내용이 펼쳐질 때, 헤더 스타일을 변경하여 활성화된 것임을 나타냄 */
    .item.active .item-header {
      background-color: #ddd;
    }

    .sale-banner {
      position: absolute;
      top: 10px;
      left: 10px; /* Change 'right' to 'left' */
      background-color: red;
      color: white;
      padding: 5px 10px;
      font-weight: bold;
    }

    .arrow {
      float: right; /* 화살표를 오른쪽으로 배치 */
      transition: transform 0.3s ease; /* 화살표 회전에 애니메이션 효과 추가 */
    }

    .rotate {
      transform: rotate(180deg); /* 아래 화살표를 회전하여 위 화살표로 변환 */
    }

    .item-content {
      display: flex;
      flex-direction: row;
      justify-content: space-between;
    }
  </style>
  <script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function () {
      const items = document.querySelectorAll('.item');

      items.forEach(item => {
        const header = item.querySelector('.item-header');
        const content = item.querySelector('.item-content');

        header.addEventListener('click', function () {
          item.classList.toggle('active');

          if (item.classList.contains('active')) {
            content.style.maxHeight = content.scrollHeight + 'px';
          } else {
            content.style.maxHeight = 0;
          }
        });
      });
    });

    function toggleAccordion(item) {
      item.classList.toggle('active');
      const arrow = item.querySelector('.arrow');
      arrow.classList.toggle('rotate');
    }
  </script>
</head>
<body>
  <jsp:include page="/WEB-INF/views/include/nav.jsp" />
  <jsp:include page="/WEB-INF/views/myPage/memberInquire.jsp" />
  <p><br/></p>
  <div class="container">
    <h3>FAQ - 자주 묻는 질문</h3>
    <p>이곳에서 자주묻는질문을 확인해보세요. 만약 원하는 답변을 찾지 못한 경우 고객센터로 연락 부탁드립니다.</p>
    <p>- 이메일 고객센터: info@nordicnest.kr - 카카오톡 고객센터: [상담 바로가기]</p>
    <div class="accordion">
      <div class="item">
        <div class="item-header" onclick="toggleAccordion(this)">브랜드 정품이 맞나요? <span class="arrow"><i class="fa-solid fa-arrow-down fa-xl" style="color: #424242"></i></span></div>
        <div class="item-content">
          네 맞습니다. 노르딕네스트는 유럽 내 200여 브랜드의 스웨덴 공식 유통사입니다. 따라서 판매되는 모든 상품은 100% 정품입니다.
        </div>
      </div>
      <div class="item">
        <div class="item-header" onclick="toggleAccordion(this)">판매되는 제품에 어떤 품질 보장이 적용되나요? <span class="arrow"><i class="fa-solid fa-arrow-down fa-xl" style="color: #424242"></i></span></div>
        <div class="item-content">
          노르딕네스트의 공급사는 일부 브랜드 제품들에 한해 품질 보증을 제공하고 있습니다. 품질 보증이 되는 특정 제품에 대한 더 자세한 정보가 필요하신 분은 고객 센터로 문의 주시기 바랍니다.
        </div>
      </div>
      <div class="item">
        <div class="item-header" onclick="toggleAccordion(this)">어떤 결제 방법을 사용할 수 있나요? <span class="arrow"><i class="fa-solid fa-arrow-down fa-xl" style="color: #424242"></i></span></div>
        <div class="item-content">
          노르딕네스트에서는 국내신용카드, 네이버페이, 페이코를 통한 결제를 지원하고 있습니다.
        </div>
      </div>
      <div class="item">
        <div class="item-header" onclick="toggleAccordion(this)">무이자할부도 가능한가요?<span class="arrow"><i class="fa-solid fa-arrow-down fa-xl" style="color: #424242"></i></span></div>
        <div class="item-content">
          구매금액 및 카드사별 무이자할부 혜택이 제공되며 상세 정보는 결제 단계에서 확인 가능합니다.
        </div>
      </div>
      <div class="item">
        <div class="item-header" onclick="toggleAccordion(this)">주문 내역은 어디서 확인하나요?<span class="arrow"><i class="fa-solid fa-arrow-down fa-xl" style="color: #424242"></i></span></div>
        <div class="item-content">
          비회원 결제로 진행하셨다면 주문확인서가 고객님의 이메일로 전송됩니다. 회원 결제로 진행하신 경우 마이페이지 > 내 주문내역에서 상세한 주문 내역을 확인할 수 있습니다. 빠르고 정확하게 주문 내역을 확인하시기 위해서는 회원가입 후 로그인 하여 회원 결제로 진행하시는 걸 권장합니다.
        </div>
      </div>
      <div class="item">
        <div class="item-header" onclick="toggleAccordion(this)">주문 및 배송 확인 이메일을 못 받았어요. <span class="arrow"><i class="fa-solid fa-arrow-down fa-xl" style="color: #424242"></i></span></div>
        <div class="item-content">
          주문이 출고되면 고객님의 이메일주소로 출고확인메일을 보내드립니다. 단, 이메일 주소를 제공하는 사이트에 따라 노르딕네스트에서 발송되는 이메일이 스팸으로 분류되는 경우가 있습니다. 따라서 받은 편지함에서 주문 확인 또는 배송 확인 메일이 확인되지 않는 경우 스팸 폴더를 확인해주세요. 만약 스팸 폴더에서도 메일을 찾지 못할 경우 고객센터로 연락해주세요.
        </div>
      </div>
      <div class="item">
        <div class="item-header" onclick="toggleAccordion(this)">주문 시 재고가 있었는데 주문확인서에는 재고가 없다고 나와요. <span class="arrow"><i class="fa-solid fa-arrow-down fa-xl" style="color: #424242"></i></span></div>
        <div class="item-content">
          노르딕네스트 제품은 전세계로 동시 판매됩니다. 이 때문에 동일 제품에 대한 주문이 동시에 접수될 수 있으며 이 경우 주문 당시의 재고현황과 주문확인서 상 재고현황이 다를 수 있습니다. 제품의 재입고 일정이 궁금하다면 고객센터로 문의주시기 바랍니다.
        </div>
      </div>
      <div class="item">
        <div class="item-header" onclick="toggleAccordion(this)">주문 취소가 가능한가요? 주문 취소는 어떻게 하나요? <span class="arrow"><i class="fa-solid fa-arrow-down fa-xl" style="color: #424242"></i></span></div>
        <div class="item-content">
          모든 주문은 포장이 되기 전까지만 취소 가능합니다. 취소를 원하시는 경우 고객센터로 연락해주시면 최대한 신속히 도와드립니다. *주문 건이 이미 포장 작업 중에 있거나 출고되었을 경우에는 주문 취소가 불가합니다. 이 경우에는 상품을 받으신 다음 상품을 반송하여 환불을 받으실 수 있습니다. 반송 비용은 고객님 부담입니다.
        </div>
      </div>
      <div class="item">
        <div class="item-header" onclick="toggleAccordion(this)">배송 정보가 궁금해요. <span class="arrow"><i class="fa-solid fa-arrow-down fa-xl" style="color: #424242"></i></span></div>
        <div class="item-content">
          노르딕네스트의 모든 상품은 스웨덴에서 출고되어 고객님께 직배송됩니다. 배송은 ECMS 또는 FEDEX 중 선택하실 수 있습니다. 모든 상품은 준비가 된 후 창고에서 출고되며, 출고 후에는 배송사로 전달되어 배송이 시작됩니다. 고객님께서 선택하신 배송 방법에 따라 배송에 걸리는 기간이 달라집니다. 보다 자세한 내용은 사이트 하단의 '배송 정보' 페이지 또는 체크아웃 페이지를 확인해주세요.
        </div>
      </div>
      <div class="item">
        <div class="item-header" onclick="toggleAccordion(this)">주문한 상품 중 재고 있는 상품이 먼저 배송되나요? <span class="arrow"><i class="fa-solid fa-arrow-down fa-xl" style="color: #424242"></i></span></div>
        <div class="item-content">
          모든 주문은 합배송이 원칙입니다. 따라서 주문 품목 중 재입고가 필요한 상품이 있다면 모든 상품의 출고 준비가 된 이후 일괄 출고됩니다.
        </div>
      </div>
      <div class="item">
        <div class="item-header" onclick="toggleAccordion(this)">관세 및 부가세를 내야 하나요? <span class="arrow"><i class="fa-solid fa-arrow-down fa-xl" style="color: #424242"></i></span></div>
        <div class="item-content">
          노르딕네스트에서 판매되는 모든 상품 가격에는 세금이 포함되어 있지 않습니다. 다만 현행 관세법에 의하면 배송비를 제외한 총 상품 금액이 미화 150불 이하인 경우 관세 및 부가세가 면제되기 때문에 추가로 납부하실 금액은 없습니다. 배송비를 제외한 총 상품 금액이 미화 150불을 초과할 경우에는 관부가세가 발생할 수 있습니다.
        </div>
      </div>
      <div class="item">
        <div class="item-header" onclick="toggleAccordion(this)">전기용품(조명 등)은 왜 1개씩만 살 수 있나요?<span class="arrow"><i class="fa-solid fa-arrow-down fa-xl" style="color: #424242"></i></span></div>
        <div class="item-content">
          '전기용품 및 생활용품 안전관리법'에 의하면 개인이 해외에서 전기용품을 자가사용 목적으로 수입할 시 동일 수취인 이름으로 동일 날짜 입항건 기준, 단일 품목당 1개만 수입하도록 허용하고 있습니다. 따라서 노르딕네스트에서 판매 중인 전기용품(조명 등)은 단일 품목 당 1개씩만 구입이 가능합니다. 조명류 외에도 전기를 사용하는 상품이나 배터리가 들어가는 상품 등이 해당됩니다. 구입 예시) 1. A 조명 1개 + B 조명 1개 동시에 구입 ☞ 품목이 다른 상품 1개씩이므로 통관 가능 2. A 조명 2개 구입 ☞ 통관 시 1개만 통관가능, 다른 1개는 폐기 처분 노만코펜하겐 Norm 시리즈나 일부 우메이 제품은 전기가 들어가지 않는 전등갓이기에 위 내용에 해당되지 않으며 구매 수량 제한없이 구입 가능합니다. 위 내용 숙지하시어 통관 시 불이익 없도록 유의하시기 바랍니다. **위 내용은 개인 이름으로 전기 용품을 구매하는 경우에 해당되며 사업자명으로는 전기용품 수입 및 통관이 불가합니다. 주문 진행 이후 수입통관 과정에서 폐기건 발생 시 노르딕네스트에서는 책임지지 않습니다. 보다 자세한 사항은 고객님께서 거주하시는 국가의 해당 기관에 문의해주시기 바랍니다.
        </div>
      </div>
      <div class="item">
        <div class="item-header" onclick="toggleAccordion(this)">제품이 불만족스러울 경우 교환이나 환불이 가능한가요?<span class="arrow"><i class="fa-solid fa-arrow-down fa-xl" style="color: #424242"></i></span></div>
        <div class="item-content">
          노르딕네스트는 스웨덴 소비자법(Konsumentköplagen )과 EU의 전자상거래지침(E-commerce directive)을 준수합니다. 위 규약에 의거하여 고객님은 상품 수령 후 14일 이내 이유를 불문하고 주문을 취소하고 환불 받을 수 있습니다. 환불을 원하시면 고객센터로 주문 취소 및 환불 의사를 전달해주세요. 단, 주문 취소 의사를 밝히신 후 14일 이내로 물품을 스웨덴으로 반송하셔야 합니다. 반송 비용은 고객님 부담입니다. 환불 정책에 관한 더 자세한 정보를 원하시면 웹사이트의 ‘환불 정책’란 혹은 ‘이용 약관’의 환불 정책 페이지를 참고해주세요.
        </div>
      </div>
      <div class="item">
        <div class="item-header" onclick="toggleAccordion(this)">제품의 파손/오배송/하자는 어떻게 처리되나요?<span class="arrow"><i class="fa-solid fa-arrow-down fa-xl" style="color: #424242"></i></span></div>
        <div class="item-content">
          제품의 파손/오배송/하자 발생 시 사이트 하단 "반품 요청 및 클레임 등록" 페이지에서 클레임 등록을 해주시면 신속히 도와드립니다. 진행 전 도움이 필요하신 경우 고객센터로 문의해주세요.
        </div>
      </div>
      
      
    </div>
  </div>
  <p><br/></p>
  <img src="${ctp}/images/doublebard.jpg" style="width: 100%; height: 70px;" />
  <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
