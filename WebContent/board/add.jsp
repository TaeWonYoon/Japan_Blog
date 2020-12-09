<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 작성</title>
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="/css/bootstrap.min.css">	
	<style>
		body {
			margin-top: 70px;
		}
	</style>
</head>
<body>
<%@ include file="/layout/header.jsp" %>
<div class="container">
	<div class="add-box">
	
		<div class="card">
			<div class="card-body">
				<form name="addForm" method="post" action="<c:url value='/' />board/add">
				<input type="hidden" name="id" value="<%=id%>"/>
	    			<div class="form-group">
  						<label>분야</label>
  						<select name="hobby" id="hobby">
  							<option value="">전체</option>
  							<option value="운동">운동</option>
  							<option value="맛집">맛집</option>
  						</select>
					</div>
	    			<div class="form-group">
  						<label>제목</label>
  						<input type="text" class="form-control" name="title">
					</div>
					<div class="form-group">
  						<label>내용</label>
  						<textarea class="form-control" rows="10" name="content"></textarea>
					</div>
	    		</form>
			</div>
			<div class="card-footer">
				<a href="<c:url value='/' />board/list.jsp" class="btn btn-primary">목록</a>
				<div class="float-right">
					<button type="button" class="btn btn-success" id="btnAdd">등록</button>
				</div>
			</div>
		</div>
		
	</div>
</div>

<%@ include file="/layout/script.jsp" %>
<%@ include file="/layout/footer.jsp" %>

<script>

	
	$('#btnAdd').on('click', function() {
		if($('#hobby').val() == "") {
			alert('분야를 선택해주세요');
			return false;
		}
		if (!$('input[name="title"]').val()) {
			alert('제목을 입력해주세요');
			$('input[name="title"]').focus();
			return false;
		}
		
		if (!$('textarea[name="content"]').val()) {
			alert('내용을 입력해주세요');
			$('textarea[name="content"]').focus();
			return false;
		}
		
		$('form[name=addForm]').submit();
	});
	
</script>
	
</body>
</html>