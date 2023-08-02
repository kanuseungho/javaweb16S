<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>My Page</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <jsp:include page="/WEB-INF/views/include/nav.jsp" />
  <style>
    body {
      background-color: #f2f2f2;
      font-family: Arial, sans-serif;
    }

    .sidebar {
      width: 200px;
      height: 100%;
      position: fixed;
      top: 0;
      left: 0;
      background-color: #ffffff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      padding: 20px;
      margin-top: 150px;
    }

    .sidebar h3 {
      font-size: 18px;
      font-weight: bold;
      margin-bottom: 20px;
      color: #333333;
    }

    .sidebar ul {
      list-style-type: none;
      padding: 0;
      margin: 0;
    }

    .sidebar li {
      margin-bottom: 10px;
      padding: 10px;
      background-color: #ffffff;
      border-top: 5px solid #cccccc;
      border-bottom: 5px solid #cccccc;
      transition: background-color 0.3s ease;
    }

    .sidebar li a {
      text-decoration: none;
      color: #333333;
    }

    .sidebar li:hover {
      background-color: #f5f5f5;
    }

    .content {
      margin-left: 220px;
      padding: 20px;
      background-color: #ffffff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
   /* 쿠폰 컨테이너 스타일링 */
		.coupon {
		  background-color: #f5f5f5;
		  border: 1px solid #ccc;
		  border-radius: 50px; /* 반지름을 요소의 높이의 절반으로 설정 */
		  padding: 10px;
		  width: 200px;
		  text-align: center;
		}
		
		/* 쿠폰 제목 스타일링 */
		.coupon .title {
		  font-size: 18px;
		  font-weight: bold;
		  margin-bottom: 10px;
		}
		
		/* 쿠폰 설명 스타일링 */
		.coupon .description {
		  font-size: 14px;
		  margin-bottom: 10px;
		}
		
		/* 쿠폰 코드 스타일링 */
		.coupon .code {
		  font-size: 20px;
		  font-weight: bold;
		  color: #ff0000;
		}
		
		/* 쿠폰 만료일 스타일링 */
		.coupon .expiration {
		  font-size: 12px;
		  color: #888;
		}
		
	.coupon{
		width: 400px;
		height: 200px;
		border-radius: 10px;
		overflow: hidden;
		margin: auto;
		display: flex;
		align-items: stretch;
		position: relative;
		text-transform: uppercase;
		color: black;		
		filter: drop-shadow(0 3px 5px rgba(0, 0, 0, 0.5));
	}
	.coupon::before,
	.coupon::after {
		content:  '';
		position: absolute;
		top: 0;
		width: 50%;
		height: 100%;
		z-index: -1;			
	}
	.coupon::before{
		left: 0;
		background-image: radial-gradient(circle at 0 50%, transparent 25px, gold 26px);	 
	}
	.coupon::after {
		right: 0;
		background-image: radial-gradient(circle at 100% 50%, transparent 25px, gold 26px);
	}
	.coupon > div {
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.left {
		width: 80px;
		border-right: 2px dashed rgba(0, 0, 0, 0.15);
	}
	.left div{
		transform: rotate(-90deg);
		white-space: nowrap;
		font-weight: bold;
	}
	.center{
		flex-grow: 1;
		text-align: center;
	}
	.right{
		width: 120px;
		background-image: radial-gradient(circle at 100% 50%, transparent 25px, #fff 26px);
	}
	.right div{
		font-family: 'Libre Barcode 128 Text',
		cursive;
		font-size: 2.5 rem;
		transform: rotate(-90deg);
	}
	.center h2{
		background: #111;
		color: gold;
		padding: 0 10px;
		font-size: 2.15rem;
		white-space: nowrap;
	}
	.center h3{
		font-size: 2.15rem;
	}
	.center small {
		font-size: 0.625rem;
		font-weight: 600;
		letter-spacing: 2px;
	}
	
	
	
  </style>
  <script>
    function changeContent(view) {
      var contentElement = document.getElementById('content');
      var url = '<c:url value="/WEB-INF/views/myPage/${param.view}.jsp" />';
      url = url.replace("${param.view}", view);
      var xhttp = new XMLHttpRequest();
      xhttp.onreadystatechange = function() {
        if (this.readyState === 4 && this.status === 200) {
          contentElement.innerHTML = this.responseText;
        }
      };
      xhttp.open("GET", url, true);
      xhttp.send();
    }
    function couponGetCheck(couponCode, button,idx) {
        $.ajax({
            url: '${ctp}/myPage/couponGetUpdate',
            type: 'POST',
            data: {code: couponCode,idx:idx},
            success: function(response) {
                if (response === '1') {
                    alert("결제 하실 때 쿠폰 번호를 입력해주세요!");
                    var couponElement = button.parentElement.previousElementSibling;
                    couponElement.style.display = 'none';
                    button.style.display = 'none';
                } else {
                    alert("발급 실패 ㅠ 이미 사용한 듯!");
                }
            }
        });
    }
</script>
</head>
<body>
  <div class="sidebar">
    <h3>My Page</h3>
    <ul>
      <li><a href="${ctp}/myPage/paymentResultOk" onclick="changeContent('myCart')">주문 내역</a></li>
      <li><a href="${ctp}/myPage/loveInProduct" onclick="changeContent('wishlist')">관심상품</a></li>
      <li><a href="${ctp}/myPage/chatGtp" onclick="changeContent('consultation')">1:1챗봇상담</a></li>
      <li><a data-toggle="modal" data-target="#myModal">할인쿠폰</a></li>
      <li><a href="${ctp}/myPage/myClaim" onclick="changeContent('reviews')">내 문의</a></li>   
      <li><a href="${ctp}/myPage/profile">회원정보수정</a></li>
      <li><a href="${ctp}/myPage/deliveryUpdate" onclick="changeContent('shipping')">배송지 수정</a></li>
      <li><a href="${ctp}/myPage/secession">회원 탈퇴</a></li>
    </ul>
  </div>
  <div class="content" id="content">

  </div>
  <div class="modal" id="myModal">
  <div class="modal-dialog modal-dialog-centered modal-xl">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
			<div class="modal-body">
			<c:forEach var="vo" items="${sCuponVOS}">
		    <c:if test="${vo.couponMid =='mid'}">
	        <div class="coupon" id="coupon_${vo.idx}">
            <div class="left">
                <div>${vo.couponName}</div>
            </div>
            <div class="center">
              <div>
                <h2>${vo.couponAmount}￦</h2>
                <h3>Coupon</h3>
                <small>${vo.expirationDate}</small>
              </div>
            </div>
            <div class="right">
              <div>${vo.couponCode}</div>
            </div>
       	  </div>
       		<div style="text-align: right;">
            <input type="button" value="쿠폰 발급" class="btn btn-warning btn-sm" onclick="couponGetCheck('${vo.couponCode}', this,'${vo.idx}')" />
	        </div>
		    </c:if>
			</c:forEach>
			</div>



      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
</body>
</html>
