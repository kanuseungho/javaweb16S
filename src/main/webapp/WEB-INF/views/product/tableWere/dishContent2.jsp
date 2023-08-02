<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Include Bootstrap 4 styles -->
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <script src="https://kit.fontawesome.com/f31f2dda49.js" crossorigin="anonymous"></script>  
  <style>
	  body, html {
	    margin: 0;
	    padding: 0;
		}
    .product-container {
      display: flex;
      justify-content: center;
      align-items: flex-start; /* 세로 정렬을 위해 align-items를 flex-start로 변경 */
    }

    /* Left half for the main product image */
    .product-image {
      flex: 1;
      text-align: center;
      border: 1px solid #ccc;
      max-width: 600px;
      margin-bottom: 20px;
      position: relative;
    }
    .heart-icon-container {
 			position: absolute;
  		bottom: 10px;
  		right: 10px;
  		color: red;
  		font-size: 40px; /* Adjust the font-size as needed */
		}
    

    /* Right half for product details and options */
    .product-details {
      flex: 1;
      display: flex; /* 장바구니 버튼을 오른쪽에 붙이기 위해 부모 요소도 flex로 설정 */
      flex-direction: column; /* 세로 정렬을 위해 flex-direction을 column으로 변경 */
      align-items: flex-start; /* 오른쪽 정렬을 위해 align-items를 flex-start로 변경 */
      text-align: left;
    }

    /* Product image size */
    .product-image img {
      max-width: 100%;
      height: auto;
      max-height: 600px;
    }

    /* Product name and description */
    .product-name {
      font-size: 30px;
      margin: 5px 0;
      text-align: left;
    }
    .product-description{
    	font-size: 15px;
      margin: 5px 0;
      text-align: left;
    }

    /* Product options select box */
    .product-options {
      margin-bottom: 10px;
      width: 100%; /* Set the width to 100% to make it longer */
    }

    /* Sale and original price */
    .product-price {
      font-size: 20px;
      align-items: flex-start; /* Change to flex-start to align prices to the left */
      display: inherit;
      
    }

    .product-details .product-price {
      margin-top: 0;
    }

    .product-sale-price {
      font-size: 18px;      
      margin-right: 10px;
    }

    /* Add to cart button */
    .add-to-cart-button {
      background-color: #4ec791;
      color: #fff;
      font-size: 20px;
      padding: 30px 100px;
      border: none;
      cursor: pointer;
      max-width: 100%;
      margin-left: 55px;
    }
    .add-to-cart-button-ja {
      background-color: #FE9A2E;
      color: #fff;
      font-size: 20px;
      padding: 30px 100px;
      border: none;
      cursor: pointer;
      max-width: 100%;
      margin-left: 55px;
    }

    /* Stock status */
    .stock-status {
      font-size: 10px;
      color: green;
      margin-top: 5px;
      margin-left: 30%;
    }

    /* Common description box */
    .common-description {
      font-size: 14px;
      text-align: left;
      border: 1px solid #ccc;
      padding: 10px;
      margin-top: 40px;
      width: 100%; /* Set the width to 100% to make it align with the product options */
    }

    /* Optional: Add some hover and focus effects */
    input[type="number"]:hover,
    input[type="number"]:focus {
      border-color: #0056b3;
      box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
    }

    #content img {
      max-width: 24%;
      max-height: 250px;
      height: auto;      
      margin: 0.5%; 
    }
		.common-description i {
			margin: 20px;
		}
		.product-name-label {
		  display: inline-block;
		  border: 1px solid #ccc;
		  padding: 5px 90px;
		  background-color: #f0f0f0;
		  border-radius: 5px;
		  cursor: pointer;
		}
		.product-options input[type="number"]{
			margin-left: 20px;
			background-color: #f0f0f0;			
			height: 45px;			
		}
		
		.product-name-container {
		  /* 추가적인 스타일링 */
		}
		.product-price-item{
			width: 100px;
		}
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
		.btn-danger{
			 float: right;
		}
		
	
	.thumb-container {
	  position: fixed;
	  top: 25%;
	  left: 80%;
	  transform: translate(-50%, -50%);
	  animation: thumb-shake 3s;
	  animation-fill-mode: forwards;
	}
	
	@keyframes thumb-shake {
	  0% { transform: rotate(0deg); }
	  25% { transform: rotate(15deg); }
	  50% { transform: rotate(0deg); }
	  75% { transform: rotate(-15deg); }
	  100% { transform: rotate(0deg); }
	}
	
	.hidden {
	  display: none; 
	}

