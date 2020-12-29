<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String boardHobby = request.getParameter("boardHobby"); 
%>
<%@ include file="/db/DB.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
	<link rel="stylesheet" href="/css/index.css">
	<link rel="stylesheet" href="/css/class.css">	
	<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/>
	<style>
		.container {
			margin-top: 70px;
		}
	</style>
</head>
<body>
<%@ include file="/layout/header.jsp" %>

<div class="container">

	<div class="list-box" style="height:800px;">
		<div class="card">
			<div class="card-header" >
				<a href="<c:url value='/' />board/add.jsp?boardHobby=<%=boardHobby%>" class="btn btn-primary" >등록</a>
			</div><br>
			<div class="card-body">
				<table class="table table-hover" id="foo-table">
					<thead class="thead-dark">
						<tr>
							<th>번호</th>
							<th>취미</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>작성일시</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
<%
try {
	Class.forName(JDBC_DRIVER);
	conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	ResultSet rs = null;
	
	String sql = "SELECT A.BNO, A.ID, A.HOBBY, A.TITLE, A.USER_ID, A.DATE_TIME, A.VIEW_COUNT, B.NICKNAME "; 
	sql += "FROM JP_BOARD AS A ";
	sql += "LEFT JOIN JP_USER AS B ON A.USER_ID = B.ID ";
	sql += "ORDER BY A.BNO DESC;";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	// TB_BOARD 정보 있음
	if (rs != null) {				
		int i = 1;
		while(rs.next()) {
			String bno = rs.getNString("A.BNO");
			String boardId = rs.getNString("A.ID");
			String hobby = rs.getNString("A.HOBBY");
			String title = rs.getNString("A.TITLE");
			String userId = rs.getNString("A.USER_ID");
			String dateTime = rs.getNString("A.DATE_TIME");
			String name = rs.getNString("B.NICKNAME");
			int count = rs.getInt("A.VIEW_COUNT");
			
%>
<% if(boardHobby.equals(hobby)) { %>
						<tr>
							<td><%=bno%></td>
						<%if(hobby.equals("exercise")) {%>
							<td>운동</td>
						<%} if(hobby.equals("taste")) {%>
							<td>맛집</td>
						<%} if(hobby.equals("suda")) {%>
							<td>수다</td>
						<%} %>
							<td><a href="<c:url value='/' />board/view.jsp?board_bno=<%=bno%>&boardHobby=<%=boardHobby%>"><%=title %></a></td>
							<td><%=name%>(<%=userId %>)</td>
							<td><%=dateTime %></td>
							<td><%=count%></td>
						</tr>
<%		
	}
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
<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
<script>
	$(document).ready( function () {
		$("#foo-table").DataTable({
		    order: [[0, 'desc']],
		    ordering: true,
	    });
	} );
</script>
</body>
</html>