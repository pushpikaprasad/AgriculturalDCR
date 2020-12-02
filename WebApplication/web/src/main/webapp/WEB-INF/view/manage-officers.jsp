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
		$('#AddOfficer').on('click', function() {
		});
		$("#AddOffier").modal({
			dismissible : false
		});
		$('#UpdateOfficer').on('click', function() {
		});
		$("#UpdateOfficer").modal({
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
		
		//read all data of officer
		
		$http.get('/Admin/officers').then(function(res) {
				$scope.officers= res.data; 

			});
		
		$scope.getOfficerDetails = function() {
			
			$http.get('/Admin/officers').then(function(res) {
				$scope.officers= res.data; 

			});
		}
		
		//Add officer details
		$scope.postOfficer = function (officerId,officerUsername,officerPassword, officerName, workArea, officerContactNumber,assignedBranch) {
			var officerData = {
					officerId:officerId,
					officerUsername:officerUsername,
					officerPassword:officerPassword,
					officerName:officerName,
					workArea:workArea,
					officerContactNumber:officerContactNumber, 
					assignedBranch:assignedBranch

			};
			
			$http.post('/Admin/officers', JSON.stringify(officerData)).then(function (response) {

				if (response.officerData)

				console.log("Post Data Submitted Successfully!");
				$scope.getOfficerDetails();

				}, function (response) {	
					console.log("Service not Exists");
				});
		};		
		
		//update officer details
		$scope.updateClick = function (officerId,officerUsername,officerPassword, officerName, workArea, officerContactNumber,assignedBranch) {
			$scope.updateofficerId = officerId;
			$scope.updateofficerUsername = officerUsername;
			$scope.updateofficerPassword = officerPassword;
			$scope.updateofficerName = officerName;
			$scope.updateworkArea = workArea;
			$scope.updateofficerContactNumber = officerContactNumber;
			$scope.updatessignedBranch = assignedBranch;
		}
		
		$scope.putOfficer = function (officerId,officerUsername,officerPassword, officerName, workArea, officerContactNumber,assignedBranch) {
			var officerData = {
					officerId:officerId,
					officerUsername:officerUsername,
					officerPassword:officerPassword,
					officerName:officerName,
					workArea:workArea,
					officerContactNumber:officerContactNumber, 
					assignedBranch:assignedBranch

			};
			
			$http.put('/Admin/officers', JSON.stringify(officerData)).then(function (response) {

				if (response.officerData)

				console.log("Post Data Submitted Successfully!");
				$scope.getOfficerDetails();

				}, function (response) {	
					console.log("Service not Exists");
				});
		};		
		
		
		//delete officer details
		$scope.deleteClick = function (officerdeleteId,officerdeleteName) {
			console.log(officerdeleteId);
			$scope.officerdeleteId = officerdeleteId;
			$scope.officerdeleteName = officerdeleteName;
		}
		
		$scope.deleteOfficer = function (officerId) {
			console.log(officerId);
			
			var url = '/Admin/officers/'+officerId;

			//Call the service to delete data

			$http.delete( url ).then(function (response) {

			if (response.officerData)

				console.log("Delete Data Submitted Successfully!");
				$scope.getOfficerDetails();

			}, function (response) {

				console.log("Service not Exists");

			});

			};		
	});	
</script>

