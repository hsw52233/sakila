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
			<h1>FILM LIST</h1>
			<!--  카테고리 선택 -->
			<form action="${pageContext.request.contextPath}/on/filmList"
					action="get" id="formCategory">
				<select name="categoryId" id="categoryId">
					<option value="0">전체</option>
					<c:forEach var="c" items="${categoryList}">
						<c:if test="${c.categoryId == currentCategoryId}">
							<option selected value="${c.categoryId}">${c.name}</option>
						</c:if>
						<c:if test="${c.categoryId != currentCategoryId}">
							<option value="${c.categoryId}">${c.name}</option>
						</c:if>	
					</c:forEach>
				</select>
			</form>
			<br>
			<table class="table"> 
				<tr>
					<td>filmId</td>
					<td>title</td>
					<td>releaseYear</td>
					<td>rentalDuration</td>
					<td>rentalRate</td>
					<td>length</td>
					<td>replacementCost</td>
					<td>rating</td>
				</tr>
				<c:forEach var="f" items="${filmList}"><!-- filmList -->
					<tr>
						<td>${f.filmId}</td>
						<td>
							<a href="${pageContext.request.contextPath}/on/filmOne?filmId=${f.filmId}">
								${f.title}
							</a>
						</td>
						<td>${f.releaseYear}</td>
						<td>${f.rentalDuration}</td>
						<td>${f.rentalRate}</td>
						<td>${f.length}</td>
						<td>${f.replacementCost}</td>
						<td>${f.rating}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
<script>
	$('#categoryId').change(function() {
		// alert('change!');
		$('#formCategory').submit();
	});
</script>
</html>