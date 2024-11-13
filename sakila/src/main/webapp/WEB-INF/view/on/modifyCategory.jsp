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
			<h1>MODIFY ACTOR</h1>
			<table class="table">
				<tr>
					<td>name</td>
					<td>
						<form id="formName" action="${pageContext.request.contextPath}/on/modifyCategory"
								method="post">
							<input type="hidden" name="categoryId" value="${category.categoryId}">
							<input type="text" value="${category.name}" 
									name="name" id="name"> 
							<button type="button" id="btnName">name 수정</button>
						</form>
					</td>
				</tr>
				
				
			</table>
		</div>
	</div>
</body>
<script>
	$('#btnName').click(function(){
		if($('#formName').val() == '') {
			alert('수정할 name을 입력하세요');
		} else {
			$('#formName').submit();
		}
	});
	
	
</script>
</html>