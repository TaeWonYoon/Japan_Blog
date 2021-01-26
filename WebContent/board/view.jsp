<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	String board_bno = request.getParameter("board_bno");
	String boardHobby = request.getParameter("boardHobby");
%>

<%@ include file="/db/viewDB.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>

<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/index.css">
	<link rel="stylesheet" href="/css/class.css">
	<style>
	#comment_d:hover {
		background: #e6e6e6;
	}
	</style>
</head>
<body>
<%@ include file="/layout/header.jsp" %>
<br><br><br>
<div class="container">

	<div class="view-box" style="height:900px;">
		<!-- 글 내용 -->
		<div class="card">
			<div class="card-header"><%=title %></div>
			<div class="card-body">
				<div class="text-right"><p class="card-title">글쓴이 : <%=name %>(<%=postId%>)<br><%=dateTime %></p></div><hr/><br><br>
				<% if(img != null) { %>
				<div class="text-center"><img src="../upload/<%=img %>" width="300" height="300" alt="이미지 없음"></div>
				<%} %><br>
				<p class="card-text"><%=content %></p>
			</div>
			<div class="card-footer">
				<a href="<c:url value='/' />board/list.jsp?boardHobby=<%=boardHobby%>" class="btn btn-primary">目録</a>
				<% if(postId.equals(id)) { %>
				<div class="float-right">
					<a href="<c:url value='/' />board/edit.jsp?board_bno=<%=board_bno%>" class="btn btn-warning">修整</a>
					<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteModal">削除</button>
				</div>
			<% } %>
			</div>
		</div>
		
		<!-- 댓글 -->
		<div class="card" style="margin-top:20px;">
			<div class="card-body">
				<div>
					<table class="table" style="margin-bottom:0;">
						<thead>
							<tr>
								<th style="width:8%;">番号</th>
								<th style="width:55%;">内容</th>
								<th style="width:12%;">作成者</th>
								<th style="width:16%;">作成日時</th>
								<th style="width:15%;">削除</th>
							</tr>
						</thead>
						<tbody>
						<%@ include file="/board/comment.jsp" %>
						</tbody>
					</table>			
				</div>
			</div>
			<div class="card-footer" >
			  <form name="commentAddForm" method="post" action="<c:url value='/' />board/coment" id="comment_submit">
			  <input type="hidden" name="postId" value="<%=postId%>">
			  <input type="hidden" name="bno" value="<%=board_bno%>">
				<div class="input-group mb-3">
				  <input type="text" class="form-control" placeholder="コメントを入力してください。" name="comment_content">
				  <div class="input-group-append">
				    <button class="btn btn-outline-primary" type="button" id="btnCommentAdd">登録</button>
				    <input type="hidden" id="cmt" value="<%=id%>" >
				  </div>
				</div>
		  	  </form>
			</div>
		</div>

</div>

<div class="modal" tabindex="-1" id="deleteModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title text-danger">削除</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p class="text-danger" >削除された内容は復旧できません。 本当に削除しましょうか？</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-dismiss="modal">キャンセル</button>
				<button type="button" class="btn btn-danger" id="btnDelete">削除</button>				
			</div>
		</div>
	</div>
</div>

</div>
<form id="deleteForm" method="post" action="<c:url value='/' />board/delete">
	<input type="hidden" name="bno" value="<%=bno%>">
	<input type="hidden" name="boardHobby" value="<%=boardHobby%>">
</form>
<form id="comment_delete" method="get" action="<c:url value='/' />board/delete">
	<input type="hidden" name="bno" value="<%=bno%>">
	<input type="hidden" name="bno_comment" value="<%=bno_comment%>">
	<input type="hidden" name="boardHobby" value="<%=boardHobby%>">
</form>
<br><br><br><br>
<%@ include file="/layout/script.jsp" %>
<%@ include file="/layout/footer.jsp" %>
		
<script>
	
	$('#c_delete').on('click', function() {
		if(confirm('コメントを消しますか')) {
			alert('コメントを消しました');
			$('#comment_delete').submit();
		}
		
	});
	$('#btnDelete').on('click', function() {
		$('#deleteForm').submit();
	});
	
	console.log($('#cmtId').val());
	$('#btnCommentAdd').on('click', function() {
		
		if (!$('input[name="comment_content"]').val()) {
			alert('コメントを入力してください');
			$('input[name="comment_content"]').focus();
			return false;
		}
		if($('#cmt').val() == null || $('#cmt').val() == "") {
			alert('ログインしてから登録してください');
			return false;
		}
		$('#comment_submit').submit();
	});
</script>
</body>
</html>