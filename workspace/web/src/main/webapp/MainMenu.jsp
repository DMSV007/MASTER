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
	<!-- FOOTER -->
    <jsp:include page="header.jsp" />  	
	<!-- Navbar ends -->

<%for(int i=0;i<5;i++){ %>
<div class="col-lg-10 col-sm-offset-1 well">
<!-- Group starts -->

<div class="panel-group">
  <div class="panel panel-primary">
    <div class="panel-heading">
      <h4 class="panel-title">Group Name
        <a data-toggle="collapse" href="#collapse<%=i%>">  Click Here >></a>
      </h4>
    </div>
    <div id="collapse<%=i%>" class="panel-collapse collapse">
      <div class="panel-body">
      <%for(int j=0;j<6;j++){ %>
      <div class="col-sm-3 col-sm-offset-1 well">
        <button class="btn btn-info btn-md" type="button" ng-click="go('table')"  value="1001">
         <span class="glyphicon glyphicon-asterisk"></span> User<br>
         <span class="badge">5</span> <span class="badge"> pending records</span>
        </button>
        </div>
        <%} %>
      </div>
    </div>
  </div>
</div>

<!-- Group ends -->
 </div>
 <%} %>

</body>
<script >
var app = angular.module("menu", []);
app.controller("postToDetail", function($scope, $http,$location) {
	
	$scope.go = function ( path ) {
		    window.location.assign("listing.jsp")
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