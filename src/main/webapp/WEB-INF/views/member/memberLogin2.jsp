<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>  
  <title>memberLogin.jsp</title>
  <style type="text/css">
  @import url("https://fonts.googleapis.com/css?family=Fira+Sans");

html,body {
  position: relative;
  min-height: 100vh;
  background-color: #E1E8EE;
  display: flex;
  align-items: center;
  justify-content: center;
  font-family: "Fira Sans", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.form-structor {
  background-color: #222;
  border-radius: 15px;
  height: 900px;
  width: 600px;
  position: relative; 
  overflow: hidden;
  
  &::after {
    content: '';
    opacity: .8; 
    position: absolute;
    top: 0;right:0;bottom:0;left:0;
    background-repeat: no-repeat;
    background-position: left bottom;
    background-size: 500px;
    background-image: url('https://images.unsplash.com/photo-1503602642458-232111445657?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=bf884ad570b50659c5fa2dc2cfb20ecf&auto=format&fit=crop&w=1000&q=100');
    background-size: cover;
  }
  
  .signup {
    position: absolute;
    top: 50%;
    left: 50%;
    -webkit-transform: translate(-50%, -50%);

    z-index: 5;
    -webkit-transition: all .3s ease;
    
    
    &.slide-up {
      top: 5%;
      -webkit-transform: translate(-50%, 0%);
      -webkit-transition: all .3s ease;
    }
    
    &.slide-up .form-holder,
    &.slide-up .submit-btn {
      opacity: 0;
      visibility: hidden;
    }
    
    &.slide-up .form-title {
      font-size: 1em;
      cursor: pointer;
    }
    
    &.slide-up .form-title span {
      margin-right: 5px;
      opacity: 1;
      visibility: visible;
      -webkit-transition: all .3s ease;
    }
    
    .form-title {
      color: #fff;
      font-size: 1.7em;
      text-align: center;
      
      span {
        color: rgba(0,0,0,0.4);
        opacity: 0;
        visibility: hidden;
        -webkit-transition: all .3s ease;
      }
    }
    
    .form-holder {
      border-radius: 15px;
      background-color: #fff;
      overflow: hidden;
      margin-top: 50px;
      opacity: 1;
      visibility: visible;
      -webkit-transition: all .3s ease;
      overflow: auto;
      .input {
        border: 0;
        outline: none;
        box-shadow: none;
        display: block;
        height: 30px;
        line-height: 30px;
        padding: 8px 15px;
        border-bottom: 1px solid #eee;
        font-size: 12px;
        height: auto; 
        
        &:last-child {
          border-bottom: 0;
        }
        &::-webkit-input-placeholder {
          color: rgba(0,0,0,0.4);
        }
      }
    }
    
    .submit-btn {
      background-color: rgba(0,0,0,0.4);
      color: rgba(256,256,256,0.7);
      border:0;
      border-radius: 15px;
      display: block;
      margin: 15px auto; 
      padding: 15px 45px;
      width: 100%;
      font-size: 13px;
      font-weight: bold;
      cursor: pointer;
      opacity: 1;
      visibility: visible;
      -webkit-transition: all .3s ease;
      
      &:hover {
        transition: all .3s ease;
        background-color: rgba(0,0,0,0.8);
      }
    }
  }
  
  .login {
    position: absolute;
    top: 20%;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: #fff;
    z-index: 5;
    -webkit-transition: all .3s ease;
    
    &::before {
      content: '';
      position: absolute;
      left: 50%;
      top: -20px;
      -webkit-transform: translate(-50%, 0);
      background-color: #fff;
      width: 200%;
      height: 250px;
      border-radius: 50%;
      z-index: 4;
      -webkit-transition: all .3s ease;
    }
    
    .center {
      position: absolute;
      top: calc(50% - 10%);
      left: 50%;
      -webkit-transform: translate(-50%, -50%);
      width: 65%;
      z-index: 5;
      -webkit-transition: all .3s ease;
      
      .form-title {
        color: #000;
        font-size: 1.7em;
        text-align: center;

        span {
          color: rgba(0,0,0,0.4);
          opacity: 0;
          visibility: hidden;
          -webkit-transition: all .3s ease;
        }
      }

      .form-holder {
        border-radius: 15px;
        background-color: #fff;
        border: 1px solid #eee;
        overflow: hidden;
        margin-top: 50px;
        opacity: 1;
        visibility: visible;
        -webkit-transition: all .3s ease;

        .input {
          border: 0;
          outline: none;
          box-shadow: none;
          display: block;
          height: 30px;
          line-height: 30px;
          padding: 8px 15px;
          border-bottom: 1px solid #eee;
          width: 100%;
          font-size: 12px;

          &:last-child {
            border-bottom: 0;
          }
          &::-webkit-input-placeholder {
            color: rgba(0,0,0,0.4);
          }
        }
      }

      .submit-btn {
        background-color: #6B92A4;
        color: rgba(256,256,256,0.7);
        border:0;
        border-radius: 15px;
        display: block;
        margin: 15px auto; 
        padding: 15px 45px;
        width: 100%;
        font-size: 13px;
        font-weight: bold;
        cursor: pointer;
        opacity: 1;
        visibility: visible;
        -webkit-transition: all .3s ease;

        &:hover {
          transition: all .3s ease;
          background-color: rgba(0,0,0,0.8);
        }
      }
    }
    
    &.slide-up {
      top: 90%;
      -webkit-transition: all .3s ease;
    }
    
    &.slide-up .center {
      top: 10%;
      -webkit-transform: translate(-50%, 0%);
      -webkit-transition: all .3s ease;
    }
    
    &.slide-up .form-holder,
    &.slide-up .submit-btn {
      opacity: 0;
      visibility: hidden;
      -webkit-transition: all .3s ease;
    }
    
    &.slide-up .form-title {
      font-size: 1em;
      margin: 0;
      padding: 0;
      cursor: pointer;
      -webkit-transition: all .3s ease;
    }
    
    &.slide-up .form-title span {
      margin-right: 5px;
      opacity: 1;
      visibility: visible;
      -webkit-transition: all .3s ease;
    }
  }
}
</style>
<script>
		
		// 카카로그인을 위한 자바스크립트 키
		window.Kakao.init("41fd8a8060d8f60b512f845ab774afee");
		
		// 카카오 로그인
		function kakaoLogin() {
		   window.Kakao.Auth.login({
		      scope: 'profile_nickname, account_email',
		      success:function(autoObj) {
		         console.log(Kakao.Auth.getAccessToken(),"로그인 OK");
		         console.log(autoObj);
		         window.Kakao.API.request({
		            url : '/v2/user/me',
		            success:function(res) {
		               const kakao_account = res.kakao_account;
		               console.log(kakao_account);
		               //alert(kakao_account.email + " / " + kakao_account.profile.nickname);
		               location.href="${ctp}/member/memberKakaoLogin?nickName="+kakao_account.profile.nickname+"&email="+kakao_account.email;
		            }
		         });
		      }
		   });
		}

    'use strict';
    // 아이디와 닉네임 중복버튼을 클릭했는지의 여부를 확인하기위한 변수(버튼 클릭후에는 내용 수정처리 못하도록 처리)
    let idCheckSw = 0;
    let nickCheckSw = 0;
    
    function fCheck() {
    	// 유효성 검사.....
    	// 아이디,닉네임,성명,이메일,홈페이지,전화번호,비밀번호 등등....
    	
    	let regMid = /^[a-zA-Z0-9_]{4,20}$/;
    	let regPwd = /(?=.*[0-9a-zA-Z]).{4,20}$/;
      let regNickName = /^[가-힣]+$/;
      let regName = /^[가-힣a-zA-Z]+$/;
      let regEmail =/^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/;
    	let regTel = /\d{2,3}-\d{3,4}-\d{4}$/g;
    	
    	let mid = myform.mid.value.trim();
    	let pwd = myform.pwd.value;
    	let nickName = myform.nickName.value;
    	let name = myform.name.value;    	
    	let email =  myform.email.value; 	
    	let tel1 = myform.tel1.value;
    	let tel2 = myform.tel2.value.trim();
    	let tel3 = myform.tel3.value.trim();
    	let tel = tel1 + "-" + tel2 + "-" + tel3;
    	
    	let submitFlag = 0;		// 모든 체크가 정상으로 종료되게되면 submitFlag는 1로 변경처리될수 있게 한다.
    	
    	// 사진 업로드 체크를 위한 준비
    	let maxSize = 1024 * 1024 * 2; 	// 업로드할 회원사진의 용량은 2MByte까지로 제한한다.
    	let fName = myform.fName.value;
    	let ext = fName.substring(fName.lastIndexOf(".")+1).toUpperCase();	// 파일 확장자 발췌후 대문자로 변환
    	
    	// 앞의 정규식으로 정의된 부분에 대한 유효성체크
    	if(!regMid.test(mid)) {
    		alert("아이디는 4~20자리의 영문 소/대문자와 숫자, 언더바(_)만 사용가능합니다.");
    		myform.mid.focus();
    		return false;
    	}
    	else if(!regPwd.test(pwd)) {
        alert("비밀번호는 1개이상의 문자와 특수문자 조합의 6~24 자리로 작성해주세요.");
        myform.pwd.focus();
        return false;
      }
      else if(!regNickName.test(nickName)) {
        alert("닉네임은 한글만 사용가능합니다.");
        myform.nickName.focus();
        return false;
      }
      else if(!regName.test(name)) {
        alert("성명은 한글과 영문대소문자만 사용가능합니다.");
        myform.name.focus();
        return false;
      }
      /*  else if(!regEmail.test(email)) {
        alert("이메일 형식에 맞지않습니다.");
        myform.email.focus();
        return false;
      }  */
      else{
    	  submitFlag = 1;
      }

    	
    	if(tel2 != "" && tel3 != "") {
    	  if(!regTel.test(tel)) {
	    		alert("전화번호형식을 확인하세요.(000-0000-0000)");
	    		myform.tel2.focus();
	    		return false;
    	  }
    	  else {
    		  submitFlag = 1;
    	  }
    	}
    	else {		// 전화번호를 입력하지 않을시 DB에는 '010- - '의 형태로 저장하고자 한다.
    		tel2 = " ";
    		tel3 = " ";
    		tel = tel1 + "-" + tel2 + "-" + tel3;
    		submitFlag = 1;
    	}
    	
  		// 전송전에 파일에 관한 사항체크...(회원사진의 내역이 비었으면 noimage를 hidden필드인 photo필드에 담아서 전송한다.)
			  if(fName.trim() == "") {
				  myform.fName.value = "noimage.jpg";
				  submitFlag = 1;
				} 
			  else {
				  let fileInput = document.getElementById("fName");
				  let file = fileInput.files[0];
				  let fileSize = file.size;
			
			  if(ext != "JPG" && ext != "GIF" && ext != "PNG") {
			    alert("업로드 가능한 파일은 'JPG/GIF/PNG'파일 입니다.");
			    return false;
			  } 
			  else if(fName.indexOf(" ") != -1) {
			    alert("업로드 파일명에 공백을 포함할 수 없습니다.");
			    return false;
			  }
			  else if(fileSize > maxSize) {
			    alert("업로드 파일의 크기는 2MByte를 초과할 수 없습니다.");
			    return false;
			  }
			  	submitFlag = 1;
			}

  		
    	// 전송전에 모든 체크가 끝나면 submitFlag가 1로 되게된다. 이때 값들을 서버로 전송처리한다.
    	if(submitFlag == 1) {
    		if(idCheckSw == 0) {
    			alert("아이디 중복체크버튼을 눌러주세요!");
    			document.getElementById("midBtn").focus();
    		}
    		else if(nickCheckSw == 0) {
    			alert("닉네임 중복체크버튼을 눌러주세요!");
    			document.getElementById("nickNameBtn").focus();
    		}
    		else {
    			//alert("hobbys : " + hobbys);
    			
	    		//myform.email.value = email;
	    		myform.tel.value = tel;
	    		
		    	myform.submit();
    		}
    	}
    	else {
    		alert("회원가입 실패~~ 폼의 내용을 확인하세요.");
    	}
    	
    }
    
    // 아이디 중복체크
    function idCheck() {
    	let mid = myform.mid.value;
    	if(mid.trim() == "" || mid.length < 4 || mid.length > 20) {
    		alert("아이디를 확인하세요!(아이디는 4~20자 이내)");
    		myform.mid.focus();
    		return false;
    	}
    	
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/member/memberIdCheck",
    		data : {mid : mid},
    		success:function(res) {
    			if(res == "1") {
    				alert("이미 사용중인 아이디 입니다. 다시 입력해 주세요");
    				$("#mid").focus();
    			}
    			else  {
    				alert("사용 가능한 아이디 입니다.");
    				idCheckSw = 1;
    				$("#pwd").focus();
    			}
    		}
    	});
    }
    
    // 닉네임 중복체크
    function nickCheck() {
    	let nickName = myform.nickName.value;
    	if(nickName.trim() == "" || nickName.length < 2 || nickName.length > 20) {
    		alert("닉네임을 확인하세요!(닉네임는 2~20자 이내)");
    		myform.nickName.focus();
    		return false;
    	}
    	
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/member/memberNickCheck",
    		data : {nickName : nickName},
    		success:function(res) {
    			if(res == "1") {
    				alert("이미 사용중인 닉네임 입니다. 다시 입력해 주세요");
    				$("#nickName").focus();
    			}
    			else  {
    				alert("사용 가능한 닉네임 입니다.");
    				nickCheckSw = 1;
    				$("#name").focus();
    			}
    		}
    	});
    }
    
  </script>

