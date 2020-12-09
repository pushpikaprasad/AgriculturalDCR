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
<script>
	$(document).ready(function() {
		$('.modal').modal();
		$('#AddFarmer').on('click', function() {
		});
		$("#AddFarmer").modal({
			dismissible : false
		});
		$('#UpdateFarmer').on('click', function() {
		});
		$("#UpdateFarmer").modal({
			dismissible : false
		});
	});
	$(document).ready(function(){
	    $('.sidenav').sidenav();
	  });
	  
</script>

<script>
	// Officer Page module
	var officerPageDetails = angular.module('officerPageDetails', []);

	var officerId = document.getElementById("OfficerId");

	// Officer Page controller
	officerPageDetails.controller('officerPageData', function($scope, $http) {

		
		
		$http.get('/Officer/${OfficerId}').then(function(res) {
			$scope.officerDetails = res.data; //Officer object data -- JSON format

		});
		
		//read all data of farmer
		
		$http.get('/Officer/farmers').then(function(res) {
				$scope.farmers= res.data; 

			});
		
		$scope.getFarmerDetails = function() {
			
			$http.get('/Officer/farmers').then(function(res) {
				$scope.farmers= res.data; 

			});
		}
		
		/*
		farmerId;
		farmerName;
		farmerMobile;*/
	
		//Add farmer details
		$scope.postFarmer = function (farmerId, farmerName,farmerMobile) {
			var farmerData = {
					farmerId:farmerId,
					farmerName:farmerName,
					farmerMobile:farmerMobile
			};
			
			$http.post('/Officer/farmers', JSON.stringify(farmerData)).then(function (response) {

				if (response.farmerData)

				console.log("Post Data Submitted Successfully!");
				$scope.getFarmerDetails();

				}, function (response) {	
					console.log("Service not Exists");
				});
		};		
		
		//update farmer details
		$scope.updateClick = function (farmerId, farmerName, farmerMobile) {
			$scope.updatefarmerId = farmerId;
			$scope.updatefarmerName = farmerName;
			$scope.updatefarmerMobile = farmerMobile;
		}
		
		$scope.putFarmer = function (farmerId, farmerName, farmerMobile) {
			var farmerData = {
					farmerId:farmerId,
					farmerName:farmerName,
					farmerMobile:farmerMobile

			};
			
			$http.put('/Officer/farmers', JSON.stringify(farmerData)).then(function (response) {

				if (response.farmerData)

				console.log("Post Data Submitted Successfully!");
				$scope.getFarmerDetails();

				}, function (response) {	
					console.log("Service not Exists");
				});
		};		
		
		/*
		//delete farmer details
		$scope.deleteClick = function (farmerdeleteId,farmerdeleteName) {
			console.log(farmerdeleteId);
			$scope.farmerdeleteId = farmerdeleteId;
			$scope.farmerdeleteName = farmerdeleteName;
		}
		
		$scope.deleteFarmer = function (farmerId) {
			console.log(farmerId);
			
			var url = '/Officer/farmers/'+farmerId;

			//Call the service to delete data

			$http.delete( url ).then(function (response) {

			if (response.farmerData)

				console.log("Delete Data Submitted Successfully!");
				$scope.getFarmerDetails();

			}, function (response) {

				console.log("Service not Exists");

			});

			};	
			*/
	});	
</script>
<style type="text/css">

</style>

