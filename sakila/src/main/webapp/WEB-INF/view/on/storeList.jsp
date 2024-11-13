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
		<div class="col-sm-10 bg-light">
			<div class="main">
				<!-- main -->
				<table class="table table-success text-center" style="width:1300px; border-radius: 10px; overflow: hidden; border-bottom-style: hidden;">
					<tr>
						<th style="font-size: large;">Store List</th>
					</tr>
				</table>
				
				<hr style="width: 1300px;">
				
				<table class="table text-center" style="width:1300px; border-radius: 10px; overflow: hidden; border-bottom-style: hidden;">
					<thead class=table-success>
					<tr>
						<th>Store ID</th>
						
						<th>Store Address</th>
						<th>Postal Code</th>
						<th>Staff ID</th>
						<th>Staff Name</th>
						<th>Phone</th>
						<th>Manager Staff ID</th>
						<th>Last Update</th>
						<th>Inventory</th>
						
					</tr>
					</thead>
					<c:forEach var="s" items="${storeList}">
						<tr>
							<td>${s.storeId}</td>
							
							<td>${s.address}${s.address2}, ${s.district}, ${s.city}, ${s.country}</td>
							<td>${s.postalCode}</td>
							<td>${s.staffId}</td>
							<td>${s.firstName} ${s.lastName}</td>
							<td>${s.phone}</td>
							<td>${s.managerStaffId}</td>
							<td>${s.lastUpdate}</td>
							<td>
								<a href="${pageContext.request.contextPath}/on/inventoryList?storeId=${s.storeId}" class="remove-link text-primary">Inventory</a>
							</td>
							
						</tr>
					</c:forEach>
				</table>
				
			</div>
		</div>
	</div>
			<!-- Pagination -->
				<div class="pagination justify-content-center" style="text-align: center; margin-top: 20px; width: 500px">
					<!-- 첫 페이지 -->
					<c:if test="${!(currentPage > 1)}">
						<a href="" style="pointer-events: none;">&laquo;</a>
					</c:if>
					<c:if test="${currentPage > 1}">
						<a href="${pageContext.request.contextPath}/on/actorList?currentPage=1&searchWord=${searchWord}">&laquo;</a>
					</c:if>
					<!-- 이전 페이지 -->
					<c:if test="${!(currentPage > 1)}">
						<a href="" style="pointer-events: none;">Previous</a>
					</c:if>
					<c:if test="${currentPage > 1}">
						<a href="${pageContext.request.contextPath}/on/actorList?currentPage=${currentPage-1}&searchWord=${searchWord}">Previous</a>
					</c:if>
					<!-- 페이지 번호 링크 -->
<!-- 					 
				    <c:forEach var="page" begin="1" end="${lastPage}">
				        <c:if test="${page == currentPage}">
				            <a class="active">${page}</a> <!-- 현재 활성화 페이지 -->
<!--  				    </c:if>
				        
				        <c:if test="${page != currentPage}">
				            <a href="${pageContext.request.contextPath}/on/actorList?currentPage=${page}">${page}</a>
				        </c:if>
				    </c:forEach>
				    
-->					
					<!-- 페이지 번호 링크 -->
					<c:if test="${currentPage <= 1}">
						<a href="" style="pointer-events: none;">&nbsp;&nbsp;</a>
					</c:if>
					
					<c:if test="${currentPage > 1}">
						<a href="${pageContext.request.contextPath}/on/actorList?currentPage=${currentPage-1}&searchWord=${searchWord}">${currentPage - 1}</a>
					</c:if>
					
					<a class="active">${currentPage}</a>
					
					<c:if test="${currentPage < lastPage}">
						<a href="${pageContext.request.contextPath}/on/actorList?currentPage=${currentPage+1}&searchWord=${searchWord}">${currentPage + 1}</a>
					</c:if>
					
					<c:if test="${currentPage >= lastPage}">
						<a href="" style="pointer-events: none;">&nbsp;&nbsp;</a>
					</c:if>
					
				    <!-- 다음 페이지 -->
				    <c:if test="${!(currentPage < lastPage)}">
						<a href="" style="pointer-events: none;">Next</a>
					</c:if>
					<c:if test="${currentPage < lastPage}">
						<a href="${pageContext.request.contextPath}/on/actorList?currentPage=${currentPage+1}&searchWord=${searchWord}">Next</a>
					</c:if>
					
				    <!-- 마지막 페이지 -->
					<c:if test="${!(currentPage < lastPage)}">
						<a href="" style="pointer-events: none;">&raquo;</a>
					</c:if>
					<c:if test="${currentPage < lastPage}">
						<a href="${pageContext.request.contextPath}/on/actorList?currentPage=${lastPage}&searchWord=${searchWord}">&raquo;</a>
					</c:if>
				</div>
		</div>
	</div>
</body>
</html>