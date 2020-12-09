<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	try {

	Class.forName(JDBC_DRIVER);
	conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	ResultSet rs = null;
	String sql = "SELECT * FROM JP_COMMENT WHERE COMMENT_BNO = ? AND BOARD_ID = ?;";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, bno);
	pstmt.setString(2, postId);
	rs = pstmt.executeQuery();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	while (rs.next()) {
		String ctContents = rs.getString("COMMENT");
		String ctId = rs.getString("LOGIN_ID");
		//Date date = rs.getTimestamp("DATE");
		String date = sdf.format(rs.getTimestamp("DATE"));
		
		int i = 1;
		
%>
<tr>
	<td><%=i%></td>
	<td><%=ctContents%></td>
	<td><%=ctId%></td>
	<td><%=date %></td>
</tr>
<%
	i++;
}
rs.close();
pstmt.close();
conn.close();
} catch (Exception e) {
System.out.println("e: " + e.toString());
} finally {
pstmt.close();
conn.close();
}
%>