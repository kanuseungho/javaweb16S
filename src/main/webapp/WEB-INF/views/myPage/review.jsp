<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <style type="text/css">
  	 .memberInfo {
      margin-top: 100px;
      background-color: black;
      padding: 20px;
      border-radius: 5px;
    }
    
    .memberHead {       
      margin-bottom: 20px;
    }
    
    .memberHead h3 {
      color: white;
      font-weight: bold;
      font-size: 15px;
    }
    
    .member-List {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
    }
    
    .memberImg img {
      margin-left: 50px;
      width: 150px;
      height: 150px;
      border-radius: 50%;
      object-fit: cover;
    }
    
    .memberNLD {
      margin-left: 20px;
    }
    
    .memberName {
      font-size: 50px;
      font-weight: bold;
      color: #333;
      margin-bottom: 5px;
      color: white;
    }
    
    .memberLevel {
      font-size: 16px;
      font-weight: bold;
      margin-bottom: 5px;
      color: white;
    }
    
    .memberDate {
      font-size: 14px;
      font-weight: bold;
      color: #999;
    }
    
    .memberPoint {
      text-align: center;
      font-size: 18px;
      color: white;
      margin: 20px;
    }
    
    .magin {
      margin-left: 40%;
    }
     .title-banner {
		    display: grid;
		    grid-template-columns: repeat(8, 1fr);
		    font-weight: bold;
		    background-color: #f2f2f2;
		    padding: 5px;
		    border-bottom: 1px solid #ddd;
		  }
		
		  .title-banner > div {
		    padding: 5px;
		    text-align: center;
		  }
		
		  .title-item {
		    display: grid;
		    grid-template-columns: repeat(8, 1fr);
		    padding: 5px;
		  }
		
		  .title-item > div {
		    padding: 5px;
		    text-align: center;
		  }
		  .hugi{
		    border-bottom: 1px solid #ddd;
		    padding-bottom: 20px;
		  }
		
		  h3 {
		    border-bottom: 1px solid #ddd;
		    margin-bottom: 10px;
		  }
		
		  ul {		    
		    padding-left: 0;
		  }
		
		  li {
		    opacity: 0.7;
		  }
		  
		  .contassiner {
		    display: flex;
		    align-items: center;
		  }
		
		  .contassiner img {
		    width: 100px;
		    height: 100px;
		    object-fit: cover;
		    border-radius: 5px;
		    margin-right: 10px;
		  }
		
		  .contassiner > div {
		    display: flex;
		    flex-direction: column;
		  }
		  
		  
		  .star {
		    position: relative;
		    font-size: 2rem;
		    color: #ddd;
		  }
		  .star span {
		    width: 0;
		    position: absolute; 
		    left: 0;
		    color: orange;
		    overflow: hidden;
		    pointer-events: none;
		  }
		  .star input {
		    width: 100%;
		    height: 100%;
		    position: absolute;
		    left: 0;
		    opacity: 0;
		    cursor: pointer;
		  }
		  
		  
		  .constOk {
		    display: flex;
		    align-items: center;
		    background-color: #585858;
		    padding: 10px;
		    border-radius: 5px;
		    color: white;
		  }
		
		  .constOk img {
		    width: 100px;
		    height: 100px;
		    object-fit: cover;
		    border-radius: 5px;
		    margin-right: 10px;
		  }
		
		  .constOk > div {
		    display: flex;
		    flex-direction: column;
		  }
		  
		  .checkbox-container {
		    display: flex;
		    align-items: center;
		    margin-bottom: 10px;
		  }
		
		  .checkbox-wrapper {
		    display: flex;
		    align-items: center;
		    margin-right: 10px;
		  }
		
		  .checkbox {
		    display: inline-block;
		    width: 20px;
		    height: 20px;
		    border-radius: 50%;
		    border: 2px solid #ccc;
		    margin-right: 5px;
		    cursor: pointer;
		    position: relative;
		  }
		
		  .checkbox.checked {
		    background-color: #007bff;
		    border-color: #007bff;
		  }
		
		  .checkbox.checked::before {
		    content: '\2713';
		    position: absolute;
		    top: 5<
		    left: 50%;
		    transform: translate(-50%, -50%);
		    font-size: 14px;
		    color: #fff;
		  }
		  
		  .btun {
		    display: inline-block;
		    padding: 10px 20px;
		    background-color: #000;
		    color: #fff;
		    border: none;
		    border-radius: 5px;
		    cursor: pointer;
		    font-size: 16px;
		  }
		  .btun-container {
		    text-align: center;
		    margin-top: 50px;
		    margin-bottom: 50px;
		  }
		  
		  /* 푸터 스타일 */
			footer {
			  background-color: #f8f8f8;
			  padding: 20px;
			  text-align: center;
			}
			
			footer div {
			  margin-bottom: 20px;
			}
			
			footer ul {
			  list-style: none;
			  padding: 0;
			  margin: 0;
			}
			
			footer ul li {
			  display: inline-block;
			  margin-right: 10px;
			  font-size: 14px;
			  color: #555;
			}
			
			footer p {
			  margin: 5px 0;
			  font-size: 12px;
			  color: #777;
			}
			
			footer a {
			  color: #777;
			  text-decoration: none;
			  margin-right: 10px;
			  font-size: 12px;
			}
			
			footer a:hover {
			  text-decoration: underline;
			}
			
			/* 등록 버튼 스타일 */
			.register-button {
			  display: inline-block;
			  background-color: black;
			  color: white;
			  padding: 10px 20px;
			  border-radius: 5px;
			  font-size: 14px;
			  text-decoration: none;
			}
			
			.register-button:hover {
			  background-color: #333;
			}
		  
		   .social-icons li a {
		    font-size: 40px; /* 아이콘 크기 조정 */
		    /* 추가적인 스타일링 옵션을 원하신다면 여기에 추가하세요 */
 		 	}
  </style>
  <script type="text/javascript">
 			 let drawStar = (target) => {
		 	 let starSpan = document.querySelector('.star span');
	     starSpan.style.width = target.value * 10 + '%';
	 	}
	  
	  function toggleCheckbox(checkbox) {
		    checkbox.classList.toggle('checked');
		    let input = checkbox.nextElementSibling;
		    input.checked = !input.checked;
		  }

		  function toggleAllCheckboxes() {
		    let checkboxes = document.querySelectorAll('.checkbox');
		    let selectAllCheckbox = checkboxes[0];
		    let allChecked = selectAllCheckbox.classList.contains('checked');

		    checkboxes.forEach((checkbox, index) => {
		      if (index === 0) return; // Skip the selectAllCheckbox
		      checkbox.classList.toggle('checked', !allChecked);
		      let input = checkbox.nextElementSibling;
		      input.checked = !allChecked;
		    });

		    selectAllCheckbox.classList.toggle('checked');
		    let selectAllInput = selectAllCheckbox.nextElementSibling;
		    selectAllInput.checked = !allChecked;
		  }
		  
		  
		  function reviewCheck() {
				let star = reviewForm.star.value;
				//필수선택
				let agreement1 = reviewForm.agreement1.value;
				//선택
				let agreement2 = reviewForm.agreement2.value;
				//리뷰 내용
				let reviewText = reviewForm.reviewText.value;
				//사진				
		    if (!reviewForm.agreement1.checked) {
		        alert("필수 선택을 체크해주세요");
		        return false;
		    } 
			
		    else if (star == 0) { // 0.5 미만일 때 에러 처리
	        alert("별 점은 반개 이상 주셔야합니다");
	        return false;
		    }
		    else if (reviewText.trim().length < 20) {
	        alert("리뷰는 20글자 이상써주세요");
	        return false;
		    }


				let ans ="";
				if(!reviewForm.agreement2.checked){					
					ans = confirm("개인 정보 이용 미동의시 이벤트에 참여 못 하실 수 있습니다");
					if(!ans) return false;
					reviewForm.choiceAgreement.value = "NO";
					
				}
				
				let maxSize = 1024 * 1024 * 2; 	// 업로드할 회원사진의 용량은 2MByte까지로 제한한다.
	    	let reviewPhoNatome = reviewForm.reviewPhoNatome.value;
	    	let ext = reviewPhoNatome.substring(reviewPhoNatome.lastIndexOf(".")+1).toUpperCase();
	    	
	    	
	    	 if(reviewPhoNatome.trim() == "") {
				 	 reviewForm.reviewPhoto.value = "noimage.jpg";
					} 
				  else {
					  let fileInput = document.getElementById("reviewPhoNatome");
					  let file = fileInput.files[0];
					  let fileSize = file.size;
				
					  if(ext != "JPG" && ext != "GIF" && ext != "PNG") {
					    alert("업로드 가능한 파일은 'JPG/GIF/PNG'파일 입니다.");
					    return false;
					  } 
					  else if(reviewPhoNatome.indexOf(" ") != -1) {
					    alert("업로드 파일명에 공백을 포함할 수 없습니다.");
					    return false;
					  }
					  else if(fileSize > maxSize) {
					    alert("업로드 파일의 크기는 2MByte를 초과할 수 없습니다.");
					    return false;
					  }
				  
				}
	    	 reviewForm.submit();
			}
  </script>
