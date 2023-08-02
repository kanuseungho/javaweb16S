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
  html {
	  height: 100%;
	}
	body {
	  margin:0;
	  padding:0;
	  font-family: sans-serif;
	  
	}
	
	.login-box {
		margin-left: auto;
		margin-right: auto;	  
	  width: 800px;
	  padding: 40px;	  
	  background: orange;
	  box-sizing: border-box;
	  box-shadow: 0 15px 25px rgba(0,0,0,.6);
	  border-radius: 10px;
	  margin-top: 50px;	  
	}
	
	.login-box h2 {
	  margin: 0 0 30px;
	  padding: 0;
	  color: #fff;
	  text-align: center;
	}
	
	.login-box .user-box {
	  position: relative;
	}
	
	.login-box .user-box input {
	  width: 100%;
	  padding: 10px 0;
	  font-size: 16px;
	  color: #fff;
	  margin-bottom: 30px;
	  border: none;
	  border-bottom: 1px solid #fff;
	  outline: none;
	  background: transparent;
	}
	.login-box .user-box label {
	  position: absolute;
	  top:0;
	  left: 0;
	  padding: 10px 0;
	  font-size: 16px;
	  color: #fff;
	  pointer-events: none;
	  transition: .5s;
	}
	
	.login-box .user-box input:focus ~ label,
	.login-box .user-box input:valid ~ label {
	  top: -20px;
	  left: 0;
	  color: #03e9f4;
	  font-size: 12px;
	}
	
	.login-box form a {
	  position: relative;
	  display: inline-block;
	  padding: 10px 20px;
	  color: #03e9f4;
	  font-size: 16px;
	  text-decoration: none;
	  text-transform: uppercase;
	  overflow: hidden;
	  transition: .5s;
	  margin-top: 40px;
	  letter-spacing: 4px
	}
	
	.login-box a:hover {
	  background: #03e9f4;
	  color: #fff;
	  border-radius: 5px;
	  box-shadow: 0 0 5px #03e9f4,
	              0 0 25px #03e9f4,
	              0 0 50px #03e9f4,
	              0 0 100px #03e9f4;
	}
	
	.login-box a span {
	  position: absolute;
	  display: block;
	}
	
	.login-box a span:nth-child(1) {
	  top: 0;
	  left: -100%;
	  width: 100%;
	  height: 2px;
	  background: linear-gradient(90deg, transparent, #03e9f4);
	  animation: btn-anim1 1s linear infinite;
	}
	
	@keyframes btn-anim1 {
	  0% {
	    left: -100%;
	  }
	  50%,100% {
	    left: 100%;
	  }
	}
	
	.login-box a span:nth-child(2) {
	  top: -100%;
	  right: 0;
	  width: 2px;
	  height: 100%;
	  background: linear-gradient(180deg, transparent, #03e9f4);
	  animation: btn-anim2 1s linear infinite;
	  animation-delay: .25s
	}
	
	@keyframes btn-anim2 {
	  0% {
	    top: -100%;
	  }
	  50%,100% {
	    top: 100%;
	  }
	}
	
	.login-box a span:nth-child(3) {
	  bottom: 0;
	  right: -100%;
	  width: 100%;
	  height: 2px;
	  background: linear-gradient(270deg, transparent, #03e9f4);
	  animation: btn-anim3 1s linear infinite;
	  animation-delay: .5s
	}
	
	@keyframes btn-anim3 {
	  0% {
	    right: -100%;
	  }
	  50%,100% {
	    right: 100%;
	  }
	}
	
	.login-box a span:nth-child(4) {
	  bottom: -100%;
	  left: 0;
	  width: 2px;
	  height: 100%;
	  background: linear-gradient(360deg, transparent, #03e9f4);
	  animation: btn-anim4 1s linear infinite;
	  animation-delay: .75s
	}
	
	@keyframes btn-anim4 {
	  0% {
	    bottom: -100%;
	  }
	  50%,100% {
	    bottom: 100%;
	  }
	}
  </style>
  <script type="text/javascript">
  	function returnsCheck(sMid) {
  		let productCode = myform.productCode.value;
  		let memberEmail = myform.memberEmail.value;
  		let emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
  		let mid = sMid;
  		if(mid ==""){
  			alert("로그인 후 이용해주세요")
  			return false;
  		}
  		else if(productCode == ""){
  			alert("제품 코드를 입력하세요");
  			return false; 
  		}
  		else if(memberEmail==""){
  			alert("회신 받을 이메일을 입력하세요");
  			return false;
  		}
  		else if(!emailRegex.test(memberEmail)){
  			alert("이메일 형식에 맞지 않습니다");
  			return false;
  		}
  		else{
  			myform.submit();
  		}
		}
  </script>
</head>
<body>
   <jsp:include page="/WEB-INF/views/include/nav.jsp" />
   <jsp:include page="/WEB-INF/views/myPage/memberInquire.jsp" />
   <div class="login-box">
	  <h2>반품 요청 및 문의 등록</h2>
	  <form name="myform" method="post">
	    <div class="user-box">
	      <input type="text" name="productCode" id="productCode" required>
	      <label>상품코드</label>
	    </div>
	    <div class="user-box">
	      <input type="email" name="memberEmail" id="memberEmail" required>
	      <label>이메일</label>
	    </div>
	    <a href="#" onclick="returnsCheck('${sMid}')">
	      <span></span>
	      <span></span>
	      <span></span>
	      <span></span>
	      Submit
	    </a>
	    <input type="hidden" value="${sMid}" name="mid" id="mid"/>
	  </form>
	</div>
	<img src="${ctp}/images/doublebard.jpg" style="width: 100%; height: 70px; margin-top: 170px;" />
   <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>