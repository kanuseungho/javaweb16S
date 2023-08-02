<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>아이디 찾기 - 인테리어 사이트</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="${ctp}/css/style.css">
  <style>
    /* 스타일 추가 */
    body {
      background-color: white;
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }

    .container {
      max-width: 600px;
      margin: 0 auto;
      padding: 20px;
      background-color: #fff;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border: 1px black solid; 
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-label {
      display: block;
      margin-bottom: 5px; 
      font-weight: bold;
    } 

    .form-input {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    .btn {
      display: inline-block;
      padding: 10px 20px;
      font-size: 16px;
      font-weight: bold;
      text-align: center;
      text-decoration: none;
      background-color: #ff6f00;
      color: #fff;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    .btn-primary {
      background-color: #e65100;
    }

    .footer {
      background-color: #333;
      color: #fff;
      text-align: center;
      padding: 10px;
      position: fixed;
      bottom: 0;
      width: 100%;
    }
    
    .card {
      background-color: #fff;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      margin-bottom: 20px;
      border: 1px black solid;
    }
    
    .card-img {
      max-width: 100%;
      border-radius: 10px;
      margin-bottom: 10px;
    }
  </style>
</head>
<body>
   <header class="header">
     <nav class="navbar">
       <a class="navbar-brand" href="${ctp}/">
         <img src="${ctp}/images/brend.jpg" width="150px;" height="100px;" style="margin-left: 30px; margin-top: 30px;" alt="Logo">
       </a>
     </nav>
   </header>

   <section class="hero">
     <div class="container">
       <h1 class="hero-title">아이디 찾기</h1>
       <div class="card">
         <form action="${ctp}/member/memberIdFind" method="post" class="form">
           <div class="form-group">
             <label for="name" class="form-label">이름</label>
             <input type="text" class="form-input" id="name" name="name" required style="width: 90%;">
           </div>
           <div class="form-group">
             <label for="nickName" class="form-label">닉네임</label>
             <input type="text" class="form-input" id="nickName" name="nickName" required style="width: 90%;">
           </div>
           <div class="form-group">
             <label for="email" class="form-label">이메일</label>
             <input type="email" class="form-input" id="email" name="email" required style="width: 90%;">
           </div>
           <button type="submit" class="btn btn-primary">아이디 찾기</button>
         </form>
       </div>

     </div>
   </section>
<img src="${ctp}/images/doublebard.jpg" style="width: 100%; height: 70px;" />
   <footer class="footer">
     <p>&copy; 2023 인테리어 사이트. All rights reserved.</p>
   </footer>
</body>
</html>
