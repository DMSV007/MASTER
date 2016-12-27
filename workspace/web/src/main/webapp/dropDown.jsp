<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="resources/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>

<style type="text/css">

.nav>li>a:hover, .nav>li>a:focus, .nav .open>a, .nav .open>a:hover, .nav .open>a:focus {
    background:#fff;
}
.dropdown {
    background:#fff;
    border:1px solid #ccc;
    border-radius:4px;
    width:300px;
}
.dropdown-menu>li>a {
    color:#428bca;
}
.dropdown ul.dropdown-menu {
    border-radius:4px;
    box-shadow:none;
    margin-top:20px;
    width:300px;
}
.dropdown ul.dropdown-menu:before {
    content: "";
    border-bottom: 10px solid #fff;
    border-right: 10px solid transparent;
    border-left: 10px solid transparent;
    position: absolute;
    top: -10px;
    right: 16px;
    z-index: 10;
}
.dropdown ul.dropdown-menu:after {
    content: "";
    border-bottom: 12px solid #ccc;
    border-right: 12px solid transparent;
    border-left: 12px solid transparent;
    position: absolute;
    top: -12px;
    right: 14px;
    z-index: 10;
}
</style>
</head>
<!-- Navigation -->
   <ul class="nav navbar-nav">
  <li class="dropdown">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Arunkumar Maha<span class="glyphicon glyphicon-user pull-right"></span></a>
    <ul class="dropdown-menu">
      <li>
        <a href="#acc">Account Settings <span class="glyphicon glyphicon-cog pull-right"></span></a>
      </li>
      <li class="divider"></li>
      <li>
        <a href="#fav">Favourites<span class="glyphicon glyphicon-heart pull-right"></span></a>
      </li>
      <li class="divider"></li>
      <li>
        <a href="#status">Status <span class="glyphicon glyphicon-stats pull-right"></span></a>
      </li>
      <li class="divider"></li>
      <li>
        <a href="#logout">Logout<span class="glyphicon glyphicon-log-out pull-right"></span></a>
      </li>
    </ul>
  </li>
</ul>
<!-- /.container -->
<!-- Navigation ends-->
</html>