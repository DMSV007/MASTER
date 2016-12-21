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
			<form name="login" ng-submit="">

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
						id="password" class="form-control" ng-model="user.confirmPassword"
						required>
				</div>
				<div class="form-group">
					<label>Mobile No:</label> <input type="text" name="mobileno"
						class="form-control" id="mobileno" ng-model="user.mobileno">
				</div>
				<div class="form-group">
					<label>Email Id:</label> <input type="text" name="email"
						class="form-control" id="email" ng-model="user.email">
				</div>
				<div class="form-group">
					<a href="index.jsp" type="button" class="btn btn-primary" >Back to Sing in</a>
					&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn btn-primary">Save</button>
					
				</div>
			</form>
		</div>
	</div>
</body>

</html>
