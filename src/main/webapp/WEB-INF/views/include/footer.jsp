<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

<style>	 
	 .orange-footer{
	 	background-color: orange;
	  padding: 20px;
	  text-align: center;
	  color: white;
	  font-weight: bold;
	 }
</style>
<footer class="orange-footer">
  <p>This is the footer content.</p>
  <a href="${ctp}/product/tableWere/test" class="w3-bar-item w3-button">오류404</a>
  <a href="${ctp}/errorPage/error500" class="w3-bar-item w3-button">오류500</a>
  <i class="fa fa-facebook-official w3-hover-opacity"></i>
  <i class="fa fa-instagram w3-hover-opacity"></i>
  <i class="fa fa-snapchat w3-hover-opacity"></i>
  <i class="fa fa-pinterest-p w3-hover-opacity"></i>
  <i class="fa fa-twitter w3-hover-opacity"></i>
  <i class="fa fa-linkedin w3-hover-opacity"></i>
</footer>   