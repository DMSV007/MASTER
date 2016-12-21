<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- CSS files starts-->
<link href="<c:url value="resources/css/bootstrap.min.css" />"rel="stylesheet">
<link href="<c:url value="resources/css/bootstrap.css" />"rel="stylesheet">
<link href="<c:url value="resources/css/bootstrap-theme.css" />"rel="stylesheet">
<link href="<c:url value="resources/css/bootstrap-theme.min.css" />"rel="stylesheet">
	<!-- CSS files ends-->
	<!-- JS Files Starts -->
<script src="<c:url value="resources/js/jquery.min.js" />"></script>
<script src="<c:url value="resources/js/bootstrap.js" />"></script>
<script src="<c:url value="resources/js/bootstrap.min.js" />"></script>
<script src="<c:url value="resources/js/angular.min.js" />"></script>
	<!-- JS Files ends -->
</head>
<body ng-app="menu" ng-controller="postToDetail">
	<!-- Navbar starts -->
	<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">DMSV</a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>
	<!-- Navbar ends -->
 
 <div id="table" class="container">
  <h2>Module Name</h2>
  <p>The .table class adds basic styling (light padding and only horizontal dividers) to a table:</p>
  <table class="table">
    <thead>
      <tr>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Email</th>
      </tr>
    </thead>
    <tbody>
    <%for (int i=0;i<10;i++) {%>
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
      <%} %>
    </tbody>
  </table>
</div>
 
 
</body>
<script >
var app = angular.module("menu", []);
app.controller("postToDetail", function($scope, $http,$location) {
	
	$scope.go = function ( path ) {
		alert();
		  $location.path( path );
		};
		
	$scope.submit = function() {
		alert($scope.moduleID); 
		$http({
			method : "POST",
			url : "detailPage.jsp",
			data : $scope.menu,
			headers : {
				'Content-Type' : 'application/x-www-form-urlencoded'
			}

		}).success(function(data) {
			
		}).error(function(data, status) {
			
		});

	};
});

</script>
</html>