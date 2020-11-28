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
<script>
	$(document).ready(function() {
		$('.modal').modal();
		$('#AddCultivation').on('click', function() {
		});
		$("#AddCultivation").modal({
			dismissible : false
		});
		$('#UpdateCultivation').on('click', function() { //<------check Updateultivation usage
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

<nav class="blue-grey darken-1" >
			<div class="nav-wrapper">
				<a href="#" data-target="slide-out"
					class="sidenav-trigger show-on-large"><i
					class="material-icons large">menu</i></a> <span class="brand-logo">{{adminDetails.adminName}}</span>
				<ul id="nav-mobile" class="right hide-on-med-and-down">
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
			<li><a class="waves-effect" href="/Admin">Home</a></li>
			<li><div class="divider"></div></li>
			<li><a  class="subheader">Manage</a></li>
			<li><a class="waves-effect" href="/Admin/manage-officers">Officers</a></li>
			<li><div class="divider"></div></li>
			<li><a class="waves-effect" href="/Admin/settings">Settings</a></li>
		</ul>
		
		
		</div>
		
		
		
<div class="page-container" >		
		

		<div class="row">
			<!-- Start Side Navigation -->
			<div class="col s2 m2 l2 blue lighten-4"></div>
			<!-- End Side Navigation -->
			<!--Start  main session -->
			<div class="col s9 m9 l9">
				<h4>${title}</h4>
				<div class="divider"></div>

				<br>
				<div class="card">
					<a
						class="waves-effect waves-light btn modal-trigger modal-close  light-green darken-1"
						href="#AddCultivation">Add cultivation<i
						class="material-icons right">playlist_add</i></a>

					<div class="divider"></div>
					<br>
					<div class="highlight">
						<table>
							<tr class="light-green accent-2">
								<td>Cultivation ID</td>
								<td>Cultivation Type</td>
								<td>Harvest Amount</td>
								<td>Location</td>
								<td>Availability</td>
								<td>Farmer ID</td>
								

							</tr>
							<tr ng-repeat="i in cultivations" class="light-green lighten-4">
								<td>{{i.cultivationId}}</td>
								<td>{{i.cultivationType}}</td>
								<td>{{i.harvestAmount}}</td>
								<td>{{i.location}}</td>
								<td>{{i.availability}}</td>
								<td>{{i.farmerId}}</td>
								<td><a
									class="waves-effect waves-light btn modal-trigger modal-close  light-blue darken-1"
									href="#UpdateCultivation" value="i.cultivationId"
									ng-click="updateClick(i.cultivationId,i.cultivationType,i.harvestAmount,i.location, i.availability,i.farmerId )"><i
										class="material-icons">edit</i></a></td>
								<td><a
									class="waves-effect waves-light btn modal-trigger modal-close  red darken-1"
									href="#DeleteCultivation" value="i.cultivationId"
									ng-click="deleteClick(i.cultivationId)"><i
										class="material-icons">delete</i></a></td>
								<td"></td>

							</tr>
						</table>
					</div>
				</div>
				<br>
			</div>
			<!-- End main session -->

			<!-- CULTIVATIONS -->

			<!-- Start Add cultivation form -->
			<div id="AddCultivation" class="modal">
				<div class="modal-content">
					<div class="raw">
						<div class="col s11 m11 l11">
							<h5>Add Cultivation details.</h5>
						</div>
						<div class="col s1 m1 l1">
							<div class="right-align">
								<button
									class="modal-close btn waves-effect waves-light pink darken-1 ">
									<i class="material-icons">close</i>
								</button>
							</div>
						</div>
					</div>
					<form>
						<div class="row">
							<div class="input-field col s6">
								<input id="cultivationId" name="cultivationId" type="text"
									class="validate" ng-model="cultivationId"> <label
									for="cultivationId">Cultivation ID</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<input id="cultivationType" name="cultivationType" type="text"
									class="validate" ng-model="cultivationType"> <label
									for="cultivationType">Cultivation Type</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<input id="harvestAmount" name="harvestAmount" type="number"
									class="validate" ng-model="harvestAmount"> <label
									for="harvestAmount">Harvest Amount</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<input id="location" name="location" type="text"
									class="validate" ng-model="location"> <label
									for="location">Location</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<p>
									<label><input class="with-gap" name="availability"
										type="radio" id="availabilityTrue" ng-model="availability" />
										<span>Available</span></label> <label><input class="with-gap"
										name="availability" ng-model="availability" type="radio"
										id="availabilityFalse" /> <span>Not Available</span></label>
								</p>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<input id="farmerId" name="farmerId" type="text"
									class="validate" ng-model="farmerId"> <label
									for="farmerId">Farmer ID</label>
							</div>
						</div>
						<div class="modal-footer">
							<button class="btn waves-effect waves-light modal-close"
								type="submit" name="action" id="addAction"
								ng-click="Postcultivation(cultivationId, cultivationType, harvestAmount, location, availability, farmerId)">
								Add <i class="material-icons right">playlist_add</i>
							</button>
						</div>
					</form>
				</div>
			</div>
			<!-- End Add cultivation form -->

			<!-- Start Update cultivation form -->
			<div id="UpdateCultivation" class="modal">
				<div class="modal-content">
					<div class="raw">
						<div class="col s11 m11 l11">
							<h5>Update Cultivation details.</h5>
						</div>
						<div class="col s1 m1 l1">
							<div class="right-align">
								<button
									class="modal-close btn waves-effect waves-light pink darken-1 ">
									<i class="material-icons">close</i>
								</button>
							</div>
						</div>
					</div>
					<form>
						<div class="row">
							<div class="input-field col s6">
								<input disabled id="UpdateCultivationId" type="text"
									class="validate" placeholder="updatecultivationId"
									value="updatecultivationId" ng-model="updatecultivationId">
								<label for="UpdateCultivationId">Cultivation ID</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<input id="updateCultivationType" type="text"
									placeholder="updatecultivationType"
									value="updatecultivationType" class="validate"
									ng-model="updatecultivationType"> <label
									for="updateCultivationType">Cultivation Type</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<input id="updateHarvestAmount" type="number"
									placeholder="updateharvestAmount" class="validate"
									ng-model="updateharvestAmount"> <label
									for="updateHarvestAmount">Harvest Amount</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<input id="updateLocation" type="text" class="validate"
									placeholder="updatelocation" value="updatelocation"
									ng-model="updatelocation"> <label for="updateLocation">Location</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<p>
									<label><input class="with-gap" name="availabilty"
										placeholder="updateavailability" value="updateavailability"
										ng-model="updateavailability" type="radio"
										id="UpdateAvailabilityTrue" /> <span>Available</span></label> <label><input
										class="with-gap" name="availabilty"
										placeholder="updateavailability" value="updateavailability"
										ng-model="updateavailability" type="radio"
										id="UpdateAvailabilityFalse" /> <span>Not Available</span></label>
								</p>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<input id="UpdateFarmerId" type="text" class="validate"
									placeholder="updatefarmerId" value="updatefarmerId"
									ng-model="updatefarmerId"> <label for="UpdateFarmerId">Farmer
									ID</label>
							</div>
						</div>
						<div class="modal-footer">
							<button class="btn waves-effect waves-light modal-close"
								ng-click="Putcultivation(updatecultivationId, updatecultivationType, updateharvestAmount, updatelocation, updateavailability, updatefarmerId)"
								type="submit" name="action">
								Update <i class="material-icons right">playlist_add_check</i>
							</button>
						</div>
					</form>
				</div>
			</div>
			<!-- End Update cultivation form -->

			<!-- Start Delete cultivation form -->
			<div id="DeleteCultivation" class="modal">
				<div class="modal-content">
					<div class="raw">
						<div class="col s11 m11 l11">
							<h5>Do you need to delete this record
								{{deletecultivationId}} ?</h5>
						</div>
						<div class="col s1 m1 l1">
							<div class="right-align">
								<button
									class="modal-close btn waves-effect waves-light pink darken-1 ">
									<i class="material-icons">close</i>
								</button>
							</div>
						</div>
					</div>
					<form>
						<div class="right-align">
							<button
								class="btn waves-effect waves-light modal-close blue-text blue lighten-5">
								No</button>
							<button
								class="btn waves-effect waves-light modal-close red darken-1"
								type="submit" name="action"
								ng-click="Deletecultivation(deletecultivationId)">Delete</button>
						</div>
					</form>
				</div>
			</div>
			<!-- End Delete cultivation form -->

			<!-- END CULTIVATIONS -->

		</div>
	</div>

</body>
</html>