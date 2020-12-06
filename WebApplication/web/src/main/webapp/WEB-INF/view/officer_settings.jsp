<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html ng-app="officerPageDetails">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes">
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

	var officerPageDetails = angular.module('officerPageDetails', []);
	
	var officerId = document.getElementById("OfficerId");
	
	
	
	officerPageDetails.controller('officerPageData', function($scope, $http) {
	
		
	$http.get('/Officer/${OfficerId}').then(function(res) {
		$scope.officerDetails = res.data; 	
		$scope.updateofficerUsername = $scope.officerDetails.officerUsername;
		$scope.updateofficerPassword = $scope.officerDetails.officerPassword;
		$scope.updateofficerName = $scope.officerDetails.officerName;
		$scope.updateworkArea = $scope.officerDetails.workArea;
		$scope.updateofficerContactNumber = $scope.officerDetails.officerContactNumber;
		$scope.updateassignedBranch = $scope.officerDetails.assignedBranch;
	});
	
	$scope.getOfficerDetails = function() {
		$http.get('/Officer/${OfficerId}').then(function(res) {
			$scope.officerDetails= res.data; 
		});
	}
	
	$scope.putOfficer = function (officerUsername,officerPassword,officerName,workArea,officerContactNumber,assignedBranch){
		var id = ${OfficerId};
		var officerData = {
				officerId:id,
				officerUsername:officerUsername,
				officerPassword:officerPassword,
				officerName:officerName,
				workArea:workArea,
				officerContactNumber:officerContactNumber,
				assignedBranch:assignedBranch
		};
		console.log(officerData)
		
		$http.put('/Officer', JSON.stringify(officerData)).then(function (response) {
	
			if (response.officerData)
	
			console.log("Post Data Submitted Successfully!");
			$scope.getOfficerDetails();
	
			}, function (response) {	
				console.log("Service not Exists");
			});
	};		

});

</script>
</head>
<body ng-controller="officerPageData">
<nav class="blue-grey darken-1" >
			<div class="nav-wrapper ">
				<a href="#" data-target="slide-out"
					class="sidenav-trigger show-on-large"><i
					class="material-icons large">menu</i></a> <a  href="/Officer"><span class="brand-logo">{{officerDetails.officerName}}</span></a>
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
					<a href="#name"><span class="white-text name">{{officerDetails.officerName}}</span></a>
					<a href="#email"><span class="white-text email">Officer@gmail.com</span></a>
				</div></li>
			<li><a  class ="waves-effect" href="/Officer">Home</a></li>
			<li><div class="divider"></div></li>
			<li><a  class="subheader">Manage</a></li>
			<li><a class="waves-effect" href="/Officer/manage-farmers">Farmers</a></li>
			<li><div class="divider"></div></li>
			<li><a class="waves-effect" href="/Officer/settings">Settings</a></li>
		</ul>
		</div>	

	<div class="page-container">		
		<div id="Settings_officer" class="row">
			
			<div class="col s12 m3 offset-m1 l3 offset-l1 center-align">
				<h4>SETTINGS</h4>
			</div>
			
		</div>
		<div class="row">	
			
			<div class="col s12 m8 offset-m3 l8 offset-l3 center-align">
			<div class="row z-depth-5">
			
			<form>
			<br>
						<div class="row">
							<div class="input-field col s10 offset-s1">
								<input id="updateofficerName" name="updateofficerName" type="text"
									placeholder="updateofficerName" 
									value="updateofficerName"
									class="validate" ng-model="updateofficerName"> <label
									for="updateofficerName">Officer Name</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s10 offset-s1">
								<input id="updateofficerUsername" name="updateofficerUsername" type="text"
									placeholder="updateofficerUsername" 
									value="updateofficerUsername"
									class="validate" ng-model="updateofficerUsername"> <label
									for="updateofficerUsername">Username</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s10 offset-s1">
								<input id="updateofficerPassword" name="updateofficerPassword" type="text"
									placeholder="updateofficerPassword" 
									value="updateofficerPassword"
									class="validate" ng-model="updateofficerPassword"> <label
									for="updateofficerPassword">Password</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s10 offset-s1">
								<input id="updateworkArea" name="updateworkArea" type="text"
									placeholder="updateworkArea" 
									value="updateworkArea"
									class="validate" ng-model="updateworkArea"> <label
									for="updateworkArea">Work Area</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s10 offset-s1">
								<input id="updateofficerContactNumber" name="updateofficerContactNumber" type="tel"
									placeholder="updateofficerContactNumber" 
									value="updateofficerContactNumber"
									class="validate" ng-model="updateofficerContactNumber"> <label
									for="updateofficerContactNumber">Contact No.</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s10 offset-s1">
								<input id="updateassignedBranch" name="updateassignedBranch" type="text"
									placeholder="updateassignedBranch" 
									value="updateassignedBranch"
									class="validate" ng-model="updateassignedBranch"> <label
									for="updateassignedBranch">Branch</label>
							</div>
						</div>	
											
						<div class="row right-align col s10 offset-s1">
							<button class="btn waves-effect waves-light"
								type="submit" name="action" id="addAction"
								ng-click="putOfficer(updateofficerUsername,updateofficerPassword,updateofficerName, updateworkArea, updateofficerContactNumber,updateassignedBranch)">
								Save
							</button>
						</div>
					</form>
			</div>
			</div>	
		</div>
	</div>



</body>
</html>