.review-card {
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 10px;
    margin-bottom: 20px;
    display: flex;
    align-items: flex-start;
  }

  .review-photo {
    max-width: 150px;
    height: auto;
    border-radius: 8px;
    margin-right: 15px;
  }

  .review-details {
    flex: 1;
  }

  .review-rating {
    font-size: 18px;
    margin: 5px 0;
  }

  .review-content {
    margin-top: 15px;
  }
  
  
  
  
 .star {
    display: inline-block;
    width: 25px;
    height: 25px;
    background-image: url("별의 CSS 이미지 URL");
    background-size: cover;
  }

  .half-star {
    background-position: 0 -25px; /* 별 이미지에서 반개 별 위치로 설정 */
  }
   .Star{
     display: flex;
      -webkit-box-align: start;
      align-items: center;
  }
   .Star .SScor{
      font-weight: 700;
    font-size: 20px;
    color: rgb(62, 62, 62);
    margin: 6px 0px 3px 8px;
   }
   
   
    /* 꽉 찬 별 */
    .fullstar {
      display: inline-block;
      width: 0;
      height: 0;
      border-left: 10px solid transparent;
      border-right: 10px solid transparent;
      border-bottom: 20px solid #f1c40f; /* 별 색상은 여기에 설정 */
    }
    .half-star {
      position: relative;
      display: inline-block;
      width: 0;
      height: 0;
      border-left: 10px solid transparent;
      border-right: 10px solid transparent;
      border-bottom: 10px solid #f1c40f; /* 별 색상은 여기에 설정 */
      transform: rotate(45deg); /* 45도 회전하여 반개 별 표현 */
    }
     .empty-star {
      display: inline-block;
      width: 0;
      height: 0;
      border-left: 10px solid transparent;
      border-right: 10px solid transparent;
      border-bottom: 20px solid #ccc; /* 빈 별 색상은 여기에 설정 */
    }
  </style>
  <!-- JavaScript function for number formatting -->
  <script type="text/javascript">
    function numberWithCommas(x) {
      return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
    }
    
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
    
    // 직접 주문하기
    function order() {
    	let totalPrice = document.getElementById("totalPrice").value;
    	if('${sMid}' == "") {
    		alert("로그인 후 이용 가능합니다.");
    		location.href = "${ctp}/member/memberLogin";
    	}
    	else if(totalPrice=="" || totalPrice==0) {
    		alert("옵션을 선택해주세요");
    		return false;
    	}
    	else {
    		document.getElementById("flag").value = "order";
    		document.myform.submit();
    	}
    }
    
    
 		// 등록(추가)시킨 옵션 상품 삭제하기
    function remove(idx) {
  	  $("div").remove("#layer"+idx);
  	  if($(".price").length) onTotal();
  	  else location.reload();
    }
    
    let idxArray = new Array();
    function onTotal() {
    	  let total = 0;
    	  for(let i=0; i<idxArray.length; i++) {
    		  if($("#layer"+idxArray[i]).length != 0) {
    		  	total +=  parseInt(document.getElementById("price"+idxArray[i]).value);
    		  	document.getElementById("totalPriceResult").value = total;
    		  }
    	  }
    	  document.getElementById("totalPrice").value = numberWithCommas(total);
      }
      
      // 수량 변경시 처리하는 함수
      function numChange(idx) {
      	let price = document.getElementById("statePrice"+idx).value * document.getElementById("numBox"+idx).value;
      	document.getElementById("imsiPrice"+idx).value = numberWithCommas(price);
      	document.getElementById("price"+idx).value = price;
      	onTotal();
      }
      function cart() {
    	  
    	  if ('${sMid}' == "") {
    	    alert("로그인 후 이용 가능합니다.");
    	    location.href = "${ctp}/member/memberLogin";
    	  }
    	  else if (document.getElementById("totalPrice").value == 0) {
    	    alert("옵션을 선택해주세요");
    	    return false;
    	    
    	  } 
    	  else {
    	    let thumbContainer = document.getElementById("thumb-container");

    	    // 이미지 보이기
    	    thumbContainer.classList.remove("hidden");

    	    // 2초 후에 숨기기
    	    setTimeout(function() {
    	      thumbContainer.classList.add("hidden");
    	      document.myform.submit(); 
    	    }, 1500);

    	    
    	  }
    	}
			

      $(function(){
      	$("#selectOption").change(function(){
      		let selectOption = $(this).val();
      		let idx = selectOption.substring(0,selectOption.indexOf(":"));					// 현재 옵션의 고유번호
      		let optionName = selectOption.substring(selectOption.indexOf(":")+1,selectOption.indexOf("_"));	// 옵션명
      		let optionPrice = selectOption.substring(selectOption.indexOf("_")+1);	// 옵션가격
      		let commaPrice = numberWithCommas(optionPrice);			// 콤마붙인 가격
      		
      		// 선택박스의 내용을 한개라도 선택하게된다면 선택된 옵션의 '고유번호/옵션명/콤마붙인가격'을 화면에 출력처리해준다.
      		if($("#layer"+idx).length == 0 && selectOption != "") {		// 옵션이 하나라도 있으면 처리하게 된다.
      		  idxArray[idx] = idx;
      		  
  	    		let str = '';
  	    		str += '<div class="layer row" id="layer'+idx+'"><div class="col">'+optionName+'</div>';
  	    		str += '<input type="number" class="text-center numBox" id="numBox'+idx+'" name="optionNum" onchange="numChange('+idx+')" value="1" min="1" max="${productVO.recipe}"  onkeydown="return false;"/> &nbsp;';
  	    		str += '<input type="text" id="imsiPrice'+idx+'" class="price" value="'+commaPrice+'" readonly />';
  	    		str += '<input type="hidden" id="price'+idx+'" value="'+optionPrice+'"/> &nbsp;';			/* 변동되는 가격을 재계산하기위해 price+idx 아이디를 사용하고 있다. */
  	    		str += '<input type="button" class="btn btn-outline-danger btn-sm" onclick="remove('+idx+')" value="삭제"/>';
  	    		str += '<input type="hidden" name="statePrice" id="statePrice'+idx+'" value="'+optionPrice+'"/>';		/* 현재상태에서의 변경된 상품(옵션)의 가격이다. */
  	    		str += '<input type="hidden" name="optionIdx" value="'+idx+'"/>';
  	    		str += '<input type="hidden" name="optionName" value="'+optionName+'"/>';
  	    		str += '<input type="hidden" name="optionPrice" value="'+optionPrice+'"/>';
  	    		str += '</div>';
  	    		$("#product1").append(str);
  	    		onTotal();
      	  }
      	  else {
      		  alert("이미 선택한 옵션입니다.");
      	  }
      	});
      });
       function dibsCheck(idx) {
    	   $.ajax({
    	     type: "post",
    	     url: "${ctp}/product/productlikeGood",
    	     data: { idx: idx },
    	     success: function(res) {
    	       if (res == 1) {
    	         alert("목록에 추가되었습니다.");
    	         setCookie("dibs_" + idx, "true", 365);
    	         $("#heartIcon").html("<i class='fa-solid fa-check' alt='찜하기'></i>");
    	       } else if (res == 0) {
    	         alert("취소되었습니다.");
    	         setCookie("dibs_" + idx, "false", 365);
    	         $("#heartIcon").html("<i class='fa-regular fa-heart' alt='찜하기'></i>");
    	       }
    	     },
    	     error: function() {
    	       alert("전송 오류!");
    	     }
    	   });
    	 }

    	 function setCookie(name, value, days) {
    	   var expires = "";
    	   if (days) {
    	     let date = new Date();
    	     date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
    	     expires = "; expires=" + date.toUTCString();
    	   }
    	   document.cookie = name + "=" + value + expires + "; path=/";
    	 }

    	 function getCookie(name) {
    	   let nameEQ = name + "=";
    	   let cookies = document.cookie.split(";");
    	   for (let i = 0; i < cookies.length; i++) {
    	     var cookie = cookies[i];
    	     while (cookie.charAt(0) === " ") {
    	       cookie = cookie.substring(1, cookie.length);
    	     }
    	     if (cookie.indexOf(nameEQ) === 0) {
    	       return cookie.substring(nameEQ.length, cookie.length);
    	     }
    	   }
    	   return null;
    	 }

    	 $(document).ready(function() {
    	   let idx = "${productVO.idx}";
    	   let check = getCookie("dibs_" + idx);
    	   let heartIcon = $("#heartIcon");
					
    	   
    	   if (check === "true") {
    	     heartIcon.html("<i class='fa-solid fa-check' alt='찜하기'></i>");
    	   } else {
    	     heartIcon.html("<i class='fa-regular fa-heart' alt='찜하기'></i>");
    	   }
    	 });

    	 
    	 
    	 
    	
  </script>
 
