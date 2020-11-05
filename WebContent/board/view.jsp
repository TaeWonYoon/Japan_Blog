<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String boardId = request.getParameter("board_id");

//mariadb 연결정보
String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
String DB_URL = "jdbc:mariadb://jeongps.com:3306/japan_dbsxodnjs456";
String DB_USER = "dbsxodnjs456";
String DB_PASSWORD = "dljeQPcyr0WZUKUS";

String title = "";
String userId = "";
String dateTime = "";
String name = "";
String content = "";

String commnetId = "";
String commentContent = "";
String commentUserId = "";
String commentDateTime = "";
String commentNickname = "";

Connection conn = null;
PreparedStatement pstmt = null;

try {
	Class.forName(JDBC_DRIVER);
	conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	ResultSet rs = null;
	
	// 닉네임을 가지고 오기 위한 JP_BOARD, JP_USER 조인
	String sql = "SELECT B.ID, B.TITLE, B.USER_ID, B.DATE_TIME, B.CONTENT, U.NICKNAME "; 
	sql += "FROM JP_BOARD AS B ";
	sql += "LEFT JOIN JP_USER AS U ON B.USER_ID = U.ID ";
	sql += "WHERE B.ID=? LIMIT 1;";
	pstmt = conn.prepareStatement(sql);
	pstmt.setNString(1, boardId);
	rs = pstmt.executeQuery();
	
	// JP_BOARD 정보 있음
	if (rs != null) {	
		while(rs.next()) {		
			title = rs.getNString("B.TITLE");
			userId = rs.getNString("B.USER_ID");
			dateTime = rs.getNString("B.DATE_TIME");
			name = rs.getNString("U.NICKNAME");
			content = rs.getNString("B.CONTENT");
		}
	}
	rs.close();
	pstmt.close();
	conn.close();
} catch(Exception e) {
	System.out.println("e: " + e.toString());
} finally {
	pstmt.close();
	conn.close();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>

<!-- Bootstrap CSS -->
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
		integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
		crossorigin="anonymous">	
		
	<link rel="stylesheet" href="/css/index.css">
	<link rel="stylesheet" href="/css/class.css">
	
	<style>
		body {
			margin-top: 70px;
		}
	</style>
		
</head>
<body>
<%@ include file="/layout/header.jsp" %>
<div class="container">

	<div class="view-box">
		<!-- 글 내용 -->
		<div class="card">
			<div class="card-header"><%=title %></div>
			<div class="card-body">
				<p class="card-title"><%=name %> <%=dateTime %></p>
				<p class="card-text"><%=content %></p>
			</div>
			<div class="card-footer">
				<a href="<c:url value='/' />board/list.jsp" class="btn btn-primary">목록</a>
				<div class="float-right">
					<a href="<c:url value='/' />board/edit.jsp?board_id=<%=boardId %>" class="btn btn-warning">수정</a>
					<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteModal">삭제</button>
				</div>
			</div>
		</div>
		
		<!-- 댓글 -->
		<div class="card" style="margin-top:20px;">
			<div class="card-body">
				<div>
					<table class="table" style="margin-bottom:0;">
						<thead>
							<tr>
								<th style="width:7%;">번호</th>
								<th style="width:70%;">내용</th>
								<th style="width:13%;">작성자</th>
								<th style="width:10%;">작성일시</th>
							</tr>
						</thead>
						<tbody>
						<% 
						try {
							Class.forName(JDBC_DRIVER);
							conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
							ResultSet rs = null;
							
							// 댓글 정보를 가지고 오기 위한 JP_COMMENT, JP_BOARD, JP_USER 조인
							String sql = "SELECT C.COMMENT_ID, C.CONTENT, C.BOARD_ID, C.USER_ID, C.DATE_TIME, U.NICKNAME "
									+ "FROM JP_COMMENT AS C "
									+ "INNER JOIN JP_BOARD AS B ON C.BOARD_ID = B.ID "
									+ "INNER JOIN JP_USER AS U ON C.USER_ID = U.ID "
									+ "WHERE B.ID = ?;";
							pstmt = conn.prepareStatement(sql);
							pstmt.setNString(1, boardId);
							rs = pstmt.executeQuery();
							
							// JP_COMMENT 정보 있음
							if(rs != null) {
								int i = 1;
								while(rs.next()) {
									commnetId = rs.getNString("C.COMMENT_ID");
									commentContent = rs.getNString("C.CONTENT");
									commentUserId = rs.getNString("C.USER_ID");
									commentDateTime = rs.getNString("C.DATE_TIME");
									commentNickname = rs.getNString("U.NICKNAME");
							%>
							<tr>
								<td><%=i %></td>
								<td><%=commentContent %></td>
								<td><%=commentNickname %>(<%=commentUserId %>)</td>
								<td><%=commentDateTime %></td>
							</tr>
						<%
								i++;
								}
							}
							
							// JP_COMMENT 정보 없음
							else {
						%>
							<tr>
								<td colspan="4" class="text-center">등록된 댓글이 없습니다.</td>
							</tr>
						<%
							}
							rs.close();
							pstmt.close();
							conn.close();
						} catch(Exception e) {
							System.out.println("e: " + e.toString());
						} finally {
							pstmt.close();
							conn.close();
						}
						%>
							
						</tbody>
					</table>			
				</div>
			</div>
			<div class="card-footer">
			  <form name="commentAddForm" method="post" action="<c:url value='/' />comment/add">
			  <input type="hidden" name="board_id" value="<%=boardId%>">
				<div class="input-group mb-3">
				  <input type="text" class="form-control" placeholder="댓글을 입력하세요." name="comment_content">
				  <div class="input-group-append">
				    <button class="btn btn-outline-primary" type="button" id="btnCommentAdd">등록</button>
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
				<h5 class="modal-title text-danger">게시글 삭제</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p class="text-danger">삭제된 내용은 복구가 불가능합니다. 정말삭제할까요?</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-danger" id="btnDelete">삭제</button>				
			</div>
		</div>
	</div>
</div>

<form id="deleteForm" method="post" action="<c:url value='/' />board/delete">
	<input type="hidden" name="board_id" value="<%=boardId%>">
</form>

<%@ include file="/layout/script.jsp" %>
<%@ include file="/layout/footer.jsp" %>
		
<script>
	$('#btnDelete').on('click', function() {
		$('#deleteForm').submit();
	});
	
	$('#btnCommentAdd').on('click', function() {
		if (!$('input[name="comment_content"]').val()) {
			alert('댓글 내용을 입력해주세요');
			$('input[name="comment_content"]').focus();
			return false;
		}
		
		$('form[name=commentAddForm]').submit();
	});
</script>
</body>
</html>