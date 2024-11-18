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
			<h1>${storeId}지점 INVENTORY LIST</h1>
			
			<div>
				<a href="${pageContext.request.contextPath}/on/addInventory?storeId=${storeId}">
					인벤토리 추가
				</a>
			</div>
			
			<table class="table">
				<tr>
					<td>inventoryId</td>
					<td>(filmId)title</td>
					<td>lastUpdate</td>
					<td>삭제</td>
				</tr>
				<c:forEach var="iv" items="${inventoryList}">
					<tr>
						<td>${iv.inventoryId}</td>
						<td>
							<a href="${pageContext.request.contextPath}/on/filmOne?filmId=${iv.filmId}">
								(${iv.filmId}) ${iv.title}
							</a>
						</td>
						<td>${iv.lastUpdate}</td>
						<td>
							<a href="${pageContext.request.contextPath}/on/removeInventoryByKey?inventoryId=${iv.inventoryId}&storeId=${storeId}">
								삭제
							</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>