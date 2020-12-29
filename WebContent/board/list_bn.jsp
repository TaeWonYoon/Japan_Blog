<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String boardbn = request.getParameter("boardbn"); 
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
					<input type="hidden" id="boardbn" value="<%=boardbn%>" />
<%
                           	try {
	                           	Class.forName(JDBC_DRIVER);
	                        	conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	                        	ResultSet rs = null;
	                        	String sql = "SELECT * FROM JP_BOARD ORDER BY VIEW_COUNT DESC"; 
	                        	pstmt = conn.prepareStatement(sql);
	                        	rs = pstmt.executeQuery();
	                        	int i =1;
	                        	while(rs.next()) {
	                        		String title = rs.getNString("TITLE");
	                        		String userId = rs.getNString("USER_ID");
	                        		String date = rs.getNString("DATE_TIME");
	                        		String hobby = rs.getNString("HOBBY");
	                        		int count = rs.getInt("VIEW_COUNT");
	                        		int bno = rs.getInt("BNO");
							%>
							<%
								String hobbys = "";
								if(hobby.equals("exercise")) { hobbys = "운동"; } 
								else if(hobby.equals("taste")) {hobbys = "맛집"; }
								else { hobbys = "수다"; }
							%>
                           		<tr>
                           			<td><%=i %></td>
                           			<td><%=hobbys %></td>
                           			<td><a href="<c:url value='/' />board/view.jsp?board_bno=<%=bno%>&boardHobby=<%=hobby%>"><%=title %></a></td>
                           			<td><%=userId %></td>
                           			<td><%=date %></td>
                           			<td><%=count %></td>
                           		</tr>
                           	<%	
                           		i++;
	                        	}
	                        	rs.close();
	                           	conn.close();
	                       		pstmt.close();
                           	} catch(Exception e) {
                           		e.printStackTrace();
                           	} finally {
                           		if(conn != null) {
                           		conn.close();
                           		}
                           		if(pstmt != null) {
	                       		pstmt.close();
                           		}
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
		if($('#boardbn').val() == "best") {
			$("#foo-table").DataTable({
			    order: [[5, 'desc']],
			    ordering: true,
		    });
		} else {
			$("#foo-table").DataTable({
			    order: [[4, 'desc']],
			    ordering: true,
		    });
		}
	} );
</script>
</body>
</html>