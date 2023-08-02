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
  <style>
  	body {
  		  background-color: #FFF5EB;
        background-image: url("${ctp}/images/KakaoTalk_20230730_144458469.png");
        background-size: 50%; /* 배경 이미지를 요소의 50% 크기로 조절합니다. */
        background-position: center top;
  	}
  	
  	.header h2 {
  		color: #FF6D3F;
  	}
  	
  	.chk_group input[type="checkbox"]:checked + label::before {
	  	border-color: #FF6D3F;
	  	background-color: #FF6D3F;
	}
	
	.btn_area .btn_agree_ {
		background-color: #FF6D3F;
		color: #ffffff;
	}
	
	.btn_area .btn_no_agree {
		background-color: #ffffff;
		border-color: #FF6D3F;
		color: #FF6D3F;
	}
		.modalTT {
	  display: none;
	  position: fixed;
	  z-index: 1;
	  left: 0;
	  top: 0;
	  width: 100%;
	  height: 100%;
	  overflow: auto;
	  background-color: rgba(0, 0, 0, 0.5);
	}
	
	.modalTT-content {
	  background-color: #fefefe;
	  margin: 10% auto;
	  padding: 20px;
	  border: 1px solid #888;
	  width: 80%;
	  max-width: 600px;
	}
	
	.modalTT-content p {
	  margin-bottom: 20px;
	}
	
	.close {
	  color: #aaa;
	  float: right;
	  font-size: 28px;
	  font-weight: bold;
	  cursor: pointer;
	}
	
	.close:hover,
	.close:focus {
	  color: #000;
	  text-decoration: none;
	  cursor: pointer;
	}
	.blind {
	  display: inline-block;
	  padding: 2px 3px;
	  background-color: #FF6D3F;
	  color: #ffffff;
	  border-radius: 2px;
	  text-decoration: none;
	  cursor: pointer;
	}
	
	.blind:hover {
	  background-color: #FF7F50;
	}
	.wrap{
		margin-top: 200px;
		margin-bottom: 100px;
	}
	.container {

    background-color: rgba(255, 255, 255, 0.2);
	}
  </style>
