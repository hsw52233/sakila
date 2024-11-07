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
			<h1>ACTOR FILE ADD</h1>
			
			<div>${msg}</div>
			
			<form id="formAddActorFile" 
				  method="post" enctype="multipart/form-data"
				  action="${pageContext.request.contextPath}/on/addActorFile">
				  
				<table class="table">
					<tr>
						<td>actorId</td>
						<td>
							<input type="text" name="actorId" value="${actorId}" readonly>
						</td>
					</tr>
					<tr>
						<td>file</td>
						<td>
							<div id="fileDiv">
								<button type="button" id="btnAddFile">파일폼 추가</button>
								<button type="button" id="btnRemoveFile">파일폼 삭제</button>
								<input type="file" name="actorFile" class="actorFile">
							</div>
						</td>
					</tr>
				</table>
				<button id="btnAddActorFile" type="button">액터파일추가</button>
			
			</form>
		</div>
	</div>
</body>
<script>
	$('#btnAddActorFile').click(function(){
		if($('.actorFile').length == 0) {
			alert('첨부할 파일이 없습니다');
		} else if($('.actorFile').last().val() == '') {
			alert('첨부되지 않은 파일이 있습니다');
		} else {
			$('#formAddActorFile').submit();
		}
	});

	$('#btnAddFile').click(function() {
		if($('.actorFile').last().val() == '') { // 마지막 input=file값이 공백이라면
			alert('첨부하지않은 파일이 이미 존재합니다');
		} else {
			let html = '<input type="file" name="actorFile" class="actorFile">';
			$('#fileDiv').append(html);
		}
	});
	
	$('#btnRemoveFile').click(function(){
		if($('.actorFile').length == 0) { // class="actorFile" 없다
			alert('삭제할 빈 input=file이 존재하지 않습니다');
		} else {
			$('.actorFile').last().remove();
		}
	});
</script>
</html>