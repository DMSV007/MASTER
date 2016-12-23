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
		<div class="col-xs-5 col-sm-offset-1 well"
			style="background-color: #76dbdb">

			<!-- <div class="col-lg-6 col-sm-offset-3"> -->
			<div class="form-group ">
				<h3>
					<b>Module Setup</b>
				</h3>
			</div>
			<div class="form-group">
				<label>Module Group</label> <input type="text" name="moduleGroup"
					class="form-control" id="moduleGroup" ng-model="user.moduleGroup"
					required>
			</div>
			<div class="form-inline">
				<div class="form-group">
					<label>Module Id</label> <input type="number" name="moduleId"
						class="form-control" id="moduleId" ng-model="user.moduleId"
						required>
				</div>
				<div class="form-group">
					<label>Module Order</label> <input type="number" class="form-control"
						name="moduleOrder" class="form-control" id="moduleOrder"
						ng-model="user.moduleOrder" required>
				</div>
			</div>
			<div class="form-group">
				<label>Module Name</label> <input type="text" name="moduleName"
					class="form-control" id="moduleName" ng-model="user.moduleName"
					required>
			</div>
			
			<div class="form-group">
			<label>Field Types</label>
			<div class="col-xs-10 col-sm-offset-1 well"
				style="background-color: 398484">
				<div ng-repeat="fieldType in fieldList">
					<input type="checkbox" ng-model="fieldType.checked" 
						ng-click="updateSelection($index, fieldList,fieldType.checked)">
					{{fieldType.name}}
				</div>
			</div>
			</div>

		</div>
		<div id="fieldBar" ng-show="user.fieldTypem">
			<div class="col-xs-4 col-sm-offset-1 well"
				style="background-color: 398484">
				<div class="form-group ">
					<h3>
						<b>Field Setup</b>
					</h3>
				</div>
				<div class="form-group">
					<label>Field Name</label> <input type="text" name="fieldName"
						class="form-control" id="fieldName" ng-model="user.fieldName"
						required> <label>Field Size</label> <input type="number"
						name="fieldSize" class="form-control" id="fieldSize"
						ng-model="user.fieldSize" required> <label>Field
						Alignment</label> <input type="number" name="fieldAlignOrder"
						class="form-control" id="fieldAlignOrder"
						ng-model="user.fieldAlignOrder" required>

					<div class="form-group">
						<label>Data Types</label>
					<div class="col-xs-10 col-sm-offset-1 well"
						style="background-color: #76dbdb"">
						<label ng-repeat="dataType in dataTypeList"> <input
							type="checkbox" ng-model="dataType.checked"
							ng-click="updateDataType($index, dataTypeList,dataType.checked)">
							{{dataType.name}}&nbsp;&nbsp;
						</label>
					</div>
					</div>

					<div class="form-group">
					<label>Field Values<small>(Enter values with (,) delimiter)</small></label>
						<textarea class="form-control" ng-model="user.fieldValues" style="min-width: 100%"></textarea>
					</div>

					<div class="row">
						<br>
					</div>
					<button type="submit" class="btn btn-primary">Add Field</button>
				</div>
			</div>
		</div>
	</form>
	<div id="tableval" ng-show="addfields">
		<div class="col-md-8 col-sm-offset-2 well"
			style="background-color: 398484">
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
						<%
							for (int i = 0; i < 5; i++) {
						%>
						<tr>
							<td>John</td>
							<td>Doe</td>
							<td>john@example.com</td>
						</tr>
						<%
							}
						%>
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

		$scope.fieldList = [ {
			name : 'TextBox',
			checked : false
		}, {
			name : 'CheckBox',
			checked : false
		}, {
			name : 'SelectBox',
			checked : false
		}, {
			name : 'Radio Button',
			checked : false
		}, {
			name : 'Button',
			checked : false
		}, {
			name : 'Rich TextBox',
			checked : false
		} ]

		$scope.dataTypeList = [ {
			name : 'String',
			checked : false
		}, {
			name : 'Number',
			checked : false
		}, {
			name : 'Char',
			checked : false
		}, {
			name : 'Blob',
			checked : false
		}, {
			name : 'Float',
			checked : false
		}, {
			name : 'Double',
			checked : false
		} ]

		$scope.updateSelection = function(position, fieldList, checked) {
			if (checked == true) {
				$scope.user.fieldTypem = true;
			} else {
				$scope.user.fieldTypem = false;
			}
			angular.forEach(fieldList, function(fieldType, index) {
				if (position != index)
					fieldType.checked = false;
			});
		}

		$scope.updateDataType = function(position, dataTypeList, checked) {
			angular.forEach(dataTypeList, function(dataType, index) {
				if (position != index)
					dataType.checked = false;
			});
		}

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
				$scope.user.addfields = true;
				alert(data.message);
				//window.location = data.reDirectPath;
			}).error(function(data, status) {
				alert(data.message);
			});

		};
	});
</script>
</html>