</head>
<body>
  <jsp:include page="/WEB-INF/views/include/nav.jsp" />
  <jsp:include page="/WEB-INF/views/myPage/memberPage.jsp" />
 
  
  <c:forEach var="vo" items="${baesongVOS}">
  <c:if test="${vo.orderStatus == '배송완료'}">
      <c:set var="count" value="${count + 1}" />
  </c:if>
	</c:forEach>
	
  <p><br/></p>
  
   <div style="width: 80%; float: right; margin-right: 100px;">
    <div class="memberInfo">                 
      <div class="memberHead">
        <h3>My Page</h3>
      </div>
      <div class="member-List">
        <div class="memberImg">
          <img src="${ctp}/member/${memberVO.photo}" />
        </div>
        <div class="memberNLD">
          <div class="memberName">${memberVO.name}</div>
          <div class="memberLevel">Lv.${memberVO.level} 멤버</div>
          <div class="memberDate">${fn:substring(memberVO.startDate,0,10)}</div>
        </div>
        <div class="magin"><img src="${ctp}/images/point.jpg"/></div>
        <div class="memberPoint"><fmt:formatNumber value="${memberVO.point}" pattern="#,###원" /></div>
        	<a href="${ctp}/myPage/byProductReview"><div><img src="${ctp}/images/hugi.jpg"/></div></a>
        	<a href="${ctp}/myPage/byProductReview"><div class="memberPoint">${count}</div></a>
      </div>        
    </div>
    <div class="hugi">
		  <h3>상품 후기작성</h3>
		  <ul>
		    <li>작성하신 후기는 스토어 및 글로벌 이용자에게 공개됩니다. 댓글은 스토어에서 확인하지 않습니다.</li>
		    <li>일부 후기는 아래 조건에 따라 비노출 처리됩니다.</li>
		    <li>포장이 제거되지 않았거나 상품의 전체 형태가 또렷하게 보이지 않는 후기</li>
		    <li>문자 및 기호의 단순 나열, 반복된 내용의 후기</li>
		    <li>주문하신 상품과 관련 없는 내용의 후기</li>
		    <li>개인정보 및 광고, 비속어가 포함된 내용의 후기</li>
		    <li>상품 상세페이지 등의 판매 이미지 사용, 관련 없는 상품의 사진, 타인의 사진을 도용한 후기</li>
		    <li>원활한 서비스 이용을 위해 후기 도용 시 3개월간 후기 금지, 일부 스토어 서비스 이용에 제한이 발생될 수 있습니다.</li>
		  </ul>
		</div>
		<div class="contassiner">
		  <div>
		    <img src="${ctp}/product/${baesongVO.baesongImg}" alt="제품 사진">
		  </div>
		  <div>
		    <div><fmt:formatNumber value="${baesongVO.orderTotalPrice}" pattern="#,###원" /></div>
		    <div>${baesongVO.orderStatus}</div>
		  </div>
		</div>
		<form name="reviewForm" method="post" action="${ctp}/myPage/reviewSub"  enctype="multipart/form-data">
	    <div>별점을 매겨주세요
		    <span class="star">
				  ★★★★★
				  <span>★★★★★</span>
				  <input type="range" id="star" name="star" oninput="drawStar(this)" value="0" step="1" min="0" max="10">
				</span>
			</div>
			<div class="constOk">
			  <img src="${ctp}/images/productBox.png" alt="상품 사진">
			  <div>
			    <h4>상품 사진 후기 작성 예시</h4>
			    <p>포장 제거 후 미착용 상태로 또렷하게 보이도록 상품 전체를 직접 촬영한 사진을 등록해야 합니다.</p>
			  </div>
			</div>
			<h5 style="margin-top: 20px;">상품에 대한 평가를 20자 이상 작성해 주세요.</h5>
			<textarea rows="10" cols="" style="width: 100%;" name="reviewText" id="reviewText" placeholder="20글자 이상 압력해주세요" ></textarea>
			<input type="file" name="reviewPhoNatome" id="reviewPhoNatome" class="form-control btn btn-outline-primary" />
			<input type="hidden" name="reviewPhoto" id="reviewPhoto" />
			<div class="checkbox-container">
			  <div class="checkbox-wrapper">
			    <div class="checkbox" onclick="toggleAllCheckboxes()"></div>
			    <input type="checkbox" id="selectAll" name="selectAll" style="display: none;">
			    <label for="selectAll">전체 동의하기</label>
			  </div>
			</div>
			
			<div class="checkbox-container">
			  <div class="checkbox-wrapper">
			    <div class="checkbox" onclick="toggleCheckbox(this)"></div>
			    <input type="checkbox" id="agreement1" name="agreement1" style="display: none;">
			    <label for="agreement1">작성된 후기는 스토어 홍보 콘텐츠로 사용될 수 있습니다. (필수)</label>
			  </div>
			</div>
			
			<div class="checkbox-container">
			  <div class="checkbox-wrapper">
			    <div class="checkbox" onclick="toggleCheckbox(this)"></div>
			    <input type="checkbox" id="agreement2" name="agreement2" style="display: none;">
			    <input type="hidden" name="choiceAgreement" id="choiceAgreement"/>
			    <label for="agreement2">보다 나은 후기 서비스 제공을 위해 개인 정보 수집ㆍ이용에 동의합니다. (선택)</label>
			  </div>
			</div>
			<input type="hidden" id="baesongIdx" name="baesongIdx" value=" ${baesongVO.idx}" />    
			<input type="hidden" id="baesongoIdx" name="baesongoIdx" value="${baesongVO.oidx}" />    
			
	    <div class="btun-container">
			  <input type="button" class="btun" onclick="reviewCheck()" value="등록"/>
			</div>
		</form>
		<footer>
  <div>
    <ul>
      <li>회사소개</li>
      <li>공지사항</li>
      <li>이벤트</li>
      <li>공지입점/제휴/대량구매</li>
      <li>개인정보처리방침</li>
      <li>영상정보처리기기 운영·관리방침</li>
      <li>이용약관</li>
      <li>로고 다운로드</li>
    </ul>
    <p>스토어 편집팀</p>
    <p>서울특별시 강남구 신사동 640-2</p>
    <p>로빈명품관 지하1층, 스토어 편집팀</p>
    <p>(스토어 스토어 반송지 아님, 해당주소 반송불가)</p>
    <p>스토어 스토어</p>
    <p>(17759) 경기도 평택시 신장로 55 CJ대한통운 평택합정집배점 내 스토어 물류센터</p>
    <p>(스토어 스토어 자체 배송 상품 물류센터)</p>
    <p>(배송센터 직접 물건 수령 불가)</p>
    <p>고객센터</p>
    <p>1544 - 7199 (유료)</p>
    <p>1:1 문의</p>
    <p>이메일</p>
    <p>평일 오전 9시 - 오후 6시</p>
    <p>(상품 문의는 각 상품 페이지에서 [문의하기] 등록)</p>
    <p>FAQ</p>
    <p>자주 묻는 질문</p>
    <p>각 브랜드마다 물류센터가 다릅니다. 교환/환불 시 주문 조회 메뉴를 통해 해당 제품이 출고된 곳으로 반송하셔야 합니다.</p>
    <ul class="social-icons">
	    <li><a href="https://www.youtube.com"><i class="fab fa-youtube"></i></a></li>
	    <li><a href="https://www.instagram.com"><i class="fab fa-instagram"></i></a></li>
	    <li><a href="https://www.facebook.com"><i class="fab fa-facebook-f"></i></a></li>
	    <li><a href="https://www.youtube.com"><i class="fab fa-twitter"></i></a></li>	    
	  </ul>
    <p>COPYRIGHT (C) MUSINSA ALL RIGHTS RESERVED.</p>
    <p>스토어닷컴 내 매거진, 스트리트스냅, 스토어 등 스토어 자체 생성 콘텐츠는 스토어닷컴 및 스토어 계약업체에 저작권이 있습니다.</p>
    <p>이러한 콘텐츠는 출처를 밝히고(스토어닷컴 표기 및 www.musinsa.com 링크 포함 필수) 비상업적인 용도에서만 활용하실 수 있습니다. 자세히보기</p>
    <p>커뮤니티 및 중고장터, 댓글 등 스토어 회원이 올린 이미지가 저작권에 위배될 경우 신고 하시면 검토 후 삭제하겠습니다.</p>
    <p>100% AUTHENTIC</p>
    <p>스토어스토어에서 판매되는 모든 브랜드 제품은 정식제조, 정식수입원을 통해 유통되는 100% 정품임을 보증합니다.</p>
    <p>주식회사 스토어 (MUSINSA Co., Ltd.) | 서울특별시 성동구 아차산로 13길 11, 1층 (성수동2가, 스토어캠퍼스 엔1) | 사업자등록번호 : 211-88-79575 |</p>
    <p>통신판매업신고 : 2022-서울성동-01952 | 대표 : 한문일 | 개인정보보호책임자 : 이인섭kcp에스크로확인사업자정보확인</p>
    <p>일부 상품의 경우 주식회사 스토어는 통신판매의 당사자가 아닌 통신판매중개자로서</p>
    <p>상품, 상품정보, 거래에 대한 책임이 제한될 수 있으므로, 각 상품 페이지에서 구체적인 내용을 확인하시기 바랍니다.</p>
    <p>당사는 고객님의 안전거래를 위해 관련 법률에 의거하여 NHN KCP의 에스크로서비스를 적용하고 있습니다.</p>
    <p>서비스 가입사실 확인" 이내용으로 푸터 만들어줘</p>
  </div>
</footer>
		
	 </div>
  
</body>
</html>