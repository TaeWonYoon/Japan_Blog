<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/db/DB.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/css/index.css">
	<link rel="stylesheet" href="/css/header.css">
	<link rel="stylesheet" href="/css/class.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/>
</head>
<body>

	<%@ include file="/layout/header.jsp" %>
	<% if(level != 5) {
		out.println("<script>");
		out.println("alert('관리자가 아닙니다.')");
		out.println("history.back();");
		out.println("</script>");
	}%>
    <div class="container">
        <div class="list-box" style="height:900px;">
            <div class="card">
                
                <div class="card-body">
                    <table class="table table-bordered" id="foo-table">
                        <colgroup>
                        </colgroup>
                        <thead class="table-primary">
                            <tr>
                                <th>等級</th>
                                <th>アイディ</th>
                                <th>名前</th>
                                <th style="width:15px;">メール</th>
                                <th>修整</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
try {
	Class.forName(JDBC_DRIVER);
	conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	ResultSet rs = null;
	
	String sql = "SELECT * FROM JP_USER WHERE USER_TYPE < 5";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	// TB_BOARD 정보 있음

		while(rs.next()) {
			String userId = rs.getNString("ID");
			String name = rs.getNString("NAME");
			String email = rs.getNString("EMAIL");
			int userType = rs.getInt("USER_TYPE");
			
%>
						<tr>
							<td>
							<form action="<c:url value='/' />admin.do"  method="post">
								<select name="level" id="" style="width:80px;">
					
                    <% if(userType == 4) {%>
                    					<option value="1" size="4">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4" selected>4</option>
                                      <% } %>
                    <% if(userType == 3) {%>
                    					<option value="1" size="4">1</option>
                                        <option value="2">2</option>
                                        <option value="3" selected>3</option>
                                        <option value="4" selected>4</option>
                                      <% } %>
                    <% if(userType == 2) {%>
                    					<option value="1" size="4">1</option>
                                        <option value="2" selected>2</option>
                                        <option value="3">3</option>
                                        <option value="4" >4</option>
                                      <% } %>
                   <% if(userType == 1) {%>
                    					<option value="1" size="4" selected>1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4" >4</option>
                                      <% } %>
                                </select>
								
							</td>
							<td><input name="userId" id="" value="<%=userId%>" style="border:none;"  readonly></td>
							<td><input name="" id="" value="<%=name%>" style="border:none;"  readonly></td>
							<td><input name="" id="" value="<%=email%>" style="border:none;"  readonly></td>
							<td><button>修整</button></td>
							</form>
							
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
    <%@ include file="/layout/footer.jsp" %>
    <script src="/js/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
    <script>
    
    $(document).ready( function () {
        $("#foo-table").DataTable();
	});
    
    $('#submit').click(function() {
    	alert('asd');
    })
    </script>
</body>
</html>