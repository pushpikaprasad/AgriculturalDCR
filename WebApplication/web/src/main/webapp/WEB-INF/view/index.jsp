<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html ng-app="homePageDetails">
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
<script>
var homePageDetails = angular.module('homePageDetails', []);


homePageDetails.controller('homePageData', function($scope, $http) {
	
	
	var farmerNames = [];
	$scope.getFarmerName = function(cultivationId){
		var url = '/farmerName/'+cultivationId;
		
		$http.get(url).then(function(res) {
			farmerNames.pop();
			$scope.farmerName = res.data;
			farmerNames.push($scope.farmerName);
		});	
	};
	
	$scope.Getcultivation = function() {
		$http.get('/').then(function(res) {
			$scope.cultivations = res.data; 
			for(var i in $scope.cultivations){
				$scope.getFarmerName($scope.cultivations[i].cultivationId);
				console.log(farmerNames);
				$scope.cultivations[i].farmerName = farmerNames;
			}
			
			console.log($scope.cultivations);
		});
	};
	
	$http.get('/').then(function(res) {
		$scope.Getcultivation();
		
		
	});
	
});

</script>
<style type="text/css">

.brand-logo {
    padding-left: 12px !important;
}
.page-footer {
        background-color: black;
    }
 body {
     display: flex;
     min-height: 120vh;
     flex-direction: column;
 }
 .page-container {
     flex: 1 0 auto;
 }

</style>
</head>

<body ng-controller="homePageData">


		<nav style="background: linear-gradient(60deg,#2e7d32,#689f38);">
			<div class="nav-wrapper">
				<a  href="/"><span class="brand-logo"><i class="material-icons large left">eco</i>AgriculturalDCR</span></a>
				<ul id="nav-mobile" class="right">
	        <li><a href="/"><i class="material-icons large right">login</i>LOGIN</a></li>
	      </ul>
			</div>
		</nav>
		
	<div class="page-container">
		<div class="row">
		
		</div>
		<div class="row">
			<div class="row" id="filer">
			<h4>CULTIVATION DETAILS</h4>
			</div>
			
			<div class="row">
				<div class="col s9 offset-s1 m9 offset-m1 l9 offset-l1 z-depth-5" id="table">
				<table>
					<tr >
						<th>Cultivation Type</th>
						<th>Harvest Amount</th>
						<th>Availability</th>
						<th>Farmer Name</th>
						<th>Location</th>			
					</tr>
					<tr ng-repeat="i in cultivations | limitTo:2">
						<td>{{i.cultivationType}}</td>
						<td>{{i.harvestAmount}}</td>
						<td>{{i.availability}}</td>
						<td>{{i.farmerName[0]}}</td>
						<!--  <td ng-model="getFarmerName(i.cultivationId)">{{farmerName}}</td>-->
						<td>{{i.location}}</td>
					</tr>
				</table>
				
			</div>
			</div>
		</div>
	</div>
	
	
	 <footer class="page-footer ">
          <div class="container">
            <div class="row">
              <div class="col l6 s12">
                <h5 class="white-text">AgriculturalDCR</h5>
                <p class="grey-text text-lighten-4">Contacts: <br>Tel: +9425345345</p>
              </div>
              <div class="col l4 offset-l2 s12">
                <h5 class="white-text">Links</h5>
                <ul>
                  <li><a class="grey-text text-lighten-3" href="https://www.doa.gov.lk/index.php/en/">Department of Agriculture</a></li>
                  <li><a class="grey-text text-lighten-3" href="http://www.agrimin.gov.lk/">Ministry of Agriculture</a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="footer-copyright">
            <div class="container">
            © 2020 AgriculturalDCR. All rights reserved
            </div>
          </div>
        </footer>
</body>
</html>