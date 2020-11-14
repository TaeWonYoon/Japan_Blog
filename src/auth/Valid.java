package auth;

import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

/**
 * Servlet implementation class Valid
 */
@WebServlet("/valid")
public class Valid extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
	private final String DB_URL = "jdbc:mariadb://jeongps.com:3306/japan_dbsxodnjs456";
	private final String DB_USER = "dbsxodnjs456";
	private final String DB_PASSWORD = "dljeQPcyr0WZUKUS";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Valid() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
        
		String id = request.getParameter("id");
		
		Boolean idCorrect = false;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		JSONObject data = new JSONObject();
		
		try {
			int row = 0;
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			
			String sql;
			String id2 = null;
			sql = "SELECT * FROM JP_USER WHERE ID=? LIMIT 1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				id2 = rs.getNString("ID");
			}
			if(id.equals(id2)) {
				System.out.println("아이디가 중복");
				data.put("data", "valid");
			}
			else {
				System.out.println("아이디 없음");
				data.put("data", "invalid");
			}
			rs.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("e: " + e.toString());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn !=null) {
					conn.close();
				}
					
			} catch(SQLException e) {
				System.out.println("e: " + e.toString());
			}
			
			try {
				if (conn != null) {
					conn.close();
				}
			} catch(SQLException e) {
				System.out.println("e: " + e.toString());
			}
		}
		
		
		
		if (idCorrect) {			
	        	        
		} else {
	        
		}
		
		response.getWriter().println(data);
						
	}		

}
