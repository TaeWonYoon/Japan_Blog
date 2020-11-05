<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 작성</title>
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
		integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
		crossorigin="anonymous">	
	
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