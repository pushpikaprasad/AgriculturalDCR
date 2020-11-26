<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html ng-app="adminPageDetails">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
<script>
	$(document).ready(function() {
		$('.modal').modal();
		$('#AddCultivation').on('click', function() {
		});
		$("#AddCultivation").modal({
			dismissible : false
		});
		$('#Updateultivation').on('click', function() {
		});
		$("#UpdateCultivation").modal({
			dismissible : false
		});
	});
	$(document).ready(function(){
	    $('.sidenav').sidenav();
	  });
	  
</script>

<script>
	// Admin Page module
	var adminPageDetails = angular.module('adminPageDetails', []);

	var adminId = document.getElementById("AdminId");

	// Admin Page controller
	adminPageDetails.controller('adminPageData', function($scope, $http) {

		
		
		$http.get('/Admin/${AdminId}').then(function(res) {
			$scope.adminDetails = res.data; //Admin object data -- JSON format

		});

		$http.get('/Admin/cultivations').then(function(res) {
			$scope.cultivations = res.data; //All cultivation details

		});
		
		
		
		$scope.Getcultivation = function() {
			
			$http.get('/Admin/cultivations').then(function(res) {
				$scope.cultivations = res.data; //All cultivation details

			});
		}
		

		$scope.Postcultivation = function (cultivationId, cultivationType, harvestAmount, location, availability, farmerId) {
			var cultivationData = {
					cultivationId: cultivationId, 
					cultivationType: cultivationType, 
					harvestAmount: harvestAmount, 
					location: location, 
					availability: availability, 
					farmerId: farmerId

			};
			//Call the services
			$http.post('/Admin/cultivations', JSON.stringify(cultivationData)).then(function (response) {

				if (response.cultivationData)

				console.log("Post Data Submitted Successfully!");
				$scope.Getcultivation();

				}, function (response) {	
					console.log("Service not Exists");
				});
		};
		
		$scope.updateClick = function (cultivationId, cultivationType, harvestAmount, location, availability, farmerId) {
			$scope.updatecultivationId = cultivationId;
			$scope.updatecultivationType = cultivationType;
			$scope.updateharvestAmount = harvestAmount;
			$scope.updatelocation = location;
			$scope.updateavailability = availability;
			$scope.updatefarmerId = farmerId;
		}
		
		$scope.Putcultivation = function (cultivationId, cultivationType, harvestAmount, location, availability, farmerId) {
			
			var cultivationData = {

					cultivationId: cultivationId, 
					cultivationType: cultivationType, 
					harvestAmount: harvestAmount, 
					location: location, 
					availability: availability, 
					farmerId: farmerId

			};
			
			console.log(cultivationData);
			
			//Call the services
			$http.put('/Admin/cultivations', JSON.stringify(cultivationData)).then(function (response) {
				
				if (response.cultivationData)

				console.log("Update Data Submitted Successfully!");
				$scope.Getcultivation();

				}, function (response) {	
					console.log("Service not Exists");
				});
		};
		
		$scope.deleteClick = function (deleteId) {
			console.log(deleteId);
			$scope.deletecultivationId = deleteId;
			
		}
		
		$scope.Deletecultivation = function (cultivationId) {
			console.log(cultivationId);
			
			var url = '/Admin/cultivations/'+cultivationId;

			//Call the service to delete data

			$http.delete( url ).then(function (response) {

			if (response.cultivationData)

				console.log("Delete Data Submitted Successfully!");
				$scope.Getcultivation();

			}, function (response) {

				console.log("Service not Exists");

			});

			};
		//Add form function	

		//Update form function
		
		//delete function

		
	});
	
	
	
	
	
	
</script>

</head>
<body ng-controller="adminPageData">    
    
 <div class="page-container">
	
	<nav class="blue lighten-4" >
			<div class="nav-wrapper">
				<a href="#" data-target="slide-out"
					class="sidenav-trigger show-on-large"><i
					class="material-icons large">menu</i></a> <span class="brand-logo">{{adminDetails.adminName}}</span>
				<!--  <ul id="nav-mobile" class="right hide-on-med-and-down">
	        <li><a href="sass.html">Sass</a></li>
	        <li><a href="badges.html">Components</a></li>
	        <li><a href="collapsible.html">JavaScript</a></li>
	      </ul>-->
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
		</ul>
		
		
		</div>
		
		
		
		
    
    
    
    </div>
    
    
    
</body>
</html>