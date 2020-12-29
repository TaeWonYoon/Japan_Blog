<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="./upload2.do" method="post" enctype="multipart/form-data">
		<label>첨부파일: <input type="file" name="img" multiple="multiple"></label>
		 
		<br>
		<input type="submit" value="전송" />
		<input type="reset" value="reset" />
	</form>
	<%@ include file="db/DB.jsp"%>
	<%
	String img = "";
                           	try {
	                           	Class.forName(JDBC_DRIVER);
	                        	conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	                        	ResultSet rs = null;
	                        	String sql = "SELECT * FROM UPLOAD"; 
	                        	pstmt = conn.prepareStatement(sql);
	                        	rs = pstmt.executeQuery();
	                        	while(rs.next()) {
	                        		img = rs.getNString("IMG");
							%>
                           	<%	
	                        	}
	                        	rs.close();
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
	<div><%=img%></div>
</body>
</html>