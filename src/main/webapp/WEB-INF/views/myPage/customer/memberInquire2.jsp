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
      margin-top: 30px;
      padding: 20px;
    }

    @media only screen and (max-width: 600px) {
      .container {
        margin-top: 10px;
      }
    }
    .container h2, h3{
    	font-weight: bold;
    }
    .container p { 
		  margin-bottom: 10px;
		}
		.container h3{
			margin-top: 50px;
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
    <p>info@nordicnest.kr</p>
    <p>제품의 파손, 하자 등으로 인한 교환 및 환불 요청은 여기를 클릭해 등록하실 수 있습니다.</p>
  </div>
  <p><br/></p>
  <img src="${ctp}/images/doublebard.jpg" style="width: 100%; height: 70px;" />
  <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
