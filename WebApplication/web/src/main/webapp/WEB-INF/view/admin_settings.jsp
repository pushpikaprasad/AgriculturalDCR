<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html ng-app="adminPageDetails">
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
	rel="stylesheet"></script>
<script type="text/javascript">

$(document).ready(function(){
    $('.sidenav').sidenav();
  });
</script>
<script type="text/javascript">

var adminPageDetails = angular.module('adminPageDetails', []);

var adminId = document.getElementById("AdminId");



adminPageDetails.controller('adminPageData', function($scope, $http) {

	
$http.get('/Admin/${AdminId}').then(function(res) {
	$scope.adminDetails = res.data; //Admin object data -- JSON format
	$scope.updateadminName = $scope.adminDetails.adminName;
	$scope.updateadminUsername = $scope.adminDetails.adminUsername;
	$scope.updateadminPassword = $scope.adminDetails.adminPassword;
});

$scope.getAdminDetails = function() {
	$http.get('/Admin/${AdminId}').then(function(res) {
		$scope.adminDetails= res.data; 
	});
}

$scope.putAdmin = function (adminName,adminUsername,adminPassword){
	var id = ${AdminId};
	var adminData = {
			adminId:id,
			adminUsername:adminUsername,
			adminPassword:adminPassword,
			adminName:adminName
	};
	
	$http.put('/Admin', JSON.stringify(adminData)).then(function (response) {

		if (response.adminData)

		console.log("Post Data Submitted Successfully!");
		$scope.getAdminDetails();

		}, function (response) {	
			console.log("Service not Exists");
		});
};		

});

</script>
</head>
<body ng-controller="adminPageData">
<nav class="blue-grey darken-1" >
			<div class="nav-wrapper ">
				<a href="#" data-target="slide-out"
					class="sidenav-trigger show-on-large"><i
					class="material-icons large">menu</i></a> <a  href="/Admin"><span class="brand-logo">{{adminDetails.adminName}}</span></a>
				<ul id="nav-mobile" class="right ">
	        <li><a href="/"><i class="material-icons large">power_settings_new</i></a></li>
	      </ul>
			</div>
		</nav>
		<div id="nav">
		<ul id="slide-out" class="sidenav">
			<li><div class="user-view">
					<div class="background blue darken-3">
						<!-- <img src="images/office.jpg">-->
					</div>
					<!--  <a href="#user"><img class="circle" src="images/yuna.jpg"></a>-->
					<a href="#name"><span class="white-text name">{{adminDetails.adminName}}</span></a>
					<a href="#email"><span class="white-text email">Admin@gmail.com</span></a>
				</div></li>
			<li><a  class ="waves-effect" href="/Admin">Home</a></li>
			<li><div class="divider"></div></li>
			<li><a  class="subheader">Manage</a></li>			
			<li><a class="waves-effect" href="/Admin/manage-officers">Officers</a></li>
			<li><a class="waves-effect" href="/Admin/manage-farmers">Farmers</a></li>
			<li><a  class="subheader"></a></li>
			<li><a class="waves-effect" href="/Admin/settings">Settings</a></li>
		</ul>
		</div>	

	<div class="page-container">		
		<div id="Settings_admin" class="row">
			
			<div class="col s3 m3 l3  center-align">
				<h4>SETTINGS</h4>
			</div>
			<div class="col s8 m8 l8 center-align">
			<div class="card">
			<form class="highlight responsive-table">
					<table >
						<tr><td>Name</td><td>
						<div class="row">
							<div class="input-field col s6">
								<input id="updateadminName" name="updateadminName" type="text"
									placeholder="updateadminName" 
									value="updateadminName"
									class="validate" ng-model="updateadminName"> <label
									for="updateadminName">Name</label>
							</div>
						</div>
						</td></tr>
						<tr><td>Username</td><td>
						<div class="row">
							<div class="input-field col s6">
								<input id="updateadminUsername" name="updateadminUsername" type="text"
									placeholder="updateadminUsername" 
									value="updateadminUsername"
									class="validate" ng-model="updateadminUsername"> <label
									for="updateadminUsername">Username</label>
							</div>
						</div>
						</td></tr>
						<tr><td>Password</td><td>
						<div class="row">
							<div class="input-field col s6">
								<input id="updateadminPassword" name="updateadminPassword" type="text"
									placeholder="updateadminPassword" 
									value="updateadminPassword"
									class="validate" ng-model="updateadminPassword"> <label
									for="updateadminPassword">Password</label>
							</div>
						</div>
						</td></tr>
						<tr>
						<td></td>
						<td class="right-align">
						
						<button class="btn waves-effect waves-light " type="submit" name="action" id="changeDetails"
								ng-click="putAdmin(updateadminName,updateadminUsername,updateadminPassword)">
								Save
							</button>
						</td>
						</tr>
					</table>				
				</form>
			</div>
			</div>	
		</div>
	</div>



</body>
</html>