</head>
<body>
   <jsp:include page="/WEB-INF/views/include/nav.jsp" />
   <jsp:include page="/WEB-INF/views/myPage/memberPage.jsp" />
   <p><br/></p>
   <div class="container">
  
	<div class="wrap">
		<div class="header">
	<h2 class="h2" style="color: #FF6D3F;">회원탈퇴</h2>
		</div>
		<div class="container">
			<div class="inner">
				<div class="step1">
					<div class="chk_group all_agree">
						<ul class="clearfix">
							<li><input type="checkbox" class="check_all" id="chk1" >
								<label for="chk1"><span></span> 전체약관에 동의합니다. </label></li>

						</ul>

					</div>
					<p class="mgb_20">필수동의항목</p>
					<div class="chk_group check_agree_box">
						<ul class="clearfix">
							<li><input type="checkbox" id="chk2" class="chk2"> <label
								for="chk2" class="AC1" id="AC1" title="NORDICNEST 탈퇴약관">
								 <span></span> "NORDICNEST 탈퇴약관(필수)"
							</label> <a href="javascript:void(0);" class="agree_view" onclick="openmodalTTS()"> <span class="blind">약관보기</span>
							</a></li>
							<li><input type="checkbox" id="chk3"> <label
								for="chk3"> <span></span> "개인정보 수집 및 탈퇴에 대한 안내(필수)"
							</label> <a href="javascript:void(0);" class="agree_view" onclick="openmodalTTS()"> <span class="blind">약관보기</span>
							</a></li>	
							<li><input type="checkbox" id="chk4"> <label
								for="chk4"> <span></span> "개인정보 위탁 안내(필수)"
							</label> <a href="javascript:void(0);" class="agree_view" onclick="openmodalTTS()"> <span class="blind">약관보기</span>
							</a></li>
						</ul>
						<p class="notice_txt">* 개인정보의 수집, 제공 및 활용에 동의하지 않을 권리가 있으며,
							미동의시 회원가입 및 여행서비스의 제공이 제한됩니다.</p>
					</div>
					<p>선택동의항목</p>
					<div class="chk_group check_agree_box sel_agree">
						<ul class="clearfix">
							<li><input type="checkbox" id="chk5"> <label
								for="chk5"> <span></span> "고유식별정보 수집 및 탈퇴에 대한 안내(선택)"
							</label> <a href="javascript:void(0);" class="agree_view" onclick="openmodalTTS()"> <span class="blind">약관보기</span>
							</a></li>
							<li><input type="checkbox" id="chk6"> <label
								for="chk6"> <span></span> "개인정보 제3자 제공 및 공유 안내(선택)"
							</label> <a href="javascript:void(0);" class="agree_view" onclick="openmodalTTS()"> <span class="blind">약관보기</span>
							</a></li>

							<li><input type="checkbox" id="chk7"> <label
								for="chk7"> <span></span> "개인정보 수집 및 탈퇴에 대한 공유 안내(선택)"
							</label> <a href="javascript:void(0);" class="agree_view" onclick="openmodalTTS()"> <span class="blind">약관보기</span>
							</a></li>

						</ul>
						<p class="notice_txt">* 개인정보 제3자 제공 및 공유에 동의하지 않을 권리가 있으며 ,
							미동의시 일부 여행서비스의 제공이 제한될 수 있습니다.</p>
					</div>
				</div>
				<div class="btn_area">
					<a href="javascript:void(0);" onclick="return agree()" class="btn_agree_"> <span class="blind">동의합니다</span></a>&nbsp;	
				  <a href="${ctp}/" class="btn_no_agree"> <span class="blind">동의하지 않습니다</span>
					</a>
				</div>
			</div>

		</div>

	</div>
	 <div class="modalTT">
        <div class="modalTT-content">
          <span class="close">&times;</span>
			<p>제1조 목적 본 탈퇴약관은 “본 사이트"의 서비스의 탈퇴조건과 운영에 관한 제반사항 규정을 목적으로 합니다.<br><br>

				제2조 용어의 정의 본 약관에서 사용되는 주요한 용어의 정의는 다음과 같습니다.<br>
				① 회원 : 본 사이트의 약관에 동의하고 개인정보를 제공하여 회원등록을 한 자로서, 사이트와의 탈퇴계약을 체결하고 사이트를 탈퇴하는 탈퇴자를 말합니다.<br>
				② 탈퇴계약
				: 본 사이트 탈퇴과 관련하여 사이트와 회원간에 체결하는 계약을 말합니다.<br>
				 ③ 회원 아이디(이하 "ID") : 회원의
				식별과 회원의 서비스 탈퇴을 위하여 회원별로 부여하는 고유한 문자와 숫자의 조합을 말합니다.<br>
				④ 비밀번호 : 회원이
				부여받은 ID와 일치된 회원임을 확인하고 회원의 권익보호를 위하여 회원이 선정한 문자와 숫자의 조합을 말합니다.<br>
				 ⑤ 운영자
				: 서비스에 홈페이지를 개설하여 운영하는 운영자를 말합니다.<br>
				 ⑥ 해지 : 회원이 탈퇴계약을 해약하는 것을 말합니다.<br><br>
				제3조 약관외 준칙 운영자는 필요한 경우 별도로 운영정책을 공지 안내할 수 있으며, 본 약관과 운영정책이 중첩될 경우 운영정책이 우선적용됩니다.<br></p>
		</div>
      </div>
      

	<script>
	function openmodalTTS() {
		  document.querySelector('.modalTT').style.display = 'block';
		}
		// 모달창 닫기
		function closemodalTT() {
		  document.querySelector('.modalTT').style.display = 'none';
		}
		// 모달창 닫기 버튼 클릭 이벤트
		document.querySelector('.close').addEventListener('click', closemodalTT);
		// 모달창 외부 클릭 이벤트
		window.addEventListener('click', function(event) {
		  if (event.target == document.querySelector('.modalTT')) {
		    closemodalTT();
		  }
		});
	
		var check_all = document.querySelector(".check_all");
		
		check_all.addEventListener("click",function(){
			var checked = check_all.checked;
			for (var i = 1; i < 8; i++) {
				document.querySelector('input[id=chk' + i + ']').checked = checked;
			}
		});
		
		function agree() {
			if (document.querySelector('input[id=chk2]').checked &&
				document.querySelector('input[id=chk3]').checked &&
				document.querySelector('input[id=chk4]').checked) {
					alert("동의하셨습니다.");
			} 
			else {
			  alert("필수 동의 항목에 모두 체크해주세요.");
				return false;
			}
			
			let ans = confirm("정말 탈퇴 하기겠습니다?");
			if(ans) location.href="${ctp}/myPage/memberDelete";
		}
	</script>
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
