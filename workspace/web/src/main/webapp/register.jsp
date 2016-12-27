<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<link href="resources/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/angular.min.js"></script>



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
                <div class="icon-addon addon-lg">
                    <input type="text" placeholder="User Name" class="form-control" name="username" id="username" ng-model="user.username" required>
                    <label for="username" class="glyphicon glyphicon-user" rel="tooltip" title="username"></label>
                </div>
            	</div>

				<div class="form-group">
                <div class="icon-addon addon-lg">
                    <input type="text" placeholder="Password" class="form-control" name="password" id="password" ng-model="user.password" required>
                    <label for="password" class="glyphicon glyphicon-eye-close" rel="tooltip" title="password"></label>
                </div>
            	</div>
				<div class="form-group">
                <div class="icon-addon addon-lg">
                    <input type="text" placeholder="Confirm Password" class="form-control" name="confirmPassword" id="confirmPassword" ng-model="user.confirmPassword" required>
                    <label for="confirmPassword" class="glyphicon glyphicon-hand-right" rel="tooltip" title="confirmPassword"></label>
                </div>
            	</div>
				<div class="form-group">
                <div class="icon-addon addon-lg">
                    <input type="text" pattern="[0-9]{10}" placeholder="Mobile No" class="form-control" name="mobileNo" id="mobileNo" title="Enter valid Mobile No" ng-model="user.mobileNo">
                    <label for="mobileNo" class="glyphicon glyphicon-search" rel="tooltip" title="mobileNo"></label>
                </div>
            	</div>
				<div class="form-group">
                <div class="icon-addon addon-lg">
                    <input type="text" pattern="[^ @]*@[^ @]*" placeholder="Email Id" class="form-control" name="emailId" id="emailId" title="Enter valid Email Id" ng-model="user.emailId">
                    <label for="emailId" class="glyphicon glyphicon-search" rel="tooltip" title="emailId"></label>
                </div>
            	</div>
				<div class="form-group">
					<a href="index.jsp" type="button" class=" glyphicon glyphicon-arrow-left btn btn-primary"> Back</a>
					&nbsp;&nbsp;&nbsp;
					<button type="submit" class=" glyphicon glyphicon-save btn btn-primary">  Save</button>
					
				</div>
			</form>
		</div>
	</div>
</body>
	<!-- FOOTER -->
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
