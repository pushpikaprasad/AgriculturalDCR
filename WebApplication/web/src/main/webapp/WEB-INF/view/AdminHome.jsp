<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
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
	rel="stylesheet">
<Script>
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
</Script>

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

		var formdata = new FormData();

		//Add form function	

		//Update form function

		//delete function

	});
</script>

</head>
<body>

	<div class="page-container" ng-app="adminPageDetails"
		ng-controller="adminPageData">
		<div class="row">
			<!-- Start Side Navigation -->
			<div class="col s2 m2 l2" ng-model="adminDetails">
				<h6>{{adminDetails.adminName}}</h6>


			</div>
			<!-- End Side Navigation -->
			<!--Start  main session -->
			<div class="col s9 m9 l9">
				<h4>${title}</h4>
				<div class="divider"></div>
				<h6>${message}</h6>
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
								<td"></td>

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
									href="#UpdateCultivation"><i class="material-icons">edit</i></a></td>
								<td><a
									class="waves-effect waves-light btn modal-trigger modal-close  red darken-1"
									href="#DeleteCultivation"><i class="material-icons">delete</i></a></td>
								<td"></td>

							</tr>
						</table>
					</div>
				</div>
				<br>

			</div>
			<!-- End main session -->

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
					<form ng-submit="AddCultivationForm()">
						<div class="row">
							<div class="input-field col s6">
								<input id="cultivationId" name="cultivationId" type="text"
									class="validate" ng-model="cultivations.cultivationId">
								<label for="cultivationId">Cultivation ID</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<input id="cultivationType" name="cultivationType" type="text"
									class="validate" ng-model="cultivations.cultivationType">
								<label for="cultivationType">Cultivation Type</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<input id="harvestAmount" name="harvestAmount" type="number"
									class="validate" ng-model="cultivations.harvestAmount">
								<label for="harvestAmount">Harvest Amount</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<input id="location" name="location" type="text"
									class="validate" ng-model="cultivations.location"> <label
									for="location">Location</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<p>
									<label><input class="with-gap" name="availability"
										type="radio" id="availabilityTrue"
										ng-model="cultivations.availability" /> <span>Available</span></label>

									<label><input class="with-gap" name="availability"
										ng-model="cultivations.availability" type="radio"
										id="availabilityFalse" /> <span>Not Available</span></label>
								</p>

							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<input id="farmerId" name="farmerId" type="text"
									class="validate" ng-model="cultivations.farmerId"> <label
									for="farmerId">Farmer ID</label>
							</div>
						</div>

						<div class="modal-footer">

							<button class="btn waves-effect waves-light modal-close"
								type="submit" name="action" id="addAction">
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
					<form ng-submit="">
						<div class="row">
							<div class="input-field col s6">
								<input disabled id="cultivationId" type="text" class="validate">
								<label for="cultivationId">Cultivation ID</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<input id="cultivationType" type="text" class="validate">
								<label for="cultivationType">Cultivation Type</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<input id="harvestAmount" type="number" class="validate">
								<label for="harvestAmount">Harvest Amount</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<input id="location" type="text" class="validate"> <label
									for="location">Location</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<p>
									<label><input class="with-gap" name="availabilty"
										type="radio" id="availabilityTrue" /> <span>Available</span></label>

									<label><input class="with-gap" name="availabilty"
										type="radio" id="availabilityFalse" /> <span>Not
											Available</span></label>
								</p>

							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<input id="farmerId" type="text" class="validate"> <label
									for="farmerId">Farmer ID</label>
							</div>
						</div>

						<div class="modal-footer">

							<button class="btn waves-effect waves-light modal-close"
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
							<h5>Do you need to delete this record?</h5>
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



					<form ng-submit="">
						<div class="row">
							<div class="input-field col s6">
								<input disabled id="cultivationId" type="text" class="validate">
								<label for="cultivationId">Cultivation ID</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s6">
								<input disabled id="cultivationType" type="text"
									class="validate"> <label for="cultivationType">Cultivation
									Type</label>
							</div>
						</div>
						<div class="modal-footer">
							<button
								class="btn waves-effect waves-light modal-close blue-text blue lighten-5">
								No</button>
							<button
								class="btn waves-effect waves-light modal-close red darken-1"
								type="submit" name="action">Delete</button>

						</div>

					</form>
				</div>

			</div>
			<!-- End Update cultivation form -->

		</div>
	</div>

</body>
</html>