</head>
<body ng-controller="adminPageData">    
 
 	<nav class="blue-grey darken-1" >
			<div class="nav-wrapper">
				<a href="#" data-target="slide-out"
					class="sidenav-trigger show-on-large"><i
					class="material-icons large">menu</i></a> <a href="/Admin"><span class="brand-logo">{{adminDetails.adminName}}</span></a>
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
			<li><a  class ="waves-effect" href="/Admin">Home</a></li>
			<li><div class="divider"></div></li>
			<li><a  class="subheader">Manage</a></li>
			<li><a class="waves-effect" href="/Admin/manage-officers">Officers</a></li>
			<li><div class="divider"></div></li>
			<li><a class="waves-effect" href="/Admin/settings">Settings</a></li>
		</ul>
		</div>
    
 <div class="page-container">

		<div id="officer_details" class="row">
		
			<div class="col s2 m2 l2 center-align">
			<h4>OFFICERS</h4>
			</div>
			<!-- Officer Details table -->
			<div class="col s9 m9 l9 center-align">
						
						<div class="card ">
						<table class="highlight responsive-table">
							<tr class="#dcedc8" style="font-weight: bold">
								<td>Officer ID</td>
								<td>Name</td>
								<td>Username</td>
								<td>Password</td>
								<td>Work Area</td>
								<td>Contact No.</td>
								<td>Branch</td>
								<td colspan="2" class="center-align"><a class="waves-effect waves-light btn modal-trigger black-text #aabb97"
						href="#AddOfficer">Add Officer<i
						class="material-icons right">playlist_add</i></a></td>
							</tr class="#fffffb">
							<tr ng-repeat="i in officers" class="light-green lighten-4">
								<td>{{i.officerId}}</td>
								<td>{{i.officerName}}</td>
								<td>{{i.officerUsername}}</td>
								<td>{{i.officerPassword}}</td>
								<td>{{i.workArea}}</td>
								<td>{{i.officerContactNumber}}</td>
								<td>{{i.assignedBranch}}</td>
								<td class="center-align"><a
									class="waves-effect waves-light btn modal-trigger modal-close  light-blue darken-1"
									href="#UpdateOfficer" value="i.officerId"
									ng-click="updateClick(i.officerId,i.officerUsername,i.officerPassword, i.officerName, i.workArea, i.officerContactNumber,i.assignedBranch)"><i
										class="material-icons">edit</i></a></td>
								<td class="center-align"><a
									class="waves-effect waves-light btn modal-trigger modal-close  red darken-1"
									href="#DeleteOfficer" value="i.cultivationId"
									ng-click="deleteClick(i.officerId, i.officerName)"><i
										class="material-icons">delete</i></a></td>
								<td"></td>
							</tr>
						</table>
						</div>
						
						<div class="divider"></div>
					</div>
			<!-- END Officer Details table -->
			
			<!-- Add model -->
			<div id="AddOfficer" class="modal">
				<div class="modal-content">
					<div class="raw">
						<div class="col s11 m11 l11">
							<h5>Add Officer details.</h5>
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
								<input id="officerId" name="officerId" type="text" 
									class="validate" ng-model="officerId" pattern= "[0-9]"> <label
									for="officerId">Officer ID</label>
							</div>
						</div>	
						<div class="row">
							<div class="input-field col s6">
								<input id="officerName" name="officerName" type="text"
									class="validate" ng-model="officerName"> <label
									for="officerName">Officer Name</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<input id="officerUsername" name="officerUsername" type="text"
									class="validate" ng-model="officerUsername"> <label
									for="officerUsername">Username</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<input id="officerPassword" name="officerPassword" type="text"
									class="validate" ng-model="officerPassword"> <label
									for="officerPassword">Password</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<input id="workArea" name="workArea" type="text"
									class="validate" ng-model="workArea"> <label
									for="workArea">Work Area</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<input id="officerContactNumber" name="officerContactNumber" type="tel"
									class="validate" ng-model="officerContactNumber"> <label
									for="officerContactNumber">Contact No.</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<input id="assignedBranch" name="assignedBranch" type="text"
									class="validate" ng-model="assignedBranch"> <label
									for="assignedBranch">Branch</label>
							</div>
						</div>						
						<div class="modal-footer">
							<button class="btn waves-effect waves-light modal-close"
								type="submit" name="action" id="addAction"
								ng-click="postOfficer(officerId,officerUsername,officerPassword, officerName, workArea, officerContactNumber,assignedBranch)">
								Add <i class="material-icons right">playlist_add</i>
							</button>
						</div>
					</form>
				</div>
			</div>
			<!--  END Add model -->
			
			<!--  Update model -->
			<div id="UpdateOfficer" class="modal">
				<div class="modal-content">
					<div class="raw">
						<div class="col s11 m11 l11">
							<h5>Update Officer details.</h5>
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
								<input id="updateofficerId" name="officerId" type="text" 
									placeholder="updateofficerId" 
									value="updateofficerId"
									class="validate" ng-model="updateofficerId" pattern= "[0-9]"> <label
									for="updateofficerId">Officer ID</label>
							</div>
						</div>	
						<div class="row">
							<div class="input-field col s6">
								<input id="updateofficerName" name="updateofficerName" type="text"
									placeholder="updateofficerName" 
									value="updateofficerName"
									class="validate" ng-model="updateofficerName"> <label
									for="updateofficerName">Officer Name</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<input id="updateofficerUsername" name="updateofficerUsername" type="text"
									placeholder="updateofficerUsername" 
									value="updateofficerUsername"
									class="validate" ng-model="updateofficerUsername"> <label
									for="updateofficerUsername">Username</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<input id="updateofficerPassword" name="updateofficerPassword" type="text"
									placeholder="updateofficerPassword" 
									value="updateofficerPassword"
									class="validate" ng-model="updateofficerPassword"> <label
									for="updateofficerPassword">Password</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<input id="updateworkArea" name="updateworkArea" type="text"
									placeholder="updateworkArea" 
									value="updateworkArea"
									class="validate" ng-model="updateworkArea"> <label
									for="updateworkArea">Work Area</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<input id="updateofficerContactNumber" name="updateofficerContactNumber" type="tel"
									placeholder="updateofficerContactNumber" 
									value="updateofficerContactNumber"
									class="validate" ng-model="updateofficerContactNumber"> <label
									for="updateofficerContactNumber">Contact No.</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<input id="updateassignedBranch" name="updateassignedBranch" type="text"
									placeholder="updateassignedBranch" 
									value="updateassignedBranch"
									class="validate" ng-model="updateassignedBranch"> <label
									for="updateassignedBranch">Branch</label>
							</div>
						</div>						
						<div class="modal-footer">
							<button class="btn waves-effect waves-light modal-close"
								type="submit" name="action" id="addAction"
								ng-click="postOfficer(updateofficerId,updateofficerUsername,updateofficerPassword,updateofficerName, updateworkArea, updateofficerContactNumber,updateassignedBranch)">
								Add <i class="material-icons right">playlist_add</i>
							</button>
						</div>
					</form>
				</div>
			</div>
			<!--  END Update model -->
			
			<!--  Delete model -->
			<div id="DeleteOfficer" class="modal">
				<div class="modal-content">
					<div class="raw">
						<div class="col s11 m11 l11">
							<h5>Do you need to delete this Officer Account? </h5><br>
								ID : {{officerdeleteId}}<br>
								Name: {{officerdeleteName}}
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
								ng-click="deleteOfficer(officerdeleteId)">Delete</button>
						</div>
					</form>
					</div>
				</div>
			</div>
			
			<!--  END Delete model -->
		</div>
		
    
    
    
    </div>
    
    
    
</body>
</html>