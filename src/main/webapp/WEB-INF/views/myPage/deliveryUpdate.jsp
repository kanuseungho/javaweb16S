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
  <link rel="stylesheet" href="${ctp}/css/style.css">
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${ctp}/js/woo.js"></script>
  <style>
    .container {
      margin-top: 150px;
    }

    .input-group {
      margin-bottom: 10px;
    }

    .form-control {
      border-radius: 20px;
    }

    .btn-primary {
      border-radius: 20px;
    }

    .rounded-card {
      border-radius: 10px;
      background-color: #ffffff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      padding: 20px;
      margin-bottom: 20px;
    }

    .product-image {
      border-radius: 10px;
      width: 400px;
      height: 400px;
      object-fit: cover;
    }
    .btnWich{
     text-align: right;
		}
  </style>
  <script type="text/javascript">
  function memberCheck() {
	  let name = memberForm.name.value;
  	let	tel = memberForm.tel.value.trim();
  	let message = memberForm.message.value;
  	let phoneNumberPattern = /^010-\d{4}-\d{4}$/;
  	if(name==""){
  		alert("성함을 공백으로 둘 순 없어요!");
  		memberForm.name.focus();
  		return false;
  	}
  	else if(tel==""){
  		alert("전화번호를 공백으로 둘 순 없어요!");
  		memberForm.tel.focus();
  		return false;
  	}
  	else if(!phoneNumberPattern.test(tel)){
  		alert("전화번호 형식은 010-0000-0000으로 010과 -에 유의해주세요");
  		memberForm.tel.focus();
  		return false;
  	}
  	
  	else if(message==""){
  		alert("메시지를 공백으로 둘 순 없어요!");
  		memberForm.message.focus();
  		return false;
  	}
  	else{
  		memberForm.submit(); 		
  	}
	}  	
  
  function addressCheck() {
	  let postcode = baesongForm.postcode.value;
	  let roadAddress = baesongForm.roadAddress.value;
	  let detailAddress = baesongForm.detailAddress.value;
	  let extraAddress = baesongForm.extraAddress.value;
	  
	  if(postcode ==""){
		  alert("우편번호를 입력해주세요");
		  return false;
	  }
	  else if(roadAddress==""){
		  alert("주소를 입력해주세요");
		  return false;
	  }
	  else if(detailAddress==""){
		  alert("상세 주소를 입력해주세요");
		  return false;
	  }
	  else if(extraAddress==""){
		  alert("참고 사항을 입력해주세요");
		  return false;
	  }
	  else{			
		  baesongForm.submit() 
	 }					
	}
  </script>
</head>
<body>
  <jsp:include page="/WEB-INF/views/include/nav.jsp" />
  <jsp:include page="/WEB-INF/views/myPage/memberPage.jsp" />
  <p><br/></p>
  <div class="container">
    <c:if test="${! empty baesongVOS}">    
    	<c:forEach var="vo" items="${baesongVOS}">
    	 <c:if test="${vo.orderStatus=='결제완료'} "><%-- || vo.orderStatus == '배송준비중'} --%>
	      <div class="rounded-card">
	      	<h4>배송 정보</h4>
		      <div class="row">
		        <div class="col-md-6">
		          <img src="${ctp}/product/${vo.baesongImg}" alt="Product Image" class="product-image">
		        </div>
		        <div class="col-md-6">
		          <p><strong>제품코드:</strong>&nbsp; ${vo.orderIdx}</p>
		          <p><strong>이름:</strong>&nbsp;${vo.name}</p>
		          <p><strong>주소:</strong>&nbsp; ${vo.address}</p>
		          <p><strong>전화번호:</strong>&nbsp;${vo.tel}</p>
		          <p><strong>메시지:</strong>&nbsp;${vo.message}</p>
		          <p><strong>결제상태:</strong>&nbsp;${vo.orderStatus}</p>		          
		          <p><strong>할인수단:</strong>&nbsp;${vo.membership}</p>
		          <p><strong>할인금액:</strong>&nbsp;${vo.membershipPrice}</p>
		        </div>
		      </div>
	        <h4>배송지 수정</h4>	        
	        <form name="memberForm" method="post" action="${ctp}/myPage/deliveryUpdateMember">
		        <div>	        	
		        	<input type="text" name="name" id="name" class="form-control mt-2" value="${vo.name}"/>	        	
		        	<input type="text" name="tel" id="tel" class="form-control mt-2" value="${vo.tel}"/>
		        	<input type="text" name="message" id="message" class="form-control mt-2" value="${vo.message}"/>
		        	<input type="hidden" name="idx" id="idx" value="${vo.idx}"/>
		        	<div class="btnWich"><input type="button" value="개인정보 수정" onclick="memberCheck()" class="btn btn-primary btn-sm mt-2"/></div>
		        </div>
	        </form>
	        <form name="baesongForm" method="post" action="${ctp}/myPage/deliveryUpdateAddress" >
		        <div class="input-group">
		          <input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호" class="form-control mt-2">
		          <div class="input-group-append">
		            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-primary btn-sm mt-2">
		          </div>
		        </div>
		        <input type="text" name="roadAddress" id="sample6_address" size="50" placeholder="주소" class="form-control mb-1">
		        <div class="input-group">
		          <input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소" class="form-control">
		          <div class="input-group-append">
		            <input type="text" name="extraAddress" id="sample6_extraAddress" placeholder="참고항목" class="form-control">
		          </div>
		        </div>
		        <input type="hidden" value="${vo.idx}" name="idx" id="idx"/>
		        <div class="btnWich"><input type="button" onclick="addressCheck()" value="배송지 수정" class="btn btn-primary btn-sm"/></div>
	        </form>
	      </div>
	     </c:if> 
      </c:forEach> 
    </c:if>
    <c:if test="${empty baesongVOS}">
   	 <div class="container">
	    <div class="card" style="background-image: url(${ctp}/images/라이언.jpg);">
	      <div class="card-header">
	        <h3 class="text-center">주문한 상품이 없습니다.</h3>
	      </div>
	      <div class="card-body" style="height: 500px;" >
	        <p class="text-center">주문하신 상품이 없습니다. 쇼핑을 계속하시려면 홈으로 이동해주세요.</p>
	        <div class="text-center">
	          <input type="button" value="홈으로" class="btn btn-primary" onclick="location.href='${ctp}/';">
	        </div>
	      </div>
	    </div>
	   </div>
    </c:if>

      

  </div>
</body>
</html>
