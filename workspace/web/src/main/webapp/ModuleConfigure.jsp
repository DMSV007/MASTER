<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<link href="<c:url value="resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<script src="<c:url value="resources/js/jquery.min.js" />"></script>
<script src="<c:url value="resources/js/bootstrap.min.js" />"></script>
<script src="<c:url value="resources/js/angular.min.js" />"></script>


<title>DMSV</title>
</head>
<body ng-app="app" ng-controller="postController">

	<div class="container text-center ">
		<div class="row">
			<br>
		</div>
		<div class="row">
			<br>
		</div>
		<div class="col-lg-10 col-sm-offset-1 well" style="background-color:#76dbdb">
			<form name="login" ng-submit="submitForm()">
				<div class="col-lg-6 col-sm-offset-3">
					<div class="form-group ">
						<h3>
							<b>Module Set up</b>
						</h3>
					</div>
					<div class="form-group">
						<label>Module Id</label> <input type="text" name="moduleid"
							class="form-control" id="moduleid" ng-model="user.moduleid"
							required>
					</div>
					<div class="form-group">
						<label>Module Name</label> <input type="text" name="modulename"
							class="form-control" id="modulename" ng-model="user.modulename"
							required>
					</div>
					
					  <div class="form-group">
					   <label for="Field Type">Field Type</label>
                    <select class="form-control" class="glyphicon glyphicon-search"  ng-model="user.fieldType">
                        <option selected disabled>Select Field Type</option>
                        <option>TextBox</option>
                        <option>SelectBox</option>
                        <option>Radio Button</option>
                        <option>Check Box</option>
                    </select>
            </div>
            <div id ="fieldBar" ng-show="user.fieldType">
            <div class="col-lg-10 col-sm-offset-1 well" style="background-color:398484" >
            <div class="form-group">
						<label>Field Name</label> <input type="text" name="fieldName"
							class="form-control" id="fieldName" ng-model="user.fieldName"
							required>
							<label>Field Size</label> <input type="text" name="fieldSize"
							class="form-control" id="fieldSize" ng-model="user.fieldSize"
							required>
							<label>Field Aligment</label> <input type="text" name="fieldaligment"
							class="form-control" id="fieldaligment" ng-model="user.fieldaligment"
							required>
							<div class="row">
			<br>
		</div>
							<button type="submit" class="btn btn-primary">Add Field</button>
					</div>
					</div>
            </div>
					
				            </div>
				            </form>
				
		</div>
		
	</div>
</body>
<script>
	var app = angular.module("app", []);
	app.controller("postController", function($scope, $http) {
		$scope.user = {};
		
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
