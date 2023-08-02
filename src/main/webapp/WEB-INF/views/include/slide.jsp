<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
  <!-- Automatic Slideshow Images -->
  
  
  <c:forEach var="bannerVO" items="${bannerVOS}"> 
  <div style="margin-top: 0px;">
   <c:if test="${bannerVO.photoPosition=='carousel1'}">
		 <div class="mySlides w3-display-container w3-center">
		   <a href="${ctp}/product/productDetailed?idx=${bannerVO.photoRoute}"><img src="${ctp}/data/banner/${bannerVO.imageFile}" style="width:100%; height:400px"></a>
		   <div class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">		       
		   </div>
		 </div>
	 </c:if> 
	 <c:if test="${bannerVO.photoPosition=='carousel2'}">
		 <div class="mySlides w3-display-container w3-center">
		   <a href="${ctp}/product/productDetailed?idx=${bannerVO.photoRoute}"><img src="${ctp}/data/banner/${bannerVO.imageFile}" style="width:100%; height:400px"></a>
		   <div class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">		        
		   </div>
		 </div>
	 </c:if>
	 <c:if test="${bannerVO.photoPosition=='carousel3'}">
		 <div class="mySlides w3-display-container w3-center">
		   <a href="${ctp}/product/productDetailed?idx=${bannerVO.photoRoute}"><img src="${ctp}/data/banner/${bannerVO.imageFile}" style="width:100%; height:400px"></a>
		   <div class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">		         
		   </div>
		 </div>
	 </c:if>
  </div>
  </c:forEach>
  
  
	<script>
		// Automatic Slideshow - change image every 4 seconds
		var myIndex = 0;
		carousel();
	
		function carousel() { 
		  var i;
		  var x = document.getElementsByClassName("mySlides");
		  for (i = 0; i < x.length; i++) {
		    x[i].style.display = "none";  
		  }
		  myIndex++;
		  if (myIndex > x.length) {myIndex = 1}    
		  x[myIndex-1].style.display = "block";  
		  setTimeout(carousel, 4000);    
		}
	
		// Used to toggle the menu on small screens when clicking on the menu button
		function myFunction() {
		  var x = document.getElementById("navDemo");
		  if (x.className.indexOf("w3-show") == -1) {
		    x.className += " w3-show";
		  } else { 
		    x.className = x.className.replace(" w3-show", "");
		  }
		}
	
		// When the user clicks anywhere outside of the modal, close it
		var modal = document.getElementById('ticketModal');
		window.onclick = function(event) {
		  if (event.target == modal) {
		    modal.style.display = "none";
		  }
		}
	</script>