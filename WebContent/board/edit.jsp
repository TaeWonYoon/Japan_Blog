<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*" %>
<%
	String board_bno = request.getParameter("board_bno");
%>

<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link rel="stylesheet" href="/css/index.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/class.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/css/bootstrap.min.css">
</head>

<body>
<%@ include file="/db/editDB.jsp" %>
<%@ include file="/layout/header.jsp" %>

<div class="container">
	<div class="edit-box">
	
		<div class="card">
			<div class="card-body">
				<form name="editForm" method="post" action="<c:url value='/' />board/edit">
					<input type="hidden" name="bno" value="<%=board_bno%>">
	    			<div class="form-group">
  							<label>닉네임</label>
  							<input type="text" class="form-control" value="<%=userId%>" disabled>
					</div>
	    			<div class="form-group">
  							<label>제목</label>
  							<input type="text" class="form-control" name="title" value="<%=title%>">
						</div>
						<div class="form-group">
  							<label>내용</label>
  							<textarea class="form-control" rows="10" name="content"><%=content %></textarea>
						</div>
	    		</form>
			</div>
			<div class="card-footer">
				<%--
				<a href="<c:url value='/' />board/view.jsp?id=<%=boardId %>" class="btn btn-primary">뒤로가기</a>
				--%>
				<a href="#" onclick="history.back();" class="btn btn-primary">뒤로가기</a>
				<div class="float-right">
					<button type="button" class="btn btn-warning" id="btnEdit">수정</button>
				</div>
			</div>
		</div>
		
	</div>
</div>
		
<%@ include file="/layout/footer.jsp" %>
		
<%@ include file="/layout/script.jsp" %>
<script>
	$('#btnEdit').on('click', function() {
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
		
		$('form[name="editForm"]').submit();
	});
</script>

</body>

</html>