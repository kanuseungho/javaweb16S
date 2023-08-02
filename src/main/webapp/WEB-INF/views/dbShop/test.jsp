<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.3.0/kakao.min.js"
	  integrity="sha384-70k0rrouSYPWJt7q9rSTKpiTfX6USlMYjZUtr1Du+9o4cGvhPAWxngdtVZDdErlh" crossorigin="anonymous"></script>
	<script>
	  Kakao.init('1b990f0e7b4e72a88a3b4b2646695d22'); // 사용하려는 앱의 JavaScript 키 입력
	</script>	
 	
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
</head>
<body>
   <jsp:include page="/WEB-INF/views/include/nav.jsp" />
   <jsp:include page="/WEB-INF/views/include/slide2.jsp" />
   <p><br/></p>
	  <a id="kakaotalk-sharing-btn" href="javascript:shareMessage()">
	  <img src="https://developers.kakao.com/assets/img/about/logos/kakaotalksharing/kakaotalk_sharing_btn_medium.png"
	    alt="카카오톡 공유 보내기 버튼" />
		</a>
   <p><br/></p>
   <script>	
 		function shareMessage() {
 			Kakao.Share.createDefaultButton({
 				  container: '#kakaotalk-sharing-btn',
 				  objectType: 'feed',
 				  content: {
 				    title: '오늘의 디저트',
 				    description: '아메리카노, 빵, 케익',
 				    imageUrl:
 				      'https://mud-kage.kakao.com/dn/NTmhS/btqfEUdFAUf/FjKzkZsnoeE4o19klTOVI1/openlink_640x640s.jpg',
 				    link: {
 				      mobileWebUrl: 'https://developers.kakao.com',
 				      webUrl: 'https://developers.kakao.com',
 				    },
 				  },
 				  itemContent: {
 				    profileText: 'Kakao',
 				    profileImageUrl: 'https://mud-kage.kakao.com/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
 				    titleImageUrl: 'https://mud-kage.kakao.com/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
 				    titleImageText: 'Cheese cake',
 				    titleImageCategory: 'Cake',
 				    items: [
 				      {
 				        item: 'Cake1',
 				        itemOp: '1000원',
 				      },
 				      {
 				        item: 'Cake2',
 				        itemOp: '2000원',
 				      },
 				      {
 				        item: 'Cake3',
 				        itemOp: '3000원',
 				      },
 				      {
 				        item: 'Cake4',
 				        itemOp: '4000원',
 				      },
 				      {
 				        item: 'Cake5',
 				        itemOp: '5000원',
 				      },
 				    ],
 				    sum: 'Total',
 				    sumOp: '15000원',
 				  },
 				  social: {
 				    likeCount: 10,
 				    commentCount: 20,
 				    sharedCount: 30,
 				  },
 				  buttons: [
 				    {
 				      title: '웹으로 이동',
 				      link: {
 				        mobileWebUrl: 'https://developers.kakao.com',
 				        webUrl: 'https://developers.kakao.com',
 				      },
 				    },
 				    {
 				      title: '앱으로 이동',
 				      link: {
 				        mobileWebUrl: 'https://developers.kakao.com',
 				        webUrl: 'https://developers.kakao.com',
 				      },
 				    },
 				  ],
 				});
		}
	</script>
   <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>