<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
                           	try {
	                           	Class.forName(JDBC_DRIVER);
	                        	conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	                        	ResultSet rs = null;
	                        	String sql = "SELECT * FROM JP_BOARD ORDER BY VIEW_COUNT DESC LIMIT 5"; 
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