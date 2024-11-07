<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<ul class="list-group text-center bg-light">
	<li class="list-group-item bg-light">
		<a href="${pageContext.request.contextPath}/on/main" class="btn">홈으로</a>
	</li>
	<li class="list-group-item bg-light">
		<a href="${pageContext.request.contextPath}/on/staffOne" class="btn">${loginStaff.username}님</a>
	</li>
	<li class="list-group-item bg-light">
		<a href="${pageContext.request.contextPath}/on/logout" class="btn">로그아웃</a>
	</li>
	
	<li class="list-group-item bg-light fw-bold">
		::: 지점 관리 :::
	</li>
	<li class="list-group-item bg-light">
		<a href="" class="btn">지점 리스트</a>
	</li>
	<li class="list-group-item bg-light">
		<a href="" class="btn">지점 추가</a>
	</li>
	
	<li class="list-group-item bg-light fw-bold">
		::: STAFF 관리 :::
	</li>
	<li class="list-group-item bg-light">
		<a href="${pageContext.request.contextPath}/on/staffList" class="btn">스탭 리스트</a>
	</li>
	<li class="list-group-item bg-light">
		<a href="${pageContext.request.contextPath}/on/addStaff" class="btn">스탭 추가</a>
	</li>
	
	<li class="list-group-item bg-light fw-bold">
		::: 영화 관리 :::
	</li>
	<li class="list-group-item bg-light">
		<a href="" class="btn">영화 리스트</a>
	</li>
	<li class="list-group-item bg-light">
		<a href="${pageContext.request.contextPath}/on/addFilm" class="btn">영화 추가</a>
	</li>
	
	
	<li class="list-group-item bg-light fw-bold">
		::: 고객 관리 :::
	</li>
	<li class="list-group-item bg-light">
		<a href="">고객 리스트</a>
	</li>
	<li class="list-group-item bg-light">
		<a href="" class="btn">고객 추가</a>
	</li>
	
	<li class="list-group-item bg-light fw-bold">
		::: 배우 관리 :::
	</li>
	<li class="list-group-item bg-light">
		<a href="${pageContext.request.contextPath}/on/actorList" class="btn">배우 리스트</a>
	</li>
	<li class="list-group-item bg-light">
		<a href="${pageContext.request.contextPath}/on/addActor" class="btn">배우 추가</a>
	</li>
	
	<li class="list-group-item bg-light fw-bold">
		::: 통계 :::
	</li>
</ul>