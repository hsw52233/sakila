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
			<h1>ADD Customer</h1>
			
			
			<h2>입력 폼</h2>
			<form id="addForm" action="${pageContext.request.contextPath}/on/addCustomer" method="post">
				<table class="table" style="width: 80%">
					
					<tr>
						<td>storeId</td>
						<td>
							<select name="storeId" id="storeId">
								<option value="">:::선택:::</option>
								<c:forEach var="s" items="${storeList}">
									<option value="${s.storeId}">${s.storeId}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					
					
					
					<tr>
						<td>firstName</td>
						<td>
							<input type="text" name="firstName" id="firstName">
						</td>
					</tr>
					
					<tr>
						<td>lastName</td>
						<td>
							<input type="text" name="lastName" id="lastName">
						</td>
					</tr>
					
					<tr>
						<td>email</td>
						<td>
							<input type="text" name="email" id="email">
						</td>
					</tr>
					<tr>
						<td>addressId</td>
						<td>
							<input type="text" name="addressId" id="addressId" >
						</td>
					</tr>
					
					<tr>
						<td>active</td>
						<td>
							<input type="text" name="active" id="active">
						</td>
					</tr>
					
				</table>
				<button id="btnAddStaff" type="button">고객 추가</button>
			</form>
		</div>
	</div>
</body>
<script>
	// 액션 서브밋 버턴
	$('#btnAddStaff').click(function() {
		// 입력폼 유효성 검사
		if($('#storeId').val() == null || $('#storeId').val() =='') {
			alert('storeId를 입력하세요');
		} else if($('#addressId').val() == null || $('#addressId').val() =='') {
			alert('addressId를 입력하세요');
		} else if($('#firstName').val() == null || $('#firstName').val() =='') {
			alert('firstName를 입력하세요');
		} else if($('#lastName').val() == null || $('#lastName').val() =='') {
			alert('lastName를 입력하세요');
		} else if($('#email').val() == null || $('#email').val() =='') {
			alert('email를 입력하세요');
		} else if($('#active').val() == null || $('#username').val() =='') {
			alert('username를 입력하세요');
		} else{
			console.log('submit....');
			$('#addForm').submit();
		}
	});
	
	
</script>
</html>