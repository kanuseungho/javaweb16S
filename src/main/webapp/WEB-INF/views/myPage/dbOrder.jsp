<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${ctp}/js/woo.js"></script>
  
  <script>
	  $(document).ready(function(){
		  $(".nav-tabs a").click(function(){
		    $(this).tab('show');
		  });
		  $('.nav-tabs a').on('shown.bs.tab', function(event){
		    var x = $(event.target).text();         // active tab
		    var y = $(event.relatedTarget).text();  // previous tab
		  });
		});
  
	  // 결재하기
    function order() {
		  var paymentCard = document.getElementById("paymentCard").value;
    	var payMethodCard = document.getElementById("payMethodCard").value;
		  var paymentBank = document.getElementById("paymentBank").value;
    	var payMethodBank = document.getElementById("payMethodBank").value;
    	let buyer_postcode = myform.buyer_addr.value;
    	let buyer_addr = myform.buyer_addr.value;
    	let origenalTel = myform.buyer_tel.value;
    	if(paymentCard == "" && paymentBank == "") {
    		alert("결제방식과 결제번호를 입력하세요.");
    		return false;
    	}
    	if(paymentCard != "" && payMethodCard == "") {
    		alert("카드번호를 입력하세요.");
    		document.getElementById("payMethodCard").focus();
    		return false;
    	}
    	else if(buyer_addr==""){
    		alert("주소를 다 입력해주세요");
    		return false;
    	}
    	else if(paymentBank != "" && payMethodBank == "") {
    		alert("입금자명을 입력하세요.");
    		return false;
    	}
    	else if(buyer_postcode==""){
    		alert("주소를 다 입력해주세요");
    		return false;
    	}
    	myform.address.value = buyer_postcode+buyer_addr;
    	myform.tel.value = origenalTel;
    	
    	var ans = confirm("결재하시겠습니까?");
    	if(ans) {
    		if(paymentCard != "" && payMethodCard != "") {
    			document.getElementById("payment").value = "C"+paymentCard;
    			document.getElementById("payMethod").value = payMethodCard;
    		}
    		else {
    			document.getElementById("payment").value = "B"+paymentBank;
    			document.getElementById("payMethod").value = payMethodBank;
    		}
	    	myform.action = "${ctp}/myPage/payment";
	    	myform.submit();
    	}
    }
	  function addressSubmit() {
		  let postcode = myform.postcode.value;
		  let roadAddress = myform.roadAddress.value;
		  let detailAddress = myform.detailAddress.value;
		  let extraAddress = myform.extraAddress.value;
		  
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
				myform.buyer_postcode.value = postcode;
				myform.buyer_addr.value = roadAddress+detailAddress+extraAddress;
			 	 
		  }				
		}
	 
	  

	  
	  function couponBox() {
	      let str = '';
	      str += '<div>';
	      str += '<form name="couponForm">';
	      str += '<input type="text" name="couponUS" id="couponUS" class="btn btn-outline-warning" required="required"/>';
	      str += '<input type="button" onclick="couponUsCheck()" class="btn btn-warning" value="적용하기"/>';
	      str += '</form>';
	      str += '</div>';
	      $("#demo").html(str);
	    }
	  function pointBox() {
	      let str = '';
	      str += '<div>';
	      str += '<form name="pointForm">';
	      str += '<input type="number" max="${memberVO.point}" name="pointUS" id="pointUS" class="btn btn-outline-warning" required="required" oninput="limitInput(this)" />';	      
	      str += '<input type="button" onclick="pointUSCheck()" class="btn btn-warning" value="적용하기"/>';
	      str += '<div class="point-container">';
	      str += '사용 가능한 포인트: <span class="point-amount"><fmt:formatNumber value="${memberVO.point}" pattern="#,###"/></span>원';
	      str += '</div>';	      
	      str += '</form>';
	      str += '</div>';
	  	
	      $("#pointDemo").html(str);
	    }
	  function limitInput(inputElement) {
		  const max = parseInt(inputElement.max);
		  const currentInput = parseInt(inputElement.value);

		  if (currentInput > max) {
		    inputElement.value = max;
		  }
		}
	  
	  
	  function couponUsCheck() {
		  let couponUS = document.getElementById('couponUS').value;
		  let orderTotalPriceImsi = document.getElementById("orderTotalPriceImsi").value;
		  $.ajax({
		    type: "post",
		    url: "${ctp}/myPage/couponasUS",
		    data: { couponUS: couponUS },
		    success: function (res) {
		      if (res === "0") {
		        // 쿠폰이 없을 경우 처리
			        alert("이미 사용하신 쿠폰입니다1");		        	
		        if(res==null){
			        alert("이미 사용하신 쿠폰입니다2");		        	
		        }
		        let couponAmount = 0; // 쿠폰이 없는 경우에는 0으로 설정
		        // couponAmount 값을 JSP에서 사용
		      } else {
		    	  if(parseInt(orderTotalPriceImsi)<= res){
		    		  alert("금액에 맞지 않는 쿠폰입니다");
		    		  return false;
		    	  }
		        // 쿠폰이 있을 경우 처리
		        let couponAmount = res; // couponAmount 값을 받아옴
		        // couponAmount 값을 JSP에서 사용
		        let baesong = 0;
		        if (parseInt(orderTotalPriceImsi) <= 50000) baesong = 2500;
						
		        let totalAmount = parseInt(orderTotalPriceImsi) + baesong - res;

		        let formattedCouponPrice = parseInt(res).toLocaleString(); // res 값을 원하는 형식으로 포맷팅
		        $("#couponPrice").html(formattedCouponPrice); // couponPrice 요소에 포맷팅된 값 설정

		        let formattedTotalAmount = totalAmount.toLocaleString(); // totalAmount를 원하는 형식으로 포맷팅
		        document.getElementById("total").innerText = formattedTotalAmount; // totalAmount를 출력하는 HTML 요소에 값 설정
		        
		        document.getElementById("couponAmount").value = couponAmount; 
		      }
		    },
		  });
		}

	  function pointUSCheck() {
		  let pointUS = document.getElementById("pointUS").value;
		  let orderTotalPriceImsi = document.getElementById("orderTotalPriceImsi").value;
		  let pointUPdate = "";		
		  if(parseInt(orderTotalPriceImsi) < parseInt(pointUS)){
			  alert("포인트 사용금액이 제품 금액보다 큽니다");
			  return false;
		  }
		  
		  let baesong = 0;
      if (parseInt(orderTotalPriceImsi) <= 50000) baesong = 2500;
			
      let totalAmount = parseInt(orderTotalPriceImsi) + baesong-pointUS ;

      let formattedPointPrice = parseInt(pointUS).toLocaleString(); // res 값을 원하는 형식으로 포맷팅
      $("#pointPrice").html(formattedPointPrice); 
			  
      let formattedTotalAmount = totalAmount.toLocaleString(); // totalAmount를 원하는 형식으로 포맷팅
      document.getElementById("total").innerText = formattedTotalAmount; // totalAmo
      
      document.getElementById("pointAmount").value = pointUS; 
		}

  </script>
  <style>
    td, th {padding: 5px}
    
    .bener{
		  width: 100%;
		  height: 30px;
		  background-color: orange;
		  text-align: center;
		  color: white;
		  margin-top: 145px;
		  font-family: 'Montserrat', sans-serif;
		  font-size: 14px;
		  font-weight: bold;
		  display: flex;
		  align-items: center;
		  justify-content: center;
		}
		.checkout{
			width: 100%;			
			display: flex;
		  align-items: center;
		  justify-content: center;
		  height: 10vh; /* 컨테이너의 높이 설정 필요 */
		  font-weight: normal;
   		font-size: 42px;
   		line-height: 1.2380952380952381;
   		background-color: #f5f5f5;
		}
		.itemFont {
		  width: 80%;
		  align-items: flex-start;
		  justify-content: center;
		  font-weight: normal;
		  background-color: #f5f5f5;
		  margin: 0 auto;
		}

		#couponLink:hover {
   	 animation: blink 0.5s infinite;
	  }
	
	  @keyframes blink {
	    0% { opacity: 1; }
	    50% { opacity: 0.5; }
	    100% { opacity: 1; }
	  }
	  
	  
	  /* 전체 컨테이너 스타일 */
		.point-container {
		  font-family: Arial, sans-serif;
		  font-size: 16px;
		  color: #333; /* 텍스트 색상 */
		  background-color: #f7f7f7; /* 배경 색상 */
		  padding: 10px; /* 패딩 */
		  border-radius: 5px; /* 테두리 둥글게 */
		  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
		  display: inline-block; /* 요소를 인라인 블록으로 표시 */
		}
		
		/* 포인트 금액 스타일 */
		.point-amount {
		  font-weight: bold; /* 굵은 글씨 */
		  color: #ff5733; /* 포인트 금액의 특별한 색상 */
		}
	  
  </style>
