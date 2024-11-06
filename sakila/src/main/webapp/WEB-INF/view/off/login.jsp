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

<body class="container">

	<div class="row">
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
			<h1 class="text-center">STAFF LOGIN</h1>
			<hr>
			<div class="text-danger">${msg}</div>
		</div>
		<div class="col-sm-4"></div>
	</div>
	
	<div class="row">
		<div class="col-sm-4"></div>
	
		<div class="col-sm-4 mt-4 p-5 bg-warning text-white rounded">
			<form id="form" action="${pageContext.request.contextPath}/off/login" method="post">
				<div class="mb-3 mt-3">
					<label for="staffId" class="form-label">STAFF ID:</label>
					<input id="staffId" name="staffId" type="text" class="form-control" id="staffId" name="staffId" value="1">
			 	</div>
			 	<div class="mb-3">
					<label for="password" class="form-label">STAFF PW:</label>
					<input id="password" name="password" type="password" class="form-control" value="1234">
				</div>
				<div class="text-center">
					<button id ="btn" type="button" class="btn btn-light">Login</button>
					|
					<button type="reset" class="btn btn-light">Reset</button>
				</div>
			</form>
		</div>
		
		<div class="col-sm-4"></div>
	
	</div>
</body>

<script>
	// btn버턴 클릭시 폼값 유효성 검사
	$('#btn').click(function(){
		console.log('click');
		// isNaN() : 숫자가 아니면 or $.isNumeric() : 숫자이면
		if($.isNumeric($('#staffId').val()) == false) {
			alert('staffId는 숫자만 입력 가능');
		} else if($('#password').val().length < 4) {
			alert('password는 4자이상 가능');
		} else {
			$('#form').submit();
		}
	});
</script>
</html>