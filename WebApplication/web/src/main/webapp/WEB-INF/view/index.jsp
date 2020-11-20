<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
 <html xmlns="http://www.w3.org/1999/xhtml" 
    xmlns:th="http://www.thymeleaf.org" 
    xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3"
    xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angular_material/1.1.1/angular-material.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-router/1.0.3/angular-ui-router.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-sanitize/1.6.4/angular-sanitize.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
   
<script>
	var cultivationsDetails = angular.module('cultivationsDetails', []);   
	cultivationsDetails.controller('cultivationsData', function ($scope, $http) {	
	 $http.get('http://localhost:8080/cultivations').then(function(res) {
		 $scope.cultivations = res.data;
		 console.log($scope.cultivations);
	}); 
	});
</script>
</head>
<body>

<h1>Cultivation Details</h1>

<div class="highlight" ng-app="cultivationsDetails" ng-controller="cultivationsData">
<table>
  <tr ng-repeat="i in cultivations">
       <td>{{i.cultivationId}}</td>
       <td>{{i.cultivationType}}</td>
       <td>{{i.harvestAmount}}</td>
       <td>{{i.location}}</td>
       <td>{{i.availability}}</td>
       <td>{{i.farmerId}}</td>
  </tr>
</table>
</div>

</body>
</html>