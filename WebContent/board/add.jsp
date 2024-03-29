<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	String boardHobby = request.getParameter("boardHobby");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ブログ作成</title>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="/css/bootstrap.min.css">	
	
</head>
<body>
<%@ include file="/layout/header.jsp" %>
<% if(id == null || id.equals("")) {
	out.println("<script>");
	out.println("alert('ログインしてから登録してください。')");
	out.println("history.back()");
	out.println("</script>");
}	%>
<div class="container">
<br>
	<div class="add-box" style="height:700px;">
		<div class="card">
			<div class="card-body">
				<form name="addForm" method="post" action="<c:url value='/' />board/add" enctype="multipart/form-data">
				<input type="hidden" name="id" value="<%=id%>"/>
				<input type="hidden" name="boardHobby" value="<%=boardHobby%>"/>
	    			<div class="form-group">
  						<label>分野</label>
  						<select name="hobby" id="hobby">
  							<option value="">全体</option>
  							<option value="exercise">スポーツ</option>
  							<option value="taste">グルメ</option>
  							<option value="suda">おしゃべり</option>
  						</select>
					</div>
	    			<div class="form-group">
  						<label>タイトル</label>
  						<input type="text" class="form-control" name="title">
					</div>
					<div class="form-group">
  						<label>内容</label>
  						<textarea class="form-control" rows="10" name="content"></textarea>
					</div>
					<div class="form-group">
					<label>添付ファイル: <input type="file" name="img" multiple="multiple" class=""></label>
	    			</div>
	    		</form>
			</div>
			<div class="card-footer">
				<button id="btnL" class="btn btn-primary">目録</button>
				<div class="float-right">
					<button type="button" class="btn btn-success" id="btnAdd">登録</button>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/layout/script.jsp" %>
<%@ include file="/layout/footer.jsp" %>

<script>
	$('#btnL').on('click',function() {
		history.back();
	});
	
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