</head>
<body>
  <jsp:include page="/WEB-INF/views/include/nav.jsp" />  
  <div class="bener">
		<a href="#">${noticeVO.topBanner}</a>
	</div>
  <p><br/></p>
  <div class="container">
    <div class="row">
      <div class="col p-3 product-container">
        <!-- Left half: Product main image -->
        <div class="product-image">                       
				  <a href="javascript:dibsCheck(${productVO.idx})" class="heart-icon-container">
				    <span id="heartIcon"><i class="fa-regular fa-heart" alt="찜하기"></i></span>
				  </a>				  
				  <img src="${ctp}/dbShop/product/${productVO.FSName}" alt="Product Image" />
				</div>
        <c:if test="${productVO.sale=='YES'}">
         <div class="sale-banner">SALE</div>
        </c:if>
        <!-- Right half: Product details and options -->
        <div class="col p-3 product-details">
          <!-- Product basic information -->
          <div>
            <h3 class="product-name">${productVO.productName}</h3>
            <h3 class="product-description">${productVO.detail}</h3>
          </div>
          <!-- Product options -->
          <div class="product-options">
            <form name="optionForm"> <!-- Form to display option information -->
              <select size="1" class="form-control" id="selectOption">
                <option value="" disabled selected>상품옵션선택</option>
                <c:if test="${productVO.sale=='NO'}">
                	<option value="0:기본품목_${productVO.mainPrice}">${productVO.productName}</option>
                </c:if>
                <c:if test="${productVO.sale=='YES'}">                
                	<option value="0:기본품목_${productVO.salePrice}">${productVO.productName}</option>
                </c:if>
                <c:forEach var="vo" items="${optionVOS}">
                  <option value="${vo.idx}:${vo.optionName}_${vo.optionPrice}">
                    ${vo.optionName}
                  </option>
                </c:forEach>
              </select>
              <label for="quantity">
							  <div class="product-name-label">
							    <div class="product-name-container"><img src="${ctp}/dbShop/product/${productVO.FSName}" alt="Product Image" style="width: 45px; height: 45px;" />${productVO.productName}</div>
							  </div>
							</label>
            </form>
          </div>
          <h3 class="product-price">
          	<c:if test="${productVO.sale=='YES'}">
	            <font class="product-price-item">
	              <div style="color: red;">₩<fmt:formatNumber value="${productVO.salePrice}"/></div>
	              <div style="text-decoration: line-through;  color: #A4A4A4">₩<fmt:formatNumber value="${productVO.mainPrice}"/></div>
	              <div style=" color: #A4A4A4; font-size: 10px;">가격 (세금불포함)</div>
	            </font>
            </c:if>
            <c:if test="${productVO.sale=='NO'}">
            	<font class="product-price-item">	            
	              <div style="color: #151515">₩<fmt:formatNumber value="${productVO.mainPrice}"/></div>
	              <div style=" color: #A4A4A4; font-size: 10px;">가격 (세금불포함)</div>
	            </font>
            </c:if> 
            <c:if test="${productVO.productDel =='NO'}">
          		<button class="add-to-cart-button" onclick="cart()"><i class="fa-solid fa-basket-shopping" style="color: #e2e5e9;"></i>&nbsp; 장바구니에 담기 </button>
          	</c:if>          	
            <c:if test="${productVO.productDel =='YES'}">
          		<button class="add-to-cart-button-ja" ><i class="fa-solid fa-basket-shopping" style="color: #e2e5e9;"></i>&nbsp; 재입고예정 </button>
          	</c:if>          	
          </h3>
          <br/>
  
          <div id="thumb-container" class="thumb-container hidden">
  					<img src="${ctp}/images/thumbs_up.gif" alt="Thumb Image">
					</div>

          <!-- Stock status -->
          <div class="stock-status"><img src="${ctp}/images/box.jpg"/>한국까지 직배송비: ₩19,800</div>
          <form name="myform" method="post">  <!-- 실제 상품의 정보를 넘겨주기 위한 form -->
			    <input type="hidden" name="mid" value="${sMid}"/>
			    <input type="hidden" name="productIdx" value="${productVO.idx}"/>
			    <input type="hidden" name="productName" value="${productVO.productName}"/>
			    
			    <c:if test="${productVO.sale=='NO'}">
			    	<input type="hidden" name="mainPrice" value="${productVO.mainPrice}"/>
			    </c:if>
			    <c:if test="${productVO.sale=='YES'}">
			    	<input type="hidden" name="mainPrice" value="${productVO.salePrice}"/>
			    </c:if>
			    
			    <input type="hidden" name="thumbImg" value="${productVO.FSName}"/>
			    <input type="hidden" name="totalPrice" id="totalPriceResult"/>
			    <input type="hidden" name="recipe" id="recipe" value="${productVO.recipe}"/>
			    <input type="hidden" name="brendContentIdx" id="brendContentIdx" value="${productVO.brendContentIdx}"/>
			    <input type="hidden" name="flag" id="flag"/>
			    <div id="product1"></div>
			  	</form>
			  	<b>총금액<input type="text" class="totalPrice text-right" id="totalPrice" style=" position: absolute; right: 20px; margin-top: 10px;" value="<fmt:formatNumber value='0'/>" readonly /></b>
        <div class="common-description">
		      <i class="fa-solid fa-check" style="color: #FACC2E;"></i>&nbsp; 18만원 이상 구매 시 한국 무료 직배송<br/>
		      <i class="fa-solid fa-check" style="color: #FACC2E;"></i>&nbsp; 매일 진행되는 세일 (기획전 모아보기)<br/>
		      <i class="fa-solid fa-check" style="color: #FACC2E;"></i>&nbsp; 카톡채널 추가 시 5% 할인코드 증정 (채널 추가하기)<br/>
		      <i class="fa-solid fa-check" style="color: #FACC2E;"></i>&nbsp; 해외 결제 수수료 'NO!' & 카드사별 무이자 할부 혜택		      		     
		    </div>
        </div>
      </div>
    </div>    
    <br/><br/>
    <div class="accordion">
		  <div class="item">
		    <div class="item-header" onclick="toggleAccordion(this)">상세 정보 <span class="arrow"><i class="fa-solid fa-arrow-down fa-xl" style="color: #424242"></i></span></div>
		    <div class="item-content">
	        ${productVO.detail}
		    </div>
		  </div>
	    <div class="item">
	      <div class="item-header" onclick="toggleAccordion(this)">제품정보 <span class="arrow"><i class="fa-solid fa-arrow-down fa-xl" style="color: #424242"></i></span></div>
	      <div class="item-content">
				  <div class="left-content">
				    <div>브랜드:</div>
				    <div>디자이너:</div>
				    <div>갯수:</div>
				    <div>크기:</div>
				    <div>제품 코드:</div>
				  </div>
				  <div class="right-content">
				    <div>${productVO.brend}</div>
				    <div>${productVO.disingenuous}</div>
				    <div>${productVO.recipe}개</div>
				    <div>${productVO.size}</div>
				    <div>${productVO.productCode}</div>
				  </div>
				</div>
	    </div>
	    <div class="item">
		    <div class="item-header" onclick="toggleAccordion(this)">고객 리뷰 <span class="arrow"><i class="fa-solid fa-arrow-down fa-xl" style="color: #424242"></i></span></div>
		    <div class="item-content">
	        아직 리뷰가 없습니다. 이 제품을 구입하고 첫 리뷰의 주인공이 되어보세요!
		    </div>
		  </div>
		  <div class="item">
		    <div class="item-header" onclick="toggleAccordion(this)">Scandi Living | 스칸다 리빙 소개 <span class="arrow"><i class="fa-solid fa-arrow-down fa-xl" style="color: #424242"></i></span></div>
		    <div class="item-content">
	        스웨덴 브랜드 스칸디리빙은 식기, 커트러리, 러그, 조명 등 다양한 제품을 선보입니다. 전형적인 북유럽 디자인의 진수를 보여주는 스칸디리빙의 제품을 만나보세요.
		    </div>
		  </div>
		  <div class="item">
		    <div class="item-header" onclick="toggleAccordion(this)">문의 사항 <span class="arrow"><i class="fa-solid fa-arrow-down fa-xl" style="color: #424242"></i></span></div>
		    <div class="item-content">
		    	
	        한국어 이메일문의 info@nordicnest.kr
	        
					문의사항이 있나요? 카카오톡 채널 추가 후 상담원에게 1:1 문의를 해보세요! <a href="${ctp}/myPage/chatGtp">(바로가기)</a>
		    </div>
		  </div>    
	  </div>
    <!-- Product detailed description -->
    <div id="content"><br/>
      ${productVO.content}
    </div>
		<c:forEach var="vo" items="${reviewVOS}">
		  <div class="review-card">
		    <img class="review-photo" src="${ctp}/data/review/${vo.freviewSAName}" alt="Review Photo">
		    <div class="review-details">
		      <div><strong>작성자:</strong> ${vo.mid}</div>
		      <div><strong>제품:</strong> ${vo.productName}</div>
		      <div><strong>선택 옵션:</strong> ${vo.optionName}</div>
		      <div class="review-rating"><strong>점수</strong>
						<div class="Star">
							<!-- 짝수 별 -->
							<c:if test="${vo.star%2 == 0}">
								<c:forEach begin="0" end="4" step="1" varStatus="st" >
									<c:if test="${st.index+1 <= vo.star/2}">
										<span style="width:25px"><img src="${ctp}/images/starfull.png" width="100%"/></span>
									</c:if>
									<c:if test="${st.index+1 > vo.star/2}">
										<span style="width:25px"><img src="${ctp}/images/starbin.png" width="100%"/></span>
									</c:if>
								</c:forEach>
							</c:if>
							<!-- 홀수 별 -->
							<c:if test="${vo.star%2 != 0}">
								<c:set var="str" value="${(vo.star-1)/2}" />
								<c:forEach begin="0" end="4" step="1" varStatus="st" >
									<c:if test="${st.index+1 <= str}">
										<span style="width:25px"><img src="${ctp}/images/starfull.png" width="100%"/></span>
									</c:if>
									<c:if test="${st.index+1 == str+1}">
										<span style="width:25px"><img src="${ctp}/images/starhalf.png" width="100%"/></span>
									</c:if>
									<c:if test="${st.index+1 > str && st.index+1 != str+1}">
										<span style="width:25px"><img src="${ctp}/images/starbin.png" width="100%"/></span>
									</c:if>
								</c:forEach>
							</c:if>
							<div class="SScor">${vo.star}</div>
						</div>
            
					</div>
		      <div class="review-content"><strong>상세 내용:</strong> ${vo.reviewText}</div>
		    </div>
		  </div>
		</c:forEach>
	<input type="button" value="돌아가기" onclick="history.back()" class="btn btn-danger"/>
  <p><br/></p>
  <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
