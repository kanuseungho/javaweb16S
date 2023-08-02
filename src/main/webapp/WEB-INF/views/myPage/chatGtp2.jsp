<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>chatGPT</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <style>
   #loading {
      width: 100%;
      height: 100%;
      top: 0;
      left: 0;
      position: fixed;
      display: block;
      opacity: 0.6;
      background: #e4e4e4;
      z-index: 99;
      text-align: center;
    }

    #loading>img {
      position: absolute;
      top: 40%;
      left: 45%;
      z-index: 100;
    }

    #loading>p {
      position: absolute;
      top: 57%;
      left: 43%;
      z-index: 101;
    }
  
  
  
  
  
    .chatbot-container {
			  display: flex;
			  position: fixed;
			  bottom: 20px;
			  right: 20px; /* 왼쪽 대신에 오른쪽으로 이동 */
			  align-items: flex-end;
			  justify-content: flex-end; /* 모든 요소를 오른쪽으로 옮김 */
			}

    .chatbot-icon {
      width: 60px;
      height: 60px;
      background-color: #3f51b5;
      color: #fff;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
      animation: bot-float 2s ease-in-out infinite;
    }

    .chatbot-content {
      margin-left: 10px;
      background-color: #fff;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
      max-width: 400px;
      padding: 20px;
      display: none;
    }

    .chatbot-content.active {
      display: block;
    }

    .chatbot-content p {
      margin-bottom: 10px;
    }

    .chatbot-guideline {
		  /* position: fixed;
		  top: 50%;
		  left: 15%; */
		  /* transform: translateY(-50%); */
	   	margin-top: 200px;
		  background-color: orange;
		  border-radius: 5px;
		  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
		  padding: 20px;
		  max-width: 300px;
		  color:white;
		  animation: guideline-float 2s ease-in-out infinite;
		}
		@keyframes guideline-float {
		  0% {
		    transform: translateY(0);
		  }
		  50% {
		    transform: translateY(-10px);
		  }
		  100% {
		    transform: translateY(0);
		  }
		}
		.chatbot-guideline p {
		  opacity: 0;
		  animation: guideline-shining 8s linear forwards/* infinite */;
		}
		
		.chatbot-guideline p:nth-child(1) {
		  animation-delay: 0s;
		}
		
		.chatbot-guideline p:nth-child(2) {
		  animation-delay: 3s;
		}
		
		.chatbot-guideline p:nth-child(3) {
		  animation-delay: 6s;
		}
		.chatbot-guideline p:nth-child(4) {
		  animation-delay: 9s;
		}
		.chatbot-guideline p:nth-child(5) {
		  animation-delay: 12s;
		}
		.chatbot-guideline p:nth-child(6) {
		  animation-delay: 15s;
		}
		.chatbot-guideline p:nth-child(7) {
		  animation-delay: 18s;
		}
		.chatbot-guideline p:nth-child(8) {
		  animation-delay: 21s;
		}
		.chatbot-guideline p:nth-child(9) {
		  animation-delay: 24s;
		}
		.chatbot-guideline p:nth-child(10) {
		  animation-delay: 27s;
		}
		.chatbot-guideline p:nth-child(11) {
		  animation-delay: 30s;
		}
		
		/* 필요한 만큼 chatbot-guideline p:nth-child(n) 규칙을 추가하여 원하는 개수의 <p> 태그에 적용합니다. */
		
		@keyframes guideline-shining {
		  0% {
		    opacity: 0;
		  }
		  25% {
		    opacity: 1;
		  }
		  75% {
		    opacity: 1;
		  }
		  100% {
		    opacity: 1;
		  }
		}
		
    .chatbot-card {
      background-color: #f5f5f5;
      padding: 10px;
      margin-bottom: 10px;
      border-radius: 5px;
      cursor: pointer;
    }

    .chatbot-card:hover {
      background-color: #ececec;
    }

    .chatbot-message {
      background-color: #f5f5f5;
      padding: 10px;
      border-radius: 5px;
      margin-bottom: 10px;
    }

    @keyframes bot-float {
      0% {
        transform: translateY(0);
      }
      50% {
        transform: translateY(-10px);
      }
      100% {
        transform: translateY(0);
      }
    }
    
    
    
    .layerPopup {
          display: none;
          position: fixed;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          background: rgba(0,0,0,0);
          z-index: 1000;
          justify-content: center;
          align-items: center;
          margin: -30px 0 0 -30px;
      }
      .spinner {
          position: absolute;
          top: 50%;
          left: 50%;
          border: 8px solid #f3f3f3; /* Light grey */
          border-top: 8px solid #3498db; /* Blue */
          border-radius: 50%;
          width: 60px;
          height: 60px;
          animation: spinner 2s linear infinite;
      }
      @keyframes spinner {
          0% {
              transform: rotate(0deg);
          }
          100% {
              transform: rotate(360deg);
          }
      }
  </style>
  <script>
  
    document.addEventListener("DOMContentLoaded", function() {
      const chatbotIcon = document.querySelector(".chatbot-icon");
      const chatbotContent = document.querySelector(".chatbot-content");

      chatbotIcon.addEventListener("click", function() {
        chatbotContent.classList.toggle("active");
        chatbotIcon.classList.toggle("active");
      });
    });
    function sendValue(value) {
    	  //location.reload();
        // 여기에서 value 변수를 이용하여 필요한 처리를 수행합니다.               	
        // 값을 서버로 보내거나 다른 동작을 수행할 수 있습니다.
        $.ajax({
        	type : "post",
          url  : "${ctp}/myPage/chatGtp",
          data : {value : value}, 
          success: function(response) {
      	    // 서버 응답을 받아와서 화면을 업데이트      	  
      	    $('#targetDiv').html("${sChatResult}");
      	  },
          error:function(){
        	  alert("전송에러");
          }
        });
     }
    function andleSubmit(event) {
        event.preventDefault(); // 폼 제출 기본 동작 취소 	
        myForm.submit();
        document.getElementById("myForm").reset(); // 폼 리셋
      }
    
  </script>
