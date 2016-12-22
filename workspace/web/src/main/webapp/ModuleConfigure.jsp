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

		<div class="row">
			<br>
		</div>
		<div class="row">
			<br>
		</div>
		<form name="login" ng-submit="submitForm()">
		<div class="col-xs-5 col-sm-offset-1 well" style="background-color:#76dbdb">
			
				<!-- <div class="col-lg-6 col-sm-offset-3"> -->
					<div class="form-group ">
						<h3>
							<b>Module Set up</b>
						</h3>
					</div>
					<div class="form-group">
						<label>Module Group</label> <input type="text" name="modulegroup"
							class="form-control" id="modulegroup" ng-model="user.modulegroup"
							required>
					</div>
					<div class="form-inline">
  <div class="form-group">
    <label>Module Id</label>
    <input type="text" name="modulegroup"
							class="form-control" id="modulegroup" ng-model="user.modulegroup"
							required>
  </div>
  <div class="form-group">
    <label >Module Order</label>
    <input type="text" class="form-control" name="modulegroup"
							class="form-control" id="modulegroup" ng-model="user.modulegroup"
							required>
  </div>
</div>
					<div class="form-group">
						<label>Module Name</label> <input type="text" name="modulename"
							class="form-control" id="modulename" ng-model="user.modulename"
							required>
					</div>
					
					  <div class="form-group">
					   <label for="Field Type">Field Type</label>
                    <select class="form-control glyphicon glyphicon-search"   ng-model="user.fieldType">
                        <option selected disabled>Select Field Type</option>
                        <option>TextBox</option>
                        <option>SelectBox</option>
                        <option>Radio Button</option>
                        <option>Check Box</option>
                    </select>
            </div>
				           
				
		</div>
		 <div id ="fieldBar" ng-show="user.fieldType">
		 
		<div class="col-xs-4 col-sm-offset-1 well" style="background-color:398484" >
		<div class="form-group ">
						<h3>
							<b>Field Setup</b>
						</h3>
					</div>
            <div class="form-group">
						<label>Field Name</label> <input type="text" name="fieldName"
							class="form-control" id="fieldName" ng-model="user.fieldName"
							required>
							<label>Field Size</label> <input type="text" name="fieldSize"
							class="form-control" id="fieldSize" ng-model="user.fieldSize"
							required>
							<label>Field Alignment</label> <input type="text" name="fieldaligment"
							class="form-control" id="fieldaligment" ng-model="user.fieldaligment"
							required>
							<div class="row">
			<br>
		</div>
							<button type="submit" id="addfields" class="btn btn-primary">Add Field</button>
					</div>
					</div>
					</div>
					 </form>
					 <div id ="tableval" ng-show="addfields"> 
					 <div class="col-md-8 col-sm-offset-2 well" style="background-color:398484">
					 <div class="table-responsive">
  <table class="table">
  <thead>
      <tr>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Email</th>
      </tr>
    </thead>
    <tbody>
    <%for (int i=0;i<5;i++) {%>
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
      <%} %>
    </tbody>
  </table>
</div>
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
				url : "/web/moduleConfig",
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
