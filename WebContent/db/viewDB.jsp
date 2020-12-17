<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/db/DB.jsp" %>    
<% 
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
String postId = "";

int count = 0;
int bno = Integer.parseInt(request.getParameter("board_bno"));

try {
	Class.forName(JDBC_DRIVER);
	conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	ResultSet rs = null;
	
	// 닉네임을 가지고 오기 위한 JP_BOARD, JP_USER 조인
	String sql = "SELECT B.BNO, B.TITLE, B.ID, B.DATE_TIME, B.CONTENT, B.VIEW_COUNT, U.NICKNAME "; 
	sql += "FROM JP_BOARD AS B ";
	sql += "LEFT JOIN JP_USER AS U ON B.USER_ID = U.ID ";
	sql += "WHERE B.BNO=? LIMIT 1;";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, bno);
	rs = pstmt.executeQuery();
	
	// JP_BOARD 정보 있음
	if (rs != null) {	
		while(rs.next()) {
			title = rs.getNString("B.TITLE");
			dateTime = rs.getNString("B.DATE_TIME");
			name = rs.getNString("U.NICKNAME");
			content = rs.getNString("B.CONTENT");
			count = rs.getInt("B.VIEW_COUNT");
			bno = rs.getInt("B.BNO");
			postId = rs.getString("B.ID");
		}
	}
	String sql2 = "UPDATE JP_BOARD SET VIEW_COUNT = ? WHERE BNO = ?";
	pstmt = conn.prepareStatement(sql2);
	pstmt.setInt(1, count+1);
	pstmt.setInt(2, bno);
	pstmt.executeUpdate();
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