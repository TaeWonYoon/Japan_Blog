<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
//mariadb 연결정보
String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
String DB_URL = "jdbc:mariadb://jeongps.com:3306/japan_dbsxodnjs456";
String DB_USER = "dbsxodnjs456";
String DB_PASSWORD = "dljeQPcyr0WZUKUS";

String title = "";
String userId = "";
String dateTime = "";
String content = "";

Connection conn = null;
Statement state = null;
PreparedStatement pstmt = null;

try {
	Class.forName(JDBC_DRIVER);
	conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	state = conn.createStatement();
	ResultSet rs = null;
	
	String sql = "SELECT * FROM JP_BOARD WHERE BNO = ? limit 1";
	pstmt = conn.prepareStatement(sql);
	pstmt.setNString(1, board_bno);
	rs = pstmt.executeQuery();
	
	// JP_BOARD 정보 있음
	if (rs != null) {	
		while(rs.next()) {	
			title = rs.getNString("TITLE");
			userId = rs.getNString("USER_ID");
			dateTime = rs.getNString("DATE_TIME");
			content = rs.getNString("CONTENT");
		}
	}
	
	rs.close();
	state.close();
	conn.close();
} catch(Exception e) {
	System.out.println("e: " + e.toString());
} finally {
	state.close();
	conn.close();
}
%>