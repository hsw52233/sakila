<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>addLanguage</title>
</head>
<body class="container-flud">
	<div class="row">
		<div class="col-sm-2 bg-light">
			<!-- leftMenu.jsp include -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		
		<div class="col-sm-10">
			<!-- main content -->
			<h1>ADD Store</h1>
			
			<div>${msg}</div>
			
			<form id="formStore" method="post" action="${pageContext.request.contextPath}/on/addStore"
				enctype="multipart/form-data">
				<table class="table">
					<tr>
						<td>firstName</td>
						<td><input type="text" name="firstName"></td>
					</tr>
					<tr>
						<td>lastName</td>
						<td><input type="text" name="lastName"></td>
					</tr>
					
					
				</table>
				<button type="button" id="btnAddStore">지점 추가</button>
			</form>
		</div>
	</div>
</body>
<script>
$('#btnAddStore').click(function(){
	if($('#firstName').val() == '' || $('#lastName').val() == '') {
		alert('입력하세요');
	} else {
		$('#formStore').submit();
	}
});




</script>
</html>