</head>
<body>
   <jsp:include page="/WEB-INF/views/include/nav.jsp" />
   <div class="bener">배송비 할인 기회를 놓치지 마세요!</div>
   <p><br/></p>
	<h2 class="checkout">체크아웃</h2>	
  <div class="container">
		<br/>
		<table class="table-bordered text-center" style="margin:auto; width:90%">	  	 
		    
		  <!-- 주문서 목록출력 -->
		  <c:set var="orderTotalPrice" value="0"/>
		  <c:forEach var="vo" items="${sOrderVOS}">  <!-- 세션에 담아놓은 sOrderVos의 품목내역들을 화면에 각각 보여주는 작업처리 -->
		    <tr align="center">
		      <td><img src="${ctp}/dbShop/product/${vo.thumbImg}" width="150px"/></td>	    
		      <td align="left">
		        <p><br/>주문번호 : ${vo.orderIdx}</p>
		        <p class="text-center"><br/>
		          모델명 : <span style="color:orange;font-weight:bold;">${vo.productName}</span><br/>
		          &nbsp; <b><fmt:formatNumber value="${vo.mainPrice}"/>원</b>
		        </p><br/>
		        <c:set var="optionNames" value="${fn:split(vo.optionName,',')}"/>
		        <c:set var="optionPrices" value="${fn:split(vo.optionPrice,',')}"/>
		        <c:set var="optionNums" value="${fn:split(vo.optionNum,',')}"/>
		        <p>
		          - 주문 옵션 내역 : 총 ${fn:length(optionNames)}개<br/>
		          <c:forEach var="i" begin="1" end="${fn:length(optionNames)}">
		            &nbsp; &nbsp;ㆍ ${optionNames[i-1]} / <fmt:formatNumber value="${optionPrices[i-1]}"/>원 / ${optionNums[i-1]}개<br/>
		          </c:forEach> 
		        </p>
		      </td>
		      <td>
		        <b>총 : <fmt:formatNumber value="${vo.totalPrice}" pattern='#,###원'/></b><br/><br/>
		      </td>
		    </tr>
			  <%-- <input type="hidden" name="cartIdx" value="${idx}"/> --%>  <!-- 장바구니고유번호를 비롯한 주문된 상품의 정보들은 세션에 담겨있기에 굳이 따로 넘길필요없다. 즉 따로이 입력된 배송지 정보들만 넘긴다. -->
		    <c:set var="orderTotalPrice" value="${orderTotalPrice + vo.totalPrice}"/>	    	    
		  </c:forEach>
		</table>
		<table style="margin:auto; width:90%"><tr><td>
	  
	  	 
 				<tr>
				  <th>총 주문(결재) 금액</th>
				  <td>
				    <input type="hidden" name="orderTotalPriceImsi" id="orderTotalPriceImsi" value="${orderTotalPrice}"/>
				    상품가격(<fmt:formatNumber value="${orderTotalPrice}" pattern='#,###원'/>) +
				    배송비(<fmt:formatNumber value="${sOrderVOS[0].baesong}" pattern='#,###원'/>) -
				    할인금액(<span id="couponPrice"></span><span id="pointPrice"></span>) = 총
				    <font size="4" color="orange">
				      <b>
				        <span id="total">
				          <c:choose>
				            <c:when test="${couponAmount != null && couponAmount > 0}">
				              <fmt:formatNumber value="${orderTotalPrice + sOrderVOS[0].baesong - couponAmount}" pattern='#,###'/>
				            </c:when>
				            <c:otherwise>
				              <fmt:formatNumber value="${orderTotalPrice + sOrderVOS[0].baesong}" pattern='#,###'/>
				            </c:otherwise>
				          </c:choose>
				        </span>
				      </b>
				    </font>
				    원
				  </td>
				</tr>
			</table>
			<div style="display: flex; margin-top: 20px;">
			  <a onclick="couponBox()" id="couponLink" style="display: inline-block; text-decoration: underline; text-align: right;">
			    할인코드 입력하기
			  </a>
			  <div id="demo" style="margin-left: 20px;"></div>
		  </div>
		  <div style="display: flex; margin-top: 20px;">
			  <a onclick="pointBox()" id="pointLink" style="display: inline-block; text-decoration: underline; text-align: right;">
			   	포인트 사용하기
			  </a>
			  <div id="pointDemo" style="margin-left: 20px;"></div>
			</div>
	  		   
  </div>
  <div class="itemFont" >
  	<h4>[주문 시 꼭 확인해주세요]</h4>
	  <ul>
	  	<li>고객님의 정보는 모두 영문으로 입력해주세요.</li>
	  	<li>모든 제품은 스웨덴에서 발송됩니다. 배송비를 제외한 총 상품 금액이 미화 150불을 초과할 경우 관부가세가 발생할 수 있습니다.</li>
	  	<li>영업일은 공휴일과 주말을 제외한 평일을 의미하며 배송기일은 보장되지 않을 수 있습니다.</li>
	  	<li>자동 시스템으로 출고가 진행되어 주문 후 취소나 변경이 불가능할 수 있습니다.</li>
	  	<li>주문 상품의 무게나 크기에 따라 특정 배송옵션 선택이 불가능할 수 있습니다.</li>
	  	<li>상세주소란이 모자를 경우 영문도시명에 시/군/구 단위까지 입력하셔도 무방합니다.</li>
	  </ul>
	  <h4>[조명구입 시 유의사항]</h4>
	  <p>현행법상 조명을 자가사용 목적으로 수입할 경우 동일 제품을 동일 날짜에 2개 이상 수입할 수 없습니다. 따라서 조명은 제품 당 1개씩만 구입 가능합니다. (사업자로는 조명 구입불가)</p>
	  <h5>조명구입 예시:</h5>
	  <ul>
	  	<li>A 조명 2개 한 번에 구입 - 불가</li>
	  	<li>A 조명 1개 + B 조명 1개 구입 - 가능</li>
	  </ul>
	  <p>동일 조명 2개 이상 구매가 필요한 경우, 주문 전 고객센터로 문의주시기 바랍니다.</p>
  </div>
	<p><br/></p>
	<div class="container">
	<form name="myform" method="post">
	  <table class="table table-bordered text-center">
	    <tr>
	      <th colspan="2">
	        <h3>고객님 정보를 입력해주세요</h3>
	      </th>
	    </tr>
	    <tr>
			  <th width="40%">구매자이름</th>
			  <td><input type="text" name="buyer_name" value="${memberVO.name}" readonly class="form-control"/></td>
			</tr>
	    <tr>
			  <th>구매자메일주소(결제결과받는곳)</th>
			  <td><input type="text" name="buyer_email" value="${memberVO.email}" class="form-control"/></td>
			</tr>
	    <tr>
			  <th>구매자전화번호</th>
			  <td><input type="text" name="buyer_tel" value="${memberVO.tel}" class="form-control"/></td>
			</tr>
	    <tr>
			  <th>구매자주소</th>			  
			  <td class="text-left">
			  	<div style="display: flex; align-items: center;">			  	
				    <div style="width: 80%"><input type="text" name="buyer_postcode" readonly="readonly" class="form-control"/></div>
				  	<div style="margin-left: auto; align-items: center;"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">주소 검색</button></div>
				  </div>
			    <div class="mt-3"><input type="text" name="buyer_addr" readonly="readonly" class="form-control"/></div>			    
			  </td>
			</tr>
	    <tr>
			  <th>배송시요청사항</th>
			  <td><!-- <input type="text" name="message" class="form-control" placeholder="배송시요청사항을 기록하세요"/> -->
			    <select name="message" class="form-control">
			      <option>부재중 경비실에 맡겨주세요.</option>
			      <option>빠른 배송부탁합니다.</option>
			      <option>부재중 현관문 앞에 놓아주세요.</option>
			      <option>부재중 전달해주지 마세요.</option>
			    </select>
			  </td>
			</tr>
	    <tr>
			  <th>처리될 총 결제금액(테스트자료 10원)</th>
			  <%-- <td><input type="text" name="amount" value="${orderTotalPrice}" class="form-control" autofocus /></td> --%>
			  <td><input type="text" name="amount" value="10" class="form-control" autofocus readonly /></td>
			</tr>
		</table>
		<hr/>
		
	  <!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
      <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#card">카드결재</a></li>
	    <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#bank">은행결재</a></li>
	    <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#telCheck">상담사연결</a></li>
	  </ul>
	
	  <!-- Tab panes -->
	  <div class="tab-content">
	    <div id="card" class="container tab-pane active"><br>
	      <h3>카드결재</h3>
	      <p>
	        <select name="paymentCard" id="paymentCard">
	          <option value="">카드선택</option>
	          <option>국민카드</option>
	          <option>현대카드</option>
	          <option>신한카드</option>
	          <option>농협카드</option>
	          <option>BC카드</option>
	          <option>롯데카드</option>
	          <option>삼성카드</option>
	          <option>LG카드</option>
	        </select>
	      </p>
				<p>카드번호 : <input type="text" name="payMethodCard" id="payMethodCard"/></p>
	    </div>
	    <div id="bank" class="container tab-pane fade"><br>
	      <h3>은행결재(무통장입금)</h3>
	      <p>
	        <select name="paymentBank" id="paymentBank">
	          <option value="">은행선택</option>
	          <option value="국민은행">국민(111-111-111)</option>
	          <option value="신한은행">신한(222-222-222)</option>
	          <option value="우리은행">우리(333-333-333)</option>
	          <option value="농협">농협(444-444-444)</option>
	          <option value="신협">신협(555-555-555)</option>
	        </select>
	      </p>
				<p>입금자명 : <input type="text" name="payMethodBank" id="payMethodBank"/></p>
	    </div>
	    <div id="telCheck" class="container tab-pane fade"><br>
	      <h3>전화상담</h3>
	      <p>콜센터(☎) : 02-1234-1234</p>
	    </div>
	  </div>
		<hr/>
		<div align="center">
		  <button type="button" class="btn btn-primary" onClick="order()">결제하기</button> &nbsp;
			<button type="button" class="btn btn-info" onclick="location.href='${ctp}/myPage/myCart';">장바구니보기</button> &nbsp;
		  <button type="button" class="btn btn-success" onClick="location.href='${ctp}/';">계속 쇼핑하기</button>
		  <%-- <a href="${ctp}/dbShop/dbShopList" class="btn btn-secondary">계속쇼핑하기</a> --%>
		</div>
		<input type="hidden" name="orderVos" value="${orderVos}"/>
		<input type="hidden" name="address" />
    <%-- <input type="hidden" name="oIdx" value="${oIdx}"/>  --%>						<!-- 주문테이블 고유번호 -->
	  							<!-- 주문번호 -->
	  <input type="hidden" name="orderTotalPrice" value="${orderTotalPrice}"/>	<!-- 최종 구매(결제)금액 -->  
	  <input type="hidden" name="couponAmount" id="couponAmount" />	<!-- 최종 구매(결제)금액 -->  
	  <input type="hidden" name="pointAmount" id="pointAmount" />	<!-- 최종 구매(결제)금액 -->  
	  <input type="hidden" name="tel"/>	<!-- 최종 구매(결제)금액 -->
	  <input type="hidden" name="mid" value="${sMid}"/>
	  <input type="hidden" name="payment" id="payment"/>			<!-- 결재종류 : 카드/계좌이체 등. -->
	  <input type="hidden" name="payMethod" id="payMethod"/>	<!-- 결재방법중에서 카드번호/계좌번호 등. -->
	  
	  <input type="hidden" name="name" value="${memberVO.name}"/>	<!-- 결재창으로 넘겨줄 모델명 -->
	  <%-- <input type="hidden" name="amount" value="${orderTotalPrice}"/> --%>	<!-- 결재창으로 넘겨줄 결제금액 -->  
	  <div class="modal fade" id="myModal">
	    <div class="modal-dialog  modal-dialog-centered">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title">'우편번호찾기'를 클릭~!</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body">
			      <label for="address">주소</label>
			      <div class="input-group mb-1">
			        <input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호" class="form-control">
			        <div class="input-group-append">
			          <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-primary">
			        </div>
			      </div>
			      <input type="text" name="roadAddress" id="sample6_address" size="50" placeholder="주소" class="form-control mb-1">
			      <div class="input-group mb-1">
			        <input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소" class="form-control"> &nbsp;&nbsp;
			        <div class="input-group-append">
			          <input type="text" name="extraAddress" id="sample6_extraAddress" placeholder="참고항목" class="form-control">
			        </div>
			      </div>
			    </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <button type="button" class="btn btn-primary" onclick="addressSubmit()" data-dismiss="modal" >Check</button>
	          <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
	        </div>
	        
	      </div>
	    </div>
	  </div>
	</form>
</div>
   <p><br/></p>
   <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>