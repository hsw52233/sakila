<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="container-flud">
	<div class="row">
		<div class="col-sm-2 bg-light">
			<!-- leftMenu.jsp include -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		
		
		<div class="col-sm-10">
			<!-- main content -->
			<h1>CUSTOMER ONE</h1>
			<!-- ACTOR -->
			<h2>&#128526; CUSTOMER</h2>
			<table class="table">
				<tr>
					<td>customerId</td>
					<td>${customer.customerId}</td>
				</tr>
				<tr>
					<td>storeId</td>
					<td>${customer.storeId}</td>
				</tr>
				<tr>
					<td>firstName</td>
					<td>${customer.firstName}</td>
				</tr>
				<tr>
					<td>lastName</td>
					<td>${customer.lastName}</td>
				</tr>
				<tr>
					<td>email</td>
					<td>${customer.email}</td>
				</tr>
				<tr>
					<td>addressId</td>
					<td>${customer.addressId}</td>
				</tr>
				<tr>
					<td>active</td>
					<td>${customer.active}</td>
				</tr>
				<tr>
					<td>createDate</td>
					<td>${customer.createDate}</td>
				</tr>
				
			</table>
			
			<br>
			
		</div>
	</div>
</body>

</html>