</head>
<body>
  <jsp:include page="/WEB-INF/views/include/nav.jsp" />
  <jsp:include page="/WEB-INF/views/myPage/memberPage.jsp" />
  <p><br/></p>
  <div class="container">
  	
    <div class="chatbot-container">
      
    <div class="chatbot-content">
   	 	<div class="chatbot-card">
   	 		<textarea id="targetDiv"  rows="10" cols="50" style="width: 200px; height: 150px;" placeholder="선택하신 질문이나 직접하신 질문은 여기에 표기 됩니다 답변이 오질 않는 다면 5초 이후 새로고침을 해주세요">${sChatResult}</textarea>
   	 	</div>
		  <div class="chatbot-card">
		    <p onclick="sendValue('인테리어 아이템 추천해주세요.')">인테리어 아이템 추천해주세요.</p>
		  </div>
		  <div class="chatbot-card">
		    <p onclick="sendValue('새로운 제품이 입고되었나요')">새로운 제품이 입고되었나요</p>
		  </div>
		  <div class="chatbot-card">
		    <p onclick="sendValue('배송 시간과 비용은 어떻게 되나요')">배송 시간과 비용은 어떻게 되나요</p>
		  </div>
		  <div class="chatbot-message">
		    <p onclick="sendValue('교환/반품 정책에 대해 알려주세요.')">교환/반품 정책에 대해 알려주세요.</p>
		  </div>
		  <div class="chatbot-message">
		  	<form id="myForm" onsubmit="andleSubmit(event)" action="${ctp}/myPage/chatGtp" method="post">
		    	<p><input type="text" id="value"  name="value" class="form-control"/></p>
		    </form>
		  </div>
		</div>
      <div class="chatbot-icon">
        <i class="fas fa-dove"></i>
      </div>
    </div>
    <div style="display: flex;">
	    <div class="chatbot-guideline">
	      <h3>제 1장 총칙</h3>
	      <p>제1조 목적</p>
	      <p>이 약관은 노르티스에서 제공하는 서비스 이용조건 및 절차에 관한 사항과 기타 필요한 사항을 의원은 이용자의 권리, 의미 및 책임사항 등을 규정함을 목적으로 합니다.</p>
	      <p>제2조 약관의 효력과 변경</p>
	      <p>(1) 이 약관은 이용자에게 공시함으로서 효력이 발생합니다.</p>
	      <p>(2) 의원은 사정 변경의 경우와 영업상 중요사유가 있을 때 약관을 변경할 수 있으며, 변경된 약관은 전항과 같은 방법으로 효력이 발생합니다.</p>
	      <p>제3조 약관 외 준칙</p>
	      <p>이 약관에 명시되지 않은 사항이 관계법령에 규정되어 있을 경우에는 그 규정에 따릅니다.</p>
	      
	    </div>
	    <div class="chatbot-guideline">
	      <h3>제2장 서비스 이용</h3>
	      <p>제1조 회원의 정의</p>
	      <p>회원이란 의원에서 회원으로 적합하다고 인정하는 일반 개인으로 본 약관에 동의하고 서비스의 회원가입 양식을 작성하고 'ID'와 '비밀번호'를 발급받은 사람을 말합니다.</p>
	      <p>제2조 서비스 가입의 성립</p>
	      <p>(1) 서비스 가입은 이용자의 이용신청에 대한 의원의 이용승낙과 이용자의 약관내용에 대한 동의로 성립됩니다.</p>
	      <p>(2) 회원으로 가입하여 서비스를 이용하고자 하는 희망자는 의원에서 요청하는 개인 신상정보를 제공해야 합니다.</p>
	      <p>(3) 이용자의 가입신청에 대하여 의원에서 승낙한 경우, 의원은 회원 ID와 기타 의원에서 필요하다고 인정하는 내용을 이용자에게 통지합니다.</p>
	      <p>(4) 가입할 때 입력한 ID는 변경할 수 없으며, 한 사람에게 오직 한 개의 ID가 발급됩니다.</p>
	    </div>
	    <div class="chatbot-guideline">
	      <h3>상담사의 존엄성</h3>
	      <p>제1조 상담사 총칙</p>
	      <p>상담사는 자기건강과 복지를 유지하며, 상담 활동에 적절한 휴식과 균형을 유지해야 합니다.</p>
	      <p>상담사는 모든 상담 활동에서 자신의 존엄성을 유지할 권리를 가집니다.</p>
	      <p>상담사는 모든 상담 활동에서 인격을 존중받아야 합니다.</p>
	      <p>상담사는 어떠한 형태의 차별, 괴롭힘, 협박, 성희롱 등에도 노출되지 않아야 합니다.</p>
	      <p>개인정보 보호</p>
	      <p>상담사는 상담 과정에서 수집된 개인정보를 적법하고 안전하게 관리해야 합니다.</p>
	      <p>상담사는 개인정보를 무단으로 제3자와 공유하거나 악용해서는 안 됩니다.</p>
	   
	    </div>
	    <div class="chatbot-guideline">
	      <h3>[챗봇 이용약관]</h3>
	      <p>제3장 쳇봇 </p>
	      <p>1.1. 본 챗봇은 자동응답 시스템을 통해 사용자와의 상호작용을 통해 정보 제공, 서비스 제공 등을 목적으로 합니다.</p>
	      <p>1.2. 본 챗봇은 일반적인 질문과 답변을 처리할 수 있으나, 모든 상황에 대해 완벽한 답변을 보장하지는 않습니다.</p>
	      <p>2.1. 이용자는 챗봇을 이용함에 있어 합법적이고 적법한 방식으로만 사용해야 합니다.</p>
	      <p>2.2. 이용자는 정확한 정보를 제공하고, 자신의 의견에 따라 챗봇과의 상호작용을 결정할 권리를 가집니다.</p>
	      <p>2.3. 이용자는 챗봇을 이용하여 행한 행위에 대한 책임을 부담합니다.</p>
	      <p>3.1. 챗봇은 제공되는 정보 및 서비스를 통해 이용자에게 도움을 제공하기 위해 노력합니다.</p>
	      <p>3.2. 챗봇과 관련된 저작권 및 지적 재산권은 운영자 또는 소유자에게 귀속됩니다.</p>	     
	    </div>
    </div>
  </div>
  <p><br/></p>
  <%-- <jsp:include page="/WEB-INF/views/include/footer.jsp" /> --%>
</body>
</html>
