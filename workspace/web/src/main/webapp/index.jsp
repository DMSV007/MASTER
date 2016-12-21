<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Login</title>
<link href="<c:url value="resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<script src="<c:url value="resources/js/jquery.min.js" />"></script>
<script src="<c:url value="resources/js/bootstrap.min.js" />"></script>
<script src="<c:url value="resources/js/angular.min.js" />"></script>


<!-- <link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.16/angular.min.js"></script> -->
</head>
<body ng-app="app" ng-controller="postController">

	<div class="container text-center ">
		<div class="row">
			<br>
		</div>
		<div class="row">
			<br>
		</div>
		<div class="col-sm-4 col-sm-offset-4 well">
			<form name="login" ng-submit="submitForm()">

				<div class="form-group ">
					<h3><b>Validate Your Credentials Below!/<b></h3>
				</div>
				<div class="form-group">
					<label>User Id:</label> <input type="text" name="username"
						class="form-control" id="username" ng-model="user.username">
					<span ng-show="errorUserName">{{errorUserName}}</span>
				</div>
				<div class="form-group">
					<label>Password:</label> <input type="password" name="password"
						id="password" class="form-control" ng-model="user.password">
					<span ng-show="errorPassword">{{errorPassword}}</span>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary">Sing in</button>
					&nbsp;&nbsp;&nbsp;
					<a href="register.jsp" type="button" class="btn btn-primary" >Sing up</a>
				</div>
			</form>
		</div>
	</div>
</body>
<script>
	var app = angular.module("app", []);
	app.controller("postController", function($scope, $http) {
		$scope.user = {};
		console.log("-->" + $scope.user)
		$scope.submitForm = function() {
			$http({
				method : "POST",
				url : "/angular-sample/login",
				data : $scope.user,
				headers : {
					'Content-Type' : 'application/x-www-form-urlencoded'
				}

			}).success(function(data) {
				console.log(data.reDirectPath);
				alert(data.message);
				window.location = data.reDirectPath;
			}).error(function(data, status) {
				alert(data.message);
			});

		};
	});
</script>
</html>
