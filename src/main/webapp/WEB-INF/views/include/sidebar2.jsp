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
.sidebar {
  width: 200px;
  background-color: #FBFBEF;
}

.sidebar ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
}

.sidebar li {
  padding: 8px 16px;
}

.sidebar li a {
  text-decoration: none;
  color: #333;
  display: block;
}

.sidebar li a:hover {
  background-color: #ddd;
}

.sidebar .submenu { 
  display: none;
}

.sidebar .has-submenu:hover .submenu {
  display: block;
}

.sidebar form {
  margin-top: 16px;
}

.sidebar form div {
  margin-bottom: 8px;
}

.sidebar form label {
  margin-left: 8px;
}

.sidebar form button {
  padding: 8px 16px;
  border-radius: 4px;
}

.sidebar form button i {
  margin-right: 4px;
}




</style>
<script type="text/javascript">
window.addEventListener('DOMContentLoaded', (event) => {
	  const menuItems = document.querySelectorAll('.has-submenu');
	  const submenus = document.querySelectorAll('.submenu');

	  menuItems.forEach((menuItem, index) => {
	    menuItem.addEventListener('click', (event) => {
	      event.preventDefault();
	      submenus.forEach((submenu, submenuIndex) => {
	        if (submenuIndex === index) {
	          submenu.classList.toggle('active');
	        } else {
	          submenu.classList.remove('active');
	        }
	      });
	    });
	  });

	  document.addEventListener('click', (event) => {
	    const target = event.target;
	    const isMenuItem = Array.from(menuItems).some((menuItem) => menuItem.contains(target));
	    const isSubmenu = Array.from(submenus).some((submenu) => submenu.contains(target));

	    if (!isMenuItem && !isSubmenu) {
	      submenus.forEach((submenu) => {
	        submenu.classList.remove('active');
	      });
	    }
	  });
	});

</script>
</head>
<body>
  <div class="sidebar">
    <ul>
      <li class="has-submenu">
        <a href="#">카테고리</a>
        <ul class="submenu">
          <li><input type="text" placeholder="카테고리 검색" class="form form-control" /></li>
          <li><a href="#">디너 접시</a></li>
          <li><a href="#">소접시</a></li>
          <li><a href="#">어린이 식기</a></li>
        </ul>
      </li>
      <li class="has-submenu">
        <a href="#">메뉴 2</a>
        <ul class="submenu">
          <li><a href="#">서브메뉴 2-1</a></li>
          <li><a href="#">서브메뉴 2-2</a></li>
          <li><a href="#">서브메뉴 2-3</a></li>
        </ul>
      </li>
      <li class="has-submenu">
        <a href="#">메뉴 3</a>
        <ul class="submenu">
          <li><a href="#">서브메뉴 3-1</a></li>
          <li><a href="#">서브메뉴 3-2</a></li>
          <li><a href="#">서브메뉴 3-3</a></li>
        </ul>
      </li>
      <li class="has-submenu">
        <a href="#">메뉴 4</a>
        <ul class="submenu">
          <li><a href="#">서브메뉴 4-1</a></li>
          <li><a href="#">서브메뉴 4-2</a></li>
          <li><a href="#">서브메뉴 4-3</a></li>
        </ul>
      </li>
    </ul>
    <form>
      <div>
        <input type="checkbox" id="stockCheckbox">
        <label for="stockCheckbox">재고있는 상품만 보기</label>
      </div>
      <div>
        <button type="reset" class="btn btn-secondary">
          <i class="fa-solid fa-rotate-right"></i>
          필터초기화
        </button>
      </div>
    </form>
  </div>
</body>
</html>
