<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html ng-app="loginPageDetails">
<head>
<meta charset="ISO-8859-1">
<title>AgriculturalDCR</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"
	integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg=="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.8.2/angular.min.js"
	integrity="sha512-7oYXeK0OxTFxndh0erL8FsjGvrl2VMDor6fVqzlLGfwOQQqTbYsGPv4ZZ15QHfSk80doyaM0ZJdvkyDcVO7KFA=="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
</script>

<script type="text/javascript">
var loginPageDetails = angular.module('loginPageDetails', []);


loginPageDetails.controller('loginPageData', function($scope, $http) {
	$scope.loginUser = function (email, password){
		
		var loginData = {
			email: email,
			password: password
		};
		
		$http.post('/login', JSON.stringify(loginData)).then(function (response) {
			if (response.data)
			console.log("Post login data submission successfully!");
			}, function (response) {	
				console.log("Service not Exists");
			});
	};

});
</script>
</head>
<body ng-controller="loginPageData">
        <div class="page-container">
            <form class="login-form" >
				        <div class="row">
				        </div>
				        <div class="row">
				          <div class="input-field col s12">
				            <i class="material-icons prefix">email_outline</i>
				            <input class="validate" id="username" type="email" ng-model="email">
				            <label for="email" data-error="wrong" data-success="right">Email</label>
				          </div>
				        </div>
				        <div class="row">
				          <div class="input-field col s12">
				            <i class="material-icons prefix">lock_outline</i>
				            <input id="password" type="password" ng-model="password">
				            <label for="password">Password</label>
				          </div>
				        </div>
				        <div class="row">
				          <div class="input-field col s12">
				            <a href="#" class="btn waves-effect waves-light col s12" ng-click="loginUser(email, password)">Login</a>
				            <span class="helper-text" data-error="wrong">${param.error}</span>
				          </div>
				        </div>
				      </form>
            <!--  <form class="form-signin" th:action="@{/u/signup}" method="get">
                <button class="btn btn-md btn-success btn-block" type="Submit">Signup Here</button>
            </form>-->
        </div>
</body>
</html>