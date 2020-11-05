<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Random" %> 
<%@ page import="java.util.Date" %> 
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%

//mariadb 연결정보
String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
String DB_URL = "jdbc:mariadb://jeongps.com:3306/japan_dbsxodnjs456";
String DB_USER = "dbsxodnjs456";
String DB_PASSWORD = "dljeQPcyr0WZUKUS";

Connection conn = null;
PreparedStatement pstmt = null;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>

<!-- Bootstrap CSS -->
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
		integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
		crossorigin="anonymous">
		
	<link rel="stylesheet" href="/css/index.css">
	<link rel="stylesheet" href="/css/class.css">	
	
	<style>
		.container {
			margin-top: 70px;
		}
	</style>
</head>
<body>
<%@ include file="/layout/header.jsp" %>

<div class="container">

	<div class="list-box">
		<div class="card">
			<div class="card-header">
				<a href="<c:url value='/' />board/add.jsp" class="btn btn-primary">등록</a>
			</div>
			<div class="card-body">
				<table class="table table-hover">
					<thead class="thead-dark">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>작성일시</th>
						</tr>
					</thead>
					<tbody>
<%
try {
	Class.forName(JDBC_DRIVER);
	conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	ResultSet rs = null;
	
	String sql = "SELECT A.ID, A.TITLE, A.USER_ID, A.DATE_TIME, B.NICKNAME "; 
	sql += "FROM JP_BOARD AS A ";
	sql += "LEFT JOIN JP_USER AS B ON A.USER_ID = B.ID ";
	sql += "ORDER BY A.ID DESC;";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	// TB_BOARD 정보 있음
	if (rs != null) {				
		int i = 1;
		while(rs.next()) {		
			String boardId = rs.getNString("A.ID");
			String title = rs.getNString("A.TITLE");
			String userId = rs.getNString("A.USER_ID");
			String dateTime = rs.getNString("A.DATE_TIME");
			String name = rs.getNString("B.NICKNAME");
%>
						<tr>
							<td><%=i %></td>
							<td><a href="<c:url value='/' />board/view.jsp?board_id=<%=boardId%>"><%=title %></a></td>
							<td><%=name %>(<%=userId %>)</td>
							<td><%=dateTime %></td>
						</tr>
<%		
			i++;
		}
	} 
	
	// TB_BOARD 정보 없음
	else {
%>
						<tr>
							<td colspan="4" class="text-center">등록된 글이 없습니다.</td>
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
	</div>
			
</div>	

<%@ include file="/layout/script.jsp" %>
<%@ include file="/layout/footer.jsp" %>

</body>
</html>