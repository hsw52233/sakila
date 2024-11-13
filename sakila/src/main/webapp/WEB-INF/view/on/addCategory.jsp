<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>addCategory</title>
</head>
<body class="container-flud">
	<div class="row">
		<div class="col-sm-2 bg-light">
			<!-- leftMenu.jsp include -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		
		<div class="col-sm-10">
			<!-- main content -->
			<h1>ADD Category</h1>
			
			<div>${msg}</div>
			
			<form id="formCategory" method="post" action="${pageContext.request.contextPath}/on/addCategory"
				enctype="multipart/form-data">
				<table class="table">
					
					<tr>
						<td>name</td>
						<td><input type="text" name="name"></td>
					</tr>
					
				</table>
				<button type="button" id="btnAddCategory">카테고리 추가</button>
			</form>
		</div>
	</div>
</body>
<script>
$('#btnAddCategory').click(function(){
	if( $('#name').val() == '') {
		alert('이름을 입력하세요');
	} else {
		$('#formCategory').submit();
	}
});
</script>
</html>