</head>
<body>
	<div class="form-structor">
		<form method="post" action="${ctp}/member/memberJoin" name="myform" enctype="multipart/form-data">
		  <div class="signup">
		    <h2 class="form-title" id="signup"><span>or</span>Sign up</h2>
		    <div class="form-holder">
		      <input type="text" name="mid" id="mid" class="input" placeholder="ID" />
		      <input class="submit-btn" type="button" onclick="idCheck()" value="ID Check"/>
		      <input type="password" name="pwd" id="pwd" class="input" placeholder="Password" />
		      <input type="text" name="nickName" id="nickName" class="input" placeholder="nickName" />
		      <input class="submit-btn" type="button" onclick="nickCheck()" value="NickName Check"/>
		      <input type="text" name="name" id="name" class="input" placeholder="name" />
		      <input type="email" name="email" id="email" class="input" placeholder="Email" />
		      <div style="display: flex;">
		      	<input type="radio" name="gender" class="input" value="남자" /> Men
		      	<input type="radio" name="gender" class="input" value="여자" /> girl
		    	</div>
		    	<input type="date" name="birthday" value="<%=java.time.LocalDate.now() %>" class="input" />
		    	<div style="display: flex;">
			    	<input type="text" name="tel1" id="tel1" maxlength="3" class="input" placeholder="PhonNum" />-
			    	<input type="text" name="tel2" maxlength="4" class="input" placeholder="midlleNum" />-
			    	<input type="text" name="tel3" maxlength="4" class="input" placeholder="lastNum" />
			    </div>
		    	<input type="file" name="fName" id="fName" class="input" placeholder="profile" />
		    </div>
		    <button class="submit-btn" type="button" onclick="fCheck()">Sign up</button>
		    <button class="submit-btn" type="button" onclick="location.href='${ctp}/';" style="margin-bottom: 70px;">back</button>		    
		  </div>
		<!-- <input type="hidden" name="email" /> -->
    <input type="hidden" name="tel" />>
    <input type="hidden" name="fName"/>
	  </form>
	  <!--로그인하는 곳 -->
		<form method="post"  action="${ctp}/member/memberLogin">
		  <div class="login slide-up">
		    <div class="center">
		      <h2 class="form-title" id="login"><span>or</span>Log in</h2>
		      <div class="form-holder">
		        <input type="text" name="mid" id="mid" class="input" placeholder="ID" required autofocus />
		        <input type="password" name="pwd" id="pwd" class="input" placeholder="Password" required />
		        <div style="display: inline-block;">
						  <input type="checkbox" id="idSave" name="idSave">
						  <label for="chkBox">ID Save</label>
						</div>
						<div style="margin-left: 8px;">
						  <a href="${ctp}/member/memberIdFind" style="text-decoration: none; color: lightblue;">ID Search</a> / 
						  <a href="${ctp}/member/memberPwdFind" style="text-decoration: none; color: lightblue;">Password Search</a>
						</div>

		      </div>
		      <button class="submit-btn" type="submit">Log in</button>
		     	<a class="submit-btn" href="${ctp}/" style="width: 300px; text-align: center;" >back</a>
		    </div>
		  </div>
		</form>
	</div>
<script type="text/javascript">
console.clear();

const loginBtn = document.getElementById('login');
const signupBtn = document.getElementById('signup');

loginBtn.addEventListener('click', (e) => {
  let parent = e.target.parentNode.parentNode;
  Array.from(e.target.parentNode.parentNode.classList).find((element) => {
    if(element !== "slide-up") {
      parent.classList.add('slide-up')
    }else{
      signupBtn.parentNode.classList.add('slide-up')
      parent.classList.remove('slide-up')
    }
  });
});

signupBtn.addEventListener('click', (e) => {
  let parent = e.target.parentNode;
  Array.from(e.target.parentNode.classList).find((element) => {
    if(element !== "slide-up") {
      parent.classList.add('slide-up')
    }else{
      loginBtn.parentNode.parentNode.classList.add('slide-up')
      parent.classList.remove('slide-up')
    }
  });
});
</script>
</body>
</html>