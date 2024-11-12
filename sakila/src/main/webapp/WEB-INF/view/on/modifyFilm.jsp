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
			<h1>MODIFY Film</h1>
			<table class="table">
				<tr>
					<td>title</td>
					<td>
						<form id="formTitle" action="${pageContext.request.contextPath}/on/modifyFilm"
								method="post">
							<input type="hidden" name="filmId" value="${film.filmId}">
							<input type="text" value="${film.title}" 
									name="title" id="title"> 
							<button type="button" id="btnTitle">title 수정</button>
						</form>
					</td>
				</tr>
				
				<tr>
					<td>description</td>
					<td>
						<form id="formDescription" action="${pageContext.request.contextPath}/on/modifyFilm"
								method="post">
							<input type="hidden" name="filmId" value="${film.filmId}">
							<input type="text" value="${film.description}" 
									name="description" id="description"> 
							<button type="button" id="btnDescription">description 수정</button>
						</form>
					</td>
				</tr>
				<tr>
					<td>releaseYear</td>
					<td>
						<form id="formReleaseYear" action="${pageContext.request.contextPath}/on/modifyFilm"
								method="post">
							<input type="hidden" name="filmId" value="${film.filmId}">
							<input type="text" value="${film.releaseYear}" 
									name="releaseYear" id="releaseYear"> 
							<button type="button" id="btnReleaseYear">releaseYear 수정</button>
						</form>
					</td>
				</tr>
				<tr>
					<td>languageId</td>
					<td>
						<form id="formLanguageId" action="${pageContext.request.contextPath}/on/modifyFilm"
								method="post">
							<input type="hidden" name="filmId" value="${film.filmId}">
							<input type="text" value="${film.language}" 
									name="languageId" id="languageId"> 
							<button type="button" id="btnLanguageId">languageId 수정</button>
						</form>
					</td>
				</tr>
				<tr>
					<td>originalLanguageId</td>
					<td>
						<form id="formOriginalLanguageId" action="${pageContext.request.contextPath}/on/modifyFilm"
								method="post">
							<input type="hidden" name="filmId" value="${film.filmId}">
							<input type="number" value="${film.originalLanguageId}" 
									name="originalLanguageId" id="originalLanguageId"> 
							<button type="button" id="btnOriginalLanguageId">originalLanguageId 수정</button>
						</form>
					</td>
				</tr>
				<tr>
					<td>rentalDuration</td>
					<td>
						<form id="formRentalDuration" action="${pageContext.request.contextPath}/on/modifyFilm"
								method="post">
							<input type="hidden" name="filmId" value="${film.filmId}">
							<input type="text" value="${film.rentalDuration}" 
									name="rentalDuration" id="rentalDuration"> 
							<button type="button" id="btnRentalDuration">rentalDuration 수정</button>
						</form>
					</td>
				</tr>
				<tr>
					<td>rentalRate</td>
					<td>
						<form id="formRentalRate" action="${pageContext.request.contextPath}/on/modifyFilm"
								method="post">
							<input type="hidden" name="filmId" value="${film.filmId}">
							<input type="text" value="${film.rentalRate}" 
									name="rentalRate" id="rentalRate"> 
							<button type="button" id="btnRentalRate">rentalRate 수정</button>
						</form>
					</td>
				</tr>
				<tr>
					<td>length</td>
					<td>
						<form id="formLength" action="${pageContext.request.contextPath}/on/modifyFilm"
								method="post">
							<input type="hidden" name="filmId" value="${film.filmId}">
							<input type="text" value="${film.length}" 
									name="length" id="length"> 
							<button type="button" id="btnLength">length 수정</button>
						</form>
					</td>
				</tr>
				<tr>
					<td>replacementCost</td>
					<td>
						<form id="formReplacementCost" action="${pageContext.request.contextPath}/on/modifyFilm"
								method="post">
							<input type="hidden" name="filmId" value="${film.filmId}">
							<input type="text" value="${film.replacementCost}" 
									name="replacementCost" id="replacementCost"> 
							<button type="button" id="btnReplacementCost">replacementCost 수정</button>
						</form>
					</td>
				</tr>
				<tr>
					<td>rating</td>
					<td>
						<form id="formRating" action="${pageContext.request.contextPath}/on/modifyFilm"
								method="post">
							<input type="hidden" name="filmId" value="${film.filmId}">
							<input type="text" value="${film.rating}" 
									name="rating" id="rating"> 
							<button type="button" id="btnRating">rating 수정</button>
						</form>
					</td>
				</tr>
				<tr>
					<td>specialFeatures</td>
					<td>
						<form id="formSpecialFeatures" action="${pageContext.request.contextPath}/on/modifyFilm"
								method="post">
							<input type="hidden" name="filmId" value="${film.filmId}">
							<input type="text" value="${film.specialFeatures}" 
									name="specialFeatures" id="specialFeatures"> 
							<button type="button" id="btnSpecialFeatures">specialFeatures 수정</button>
						</form>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
<script>
	$('#btnTitle').click(function(){
		if($('#title').val() == '') {
			alert('수정할 title을 입력하세요');
		} else {
			$('#formTitle').submit();
		}
	});
	
	$('#btnDescription').click(function(){
		if($('#description').val() == '') {
			alert('수정할 description을 입력하세요');
		} else {
			$('#formDiscription').submit();
		}
	});
	$('#btnReleaseYear').click(function(){
		if($('#releaseYear').val() == '') {
			alert('수정할 releaseYear을 입력하세요');
		} else {
			$('#formReleaseYear').submit();
		}
	});
	$('#btnLanguageId').click(function(){
		if($('#languageId').val() == '') {
			alert('수정할 languageId을 입력하세요');
		} else {
			$('#formLanguageId').submit();
		}
	});
	$('#btnOriginalLanguageId').click(function(){
		if($('#originalLanguageId').val() == '') {
			alert('수정할 originalLanguageId을 입력하세요');
		} else {
			$('#formOriginalLanguageId').submit();
		}
	});
	$('#btnRentalDuration').click(function(){
		if($('#rentalDuration').val() == '') {
			alert('수정할 rentalDuration을 입력하세요');
		} else {
			$('#formRentalDuration').submit();
		}
	});
	$('#btnRentalRate').click(function(){
		if($('#rentalRate').val() == '') {
			alert('수정할 rentalRate을 입력하세요');
		} else {
			$('#formRentalRate').submit();
		}
	});
	$('#btnDescription').click(function(){
		if($('#description').val() == '') {
			alert('수정할 description을 입력하세요');
		} else {
			$('#formDiscription').submit();
		}
	});
	$('#btnLength').click(function(){
		if($('#length').val() == '') {
			alert('수정할 length을 입력하세요');
		} else {
			$('#formLength').submit();
		}
	});
	$('#btnReplacementCost').click(function(){
		if($('#replacementCost').val() == '') {
			alert('수정할 replacementCost을 입력하세요');
		} else {
			$('#formReplacementCost').submit();
		}
	});
	$('#btnRating').click(function(){
		if($('#rating').val() == '') {
			alert('수정할 rating을 입력하세요');
		} else {
			$('#formRating').submit();
		}
	});
	$('#btnSpecialFeatures').click(function(){
		if($('#specialFeatures').val() == '') {
			alert('수정할 specialFeatures을 입력하세요');
		} else {
			$('#formSpecialFeatures').submit();
		}
	});
</script>


</html>