</head>
<body ng-controller="officerPageData">    
 
 	<nav class="blue-grey darken-1" >
			<div class="nav-wrapper">
				<a href="#" data-target="slide-out"
					class="sidenav-trigger show-on-large"><i
					class="material-icons large">menu</i></a> <a href="/Officer"><span class="brand-logo">{{officerDetails.officerName}}</span></a>
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

		<div id="farmer_details" class="row">
		
			<div class="col s12 m3 offset-m1 l3 offset-l1 left-align">
			<h4>FARMERS</h4>
			</div>
		</div>
		<div class="row">	
			
			
			<!-- Farmer Details table -->
			<div class="col s12 m8 offset-m3 l8 offset-l3 center-align">

						<table class="highlight  responsive-table z-depth-3">
							<tr class="#dcedc8" style="font-weight: bold">
								<th>Farmer ID</th>
								<th>Name</th>
								<th>Contact No.</th>
								<td colspan="2" class="center-align"><a class="waves-effect waves-light btn modal-trigger black-text #aabb97"
						href="#AddFarmer">Add Farmer<i
						class="material-icons right">playlist_add</i></a></td>
							</tr class="#fffffb">
							<tr ng-repeat="i in farmers" class="light-green lighten-4">
								<td>{{i.farmerId}}</td>
								<td>{{i.farmerName}}</td>
								<td>{{i.farmerMobile}}</td>
								<td class="center-align"><a
									class="waves-effect waves-light btn modal-trigger modal-close  light-blue darken-1"
									href="#UpdateFarmer" value="i.farmerId"
									ng-click="updateClick(i.farmerId, i.farmerName, i.farmerMobile)"><i
										class="material-icons">edit</i></a></td>
								<!--  <td class="center-align"><a
									class="waves-effect waves-light btn modal-trigger modal-close  red darken-1"
									href="#DeleteFarmer" value="i.cultivationId"
									ng-click="deleteClick(i.farmerId, i.farmerName)"><i
										class="material-icons">delete</i></a></td>-->
								<td></td>
							</tr>
						</table>
					</div>
			<!-- END Farmer Details table -->
			
			<!-- Add model -->
			<div id="AddFarmer" class="modal">
				<div class="modal-content">
					<div class="raw">
						<div class="col s9 m11 l11">
							<h5>Add Farmer details.</h5>
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
							<div class="input-field col s12">
								<input id="farmerId" name="farmerId" type="text" 
									class="validate" ng-model="farmerId"> <label
									for="farmerId">Farmer ID</label>
							</div>
						</div>	
						<div class="row">
							<div class="input-field col s12">
								<input id="farmerName" name="farmerName" type="text"
									class="validate" ng-model="farmerName"> <label
									for="farmerName">Farmer Name</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s12">
								<input id="farmerMobile" name="farmerMobile" type="tel"
									class="validate" ng-model="farmerMobile"> <label
									for="farmerMobile">Contact No.</label>
							</div>
						</div>					
						<div class="modal-footer">
							<button class="btn waves-effect waves-light modal-close"
								type="submit" name="action" id="addAction"
								ng-click="postFarmer(farmerId, farmerName,farmerMobile)">
								Add <i class="material-icons right">playlist_add</i>
							</button>
						</div>
					</form>
				</div>
			</div>
			<!--  END Add model -->
			
			<!--  Update model -->
			<div id="UpdateFarmer" class="modal">
				<div class="modal-content">
					<div class="raw">
						<div class="col s9 m11 l11">
							<h5>Update Farmer details.</h5>
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
							<div class="input-field col s12">
								<input id="updatefarmerId" name="farmerId" type="text" 
									placeholder="updatefarmerId" 
									value="updatefarmerId"
									class="validate" ng-model="updatefarmerId" pattern= "[0-9]"> <label
									for="updatefarmerId">Farmer ID</label>
							</div>
						</div>	
						<div class="row">
							<div class="input-field col s12">
								<input id="updatefarmerName" name="updatefarmerName" type="text"
									placeholder="updatefarmerName" 
									value="updatefarmerName"
									class="validate" ng-model="updatefarmerName"> <label
									for="updatefarmerName">Farmer Name</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s12">
								<input id="updatefarmerMobile" name="updatefarmerMobile" type="tel"
									placeholder="updatefarmerMobile" 
									value="updatefarmerMobile"
									class="validate" ng-model="updatefarmerMobile"> <label
									for="updatefarmerMobile">Contact No.</label>
							</div>
						</div>					
						<div class="modal-footer">
							<button class="btn waves-effect waves-light modal-close"
								type="submit" name="action" id="addAction"
								ng-click="putFarmer(updatefarmerId,updatefarmerName,updatefarmerMobile)">
								Add <i class="material-icons right">playlist_add</i>
							</button>
						</div>
					</form>
				</div>
			</div>
			<!--  END Update model -->
			
			
			<!--  Delete model -->
			<!-- 
			<div id="DeleteFarmer" class="modal">
				<div class="modal-content">
					<div class="raw">
						<div class="col s11 m11 l11">
							<h5>Do you need to delete this Farmer Account? </h5><br>
								ID : {{farmerdeleteId}}<br>
								Name: {{farmerdeleteName}}
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
					<div class="raw">
					<form>
						<div class="right-align ">
							<button
								class="btn waves-effect waves-light modal-close blue-text blue lighten-5">
								No</button>
							<button
								class="btn waves-effect waves-light modal-close red darken-1"
								type="submit" name="action"
								ng-click="deleteFarmer(farmerdeleteId)">Delete</button>
						</div>
					</form>
					</div>
				</div>
			</div>
			 -->
			
			<!--  END Delete model -->
		</div>
		
    
    
    
    </div>
    
    
    
</body>
</html>