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
		<!-- ● 
			● 1) film 상세
			● 1-1) film 수정 - /on/modifyFilm
			● 1-2) film 삭제 - /on/removeFilm 
			(inventory 렌탈정보확인 + film_category삭제 + film_actor삭제 + film삭제)
			
			● 2) film_category 리스트
			● 2-1) film_category 추가 /on/addFilmCategory 
					-> [이슈] 동일한 카테고리를 한번 더 추가하면 PK중복에러 발생 
			● 2-2) film_category 삭제 /on/removeFilmCategory
						
			● 3) film_actor 리스트
			● 3-1) film_actor 추가 /on/addActorByFilm -> 액터 "검색" 후 선택
					-> [이슈] 동일한 배우를 한번 더 추가하면 PK중복에러 발생
			● 3-2) film_actor 삭제 /on/removeFileActor

		 -->
		<div class="col-sm-10">
			<!-- main content -->
			<h1>FILM ONE</h1>
			<div>
				<!-- 필름 하나의 상세 정보 -->
				${film}
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/on/modifyFilm?filmId=${film.filmId}">영화 수정</a>
				<a href="${pageContext.request.contextPath}/on/removeFilm?filmId=${film.filmId}">영화 삭제</a>
				<span class="text-danger">${removeFilmMsg}</span>
			</div>
			
			<br>	
			<div>
				<h2>작품 장르(CATEGORY)</h2>
				
				<form id="formFileCategory" action="${pageContext.request.contextPath}/on/addFilmCategory" 
					method="post"><!-- 이 영화 카테고리 추가 -->
					<input type="hidden" name="filmId" value="${film.filmId}">
					<select name="categoryId" id="categoryId">
						<option value="">카테고리 선택</option>
						<!-- model.allCategoryList -->
						<c:forEach var="ac" items="${allCategoryList}">
							<option value="${ac.categoryId}">${ac.name}</option>
						</c:forEach>
					</select>
					<button id="btnFileCategory" type="button">현재필름 카테고리 추가</button>
				</form>
				
				<!-- 카테고리 리스트 model.filmCategoryList -->
				<div>
					<c:forEach var="fc" items="${filmCategoryList}">
						<div>
							${fc.name}
							&nbsp;
							<a href="${pageContext.request.contextPath}/on/removeFilmCategory?filmId=${fc.filmId}&categoryId=${fc.categoryId}">삭제</a>
						</div>
					</c:forEach>
				</div>				
			</div>
			
			<br>	
			<div>
				<h2>작품에 출연한 배우들</h2>
				<div>
					<form id="formSearchName" 
						action="${pageContext.request.contextPath}/on/filmOne" 
						method="get"><!-- 배우이름 검색 -->
						
						<input type="hidden" name="filmId" value="${film.filmId}">
						
						<input type="text" name="searchName" id="searchName">
						<button id="btnSearchName" type="button">이름검색</button>
					</form>
				
					<form id="formFilmActor"
						method="post"
						action="${pageContext.request.contextPath}/on/addFilmActorByFilm"><!-- 출연배우 추가 -->
						<input type="hidden" name="filmId" value="${film.filmId}">
						<select name="actorId" id="actorId" size="5">
							<!-- model.searchActorList -->
							<c:forEach var="sa" items="${searchActorList}">
								<option value="${sa.actorId}">${sa.firstName} ${sa.lastName}</option>
							</c:forEach>
						</select>
						<button id="btnFilmActor" type="button">출연배우추가</button>
					</form>
				
					<c:forEach var="a" items="${actorList}">
						<div>
							<a href="${pageContext.request.contextPath}/on/actorOne?actorId=${a.actorId}">
								${a.firstName} ${a.lastName}
							</a>
							&nbsp;
							<a href="${pageContext.request.contextPath}/on/removeFilmActorByFilm?filmId=${film.filmId}&actorId=${a.actorId}">삭제</a>
						</div>
					</c:forEach>
					
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$('#btnFilmActor').click(function() {
		if($('#actorId').val() == null || $('#actorId').val() == '') {
			alert('출연배우를 선택하세요');
		} else {
			$('#formFilmActor').submit();
		}
	});

	$('#btnSearchName').click(function() {
		if($('#searchName').val() == '') {
			alert('검색이름을 입력하세요');
		} else {
			$('#formSearchName').submit();
		}
	});

	$('#btnFileCategory').click(function() {
		if($('#categoryId').val() == '') {
			alert('categoryId를 선택하세요');
		} else {
			$('#formFileCategory').submit();
		}
	});
</script>
</html>











