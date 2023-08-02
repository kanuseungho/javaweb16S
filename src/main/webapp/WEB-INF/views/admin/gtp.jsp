<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>

<head>
  <title>chatGPT API</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <style>
  /* page-loading */
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

  /* chatbot message */
  .chatbot-message-two {
    border: 1px solid #ccc;
    background-color: #f2f2f2;
    padding: 10px;
    margin: 10px 0;
    border-radius: 8px;
    max-width: 70%;
  }
  /* user message */
  .user-message-two {
    border: 1px solid #ccc;
    background-color: #f2f2f2;
    padding: 10px;
    margin: 10px 0;
    border-radius: 8px;
    max-width: 70%;
    clear: both; /* Ensure that the message does not wrap around other elements */
  }

  /* chatbot message container */
 .chat-container-two {
    position: fixed;
    bottom: 520px; /* Adjust this value to lift the chat container higher */
    right: 20px;
    display: flex; /* Use flexbox to keep chatbot and user input together */
    flex-direction: column; /* Stack the messages and input vertically */
    align-items: flex-end; /* Align items to the right side */
    max-width: 400px; /* Limit the container width */
  }

  /* user input container */
  .user-input-container-two {
    position: fixed;
    bottom: 480px; /* Adjust this value to lift the user input higher */
    right: 20px;
    display: flex; /* Use flexbox to align items horizontally */
    align-items: center; /* Center items vertically */
    background-color: #f2f2f2;
    border: 1px solid #ccc;
    border-radius: 20px;
    padding: 10px;
    max-width: 300px; /* Limit the container width */
  }

  .user-input-container-two input[type="text"] {
    flex: 1; /* Let the input take the remaining space */
    border: none;
    outline: none;
    background-color: transparent;
    margin-left: 10px;
    font-family: Arial, sans-serif;
    font-size: 16px;
  }

  .user-input-container-two button {
    border: none;
    background-color: transparent;
    cursor: pointer;
    font-family: Arial, sans-serif;
    font-size: 16px;
  }
</style>

</head>

<body>

  
  <div class="chat-container-two">
    <div class="chat-container-two" id="result">
      <div class="chatbot-message-two">You are a helpful assistant.</div>
      <!-- The chatbot response will be added here -->
    </div>

    <div class="user-input-container-two">
      <input type="text" id="keywords" name="keywords" required />
      <button onclick="chatGPT()">입력</button>
    </div>
  </div>

  <div id="loading">
    <img src="https://studentrights.sen.go.kr/images/common/loading.gif">
  </div>
  
  <script>
    $(document).ready(function () {
      $('#loading').hide();
    });

    function chatGPT() {
      const api_key = "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"  // <- API KEY 입력
      const keywords = document.getElementById('keywords').value
      $('#loading').show();

      const messages = [
        { role: 'system', content: 'You are a helpful assistant.' },
        { role: 'user', content: keywords + '에 대하여 최대한 도움이 되는 답변을 해줘.' },
      ]

      const data = {
        model: 'gpt-3.5-turbo',
        temperature: 0.5,
        n: 1,
        messages: messages,
      }

      $.ajax({
        url: "https://api.openai.com/v1/chat/completions",
        method: 'POST',
        headers: {
          Authorization: "Bearer " + api_key,
          'Content-Type': 'application/json',
        },
        data: JSON.stringify(data),
      }).then(function (	response) {
        $('#loading').hide();
        console.log(response)
        let result = document.getElementById('result')
        let pre = document.createElement('pre')

        pre.innerHTML = "\n\n" + response.choices[0].message.content
        result.appendChild(pre)

        document.getElementById('keywords').value = ''
      });
    }
  </script>
</body>

</html>