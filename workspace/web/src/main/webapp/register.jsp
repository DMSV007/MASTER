<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<link href="<c:url value="resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<script src="<c:url value="resources/js/jquery.min.js" />"></script>
<script src="<c:url value="resources/js/bootstrap.min.js" />"></script>
<script src="<c:url value="resources/js/angular.min.js" />"></script>


<title>Register</title>
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
					<h3><b>Sing Up Here</b></h3>
				</div>
				<div class="form-group">
					<label>User Name:</label> <input type="text" name="username"
						class="form-control" id="username" ng-model="user.username"
						required>
				</div>
				<div class="form-group">
					<label>Password:</label> <input type="password" name="password"
						id="password" class="form-control" ng-model="user.password"
						required>
				</div>
				<div class="form-group">
					<label>Confirm Password:</label> <input type="password" name="confirmPassword"
						id="confirmPassword" class="form-control" ng-model="user.confirmPassword"
						required>
				</div>
				<div class="form-group">
					<label>Mobile No:</label> <input pattern="[0-9]{10}" type="text" name="mobileno" title="Enter valid Mobile No"
						class="form-control" id="mobileno" ng-model="user.mobileno">
				</div>
				<div class="form-group">
					<label>Email Id:</label> <input pattern="[^ @]*@[^ @]*" type="text" name="email" title="Enter valid Email Id"
						class="form-control" id="email" ng-model="user.email">
				</div>
				<div class="form-group">
					<a href="index.jsp" type="button" class=" glyphicon glyphicon-arrow-left btn btn-primary " >Back</a>
					&nbsp;&nbsp;&nbsp;
					<button type="submit" class=" glyphicon glyphicon-save btn btn-primary ">Save</button>
					
				</div>
			</form>
		</div>
	</div>
</body>
	<!-- FOOTER -->
	<br><br>
    <jsp:include page="footer.jsp" />  	
<script>
	var app = angular.module("app", []);
	app.controller("postController", function($scope, $http) {
		$scope.user = {};
		console.log("-->" + $scope.user)
		$scope.submitForm = function() {
			$http({
				method : "POST",
				url : "/web/register",
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
