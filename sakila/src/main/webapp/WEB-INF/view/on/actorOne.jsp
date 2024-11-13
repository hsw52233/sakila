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
			● 1) actor 상세
			● 1-1) actor 수정 - /on/modifyActor
			1-2) actor 삭제 - /on/removeActor (actor_file삭제 + film_actor삭제 + actor삭제)
			
			● 2) actor_file 리스트
			● 2-1) actor_file 추가 
			● 2-2) actor_file 삭제 /on/removeActorFile
						
			● 3) film_actor 리스트
			● 3-1) film_actor 추가 /on/addFilmByActor -> 필름 검색 후 선택
			● 3-2) film_actor 삭제 /on/removeFilmActor 

		 -->
		
		<div class="col-sm-10">
			<!-- main content -->
			<h1>ACTOR ONE</h1>
			<!-- ACTOR -->
			<h2>&#128526; ACTOR</h2>
			<table class="table">
				<tr>
					<td>actorId</td>
					<td>${actor.actorId}</td>
				</tr>
				<tr>
					<td>firstName</td>
					<td>${actor.firstName}</td>
				</tr>
				<tr>
					<td>lastName</td>
					<td>${actor.lastName}</td>
				</tr>
				<tr>
					<td>lastUpdate</td>
					<td>${actor.lastUpdate}</td>
				</tr>
			</table>
			<div>
				<a href="${pageContext.request.contextPath}/on/modifyActor?actorId=${actor.actorId}">
					actor 수정
				</a>
				&nbsp;
				<a href="${pageContext.request.contextPath}/on/removeActor?actorId=${actor.actorId}">
					actor 삭제
				</a>
			</div>
			
			<br>
			<!-- ACTOR FILE -->
			<h2>&#128526; ACTOR FILE</h2>
			<table class="table">
				<tr>
					<td>image</td>
					<td>type</td>
					<td>size</td>
					<td>createDate</td>
					<td>삭제</td>
				</tr>
				<c:forEach var="af" items="${actorFileList}">
					<tr>
						<td>
							<img src="${pageContext.request.contextPath}/upload/${af.filename}.${af.ext}">
						</td>
						<td>${af.type}</td>
						<td>${af.size} Byte</td>
						<td>${af.createDate}</td>
						<td>
							<a href="${pageContext.request.contextPath}/on/removeActorFile?actorFileId=${af.actorFileId}&actorId=${actor.actorId}" 
								class="btn btn-warning">삭제
							</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<div>
				<a href="${pageContext.request.contextPath}/on/addActorFile?actorId=${actor.actorId}" 
				class="btn btn-success">
					이미지파일 추가
				</a>
			</div>
			
			<br>
			<!-- FILM -->
			<div>
				<h2>&#128526; 출연 작품</h2>
				
				<div>
					<!-- 출연작 추가 -->
					<form id="formSearchFilm" method="get" 
						action="${pageContext.request.contextPath}/on/actorOne"><!-- 영화검색 -->
						<!-- film 검색시 actorId같이 전송 -->
						<input type="hidden" name="actorId" value="${actor.actorId}">
						<input type="text" name="searchTitle">
						<button id="btnSearchFilm" type="button">film 검색</button>
					</form>
					
					<form id="formAddFilm" method="post"
						action="${pageContext.request.contextPath}/on/addFilmActorByActor">
						<input type="hidden" name="actorId" value="${actor.actorId}">
						<select size="5" name="filmId">
							<c:forEach var="sf" items="${searchFilmList}">
								<option value="${sf.filmId}">${sf.title}</option>
							</c:forEach>
						</select>
						<button id="btnAddFilm" type="button">film 추가</button>
					</form>
				</div>
				
				<br>
				
				<c:forEach var="f" items="${filmList}">
					<div>
						<a href="${pageContext.request.contextPath}/on/filmOne?filmId=${f.filmId}"
							 class="btn btn-info">
							${f.title}
						</a>
						&nbsp;
						<a href="${pageContext.request.contextPath}/on/removeFilmActorByActor?filmId=${f.filmId}&actorId=${actor.actorId}" 
							class="btn btn-danger">flim_actor에서 삭제</a>
						<!-- 삭제시 f.filmId & actor.actorId 필요 -->
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
<script>
	// film title검색하는 버턴
	$('#btnSearchFilm').click(function(){
		// 유효성 검사 코드 추가
		$('#formSearchFilm').submit();
	});
	// 출연작(film) 추가하는 버턴
	$('#btnAddFilm').click(function(){
		// 유효성 검사 코드 추가
		$('#formAddFilm').submit();
	});
</script>
</html>