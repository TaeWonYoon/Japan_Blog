package admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin.do")
public class Admin extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private final String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
	private final String DB_URL = "jdbc:mariadb://jeongps.com:3306/japan_dbsxodnjs456";
	private final String DB_USER = "dbsxodnjs456";
	private final String DB_PASSWORD = "dljeQPcyr0WZUKUS";
	
    public Admin() {
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
		
		int level = Integer.parseInt(request.getParameter("level")); 
		String userId = request.getParameter("userId");
		
		System.out.println(userId+ " = level =" + level);
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			
			String sql;
			sql = "UPDATE JP_USER SET USER_TYPE = ? WHERE ID = ?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, level);
				pstmt.setString(2, userId);
				pstmt.executeUpdate();
			} catch(Exception e) {
				System.out.println("e: " + e.toString());
			}
		} catch(Exception e) {
			System.out.println("e: " + e.toString());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		response.sendRedirect("./admin/admin_sub.jsp");
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int level = Integer.parseInt(request.getParameter("level")); 
		String userId = request.getParameter("userId");
		
		System.out.println(userId+ " = level =" + level);
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			
			String sql;
			sql = "UPDATE JP_USER SET USER_TYPE = ? WHERE ID = ?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, level);
				pstmt.setString(2, userId);
				pstmt.executeUpdate();
			} catch(Exception e) {
				System.out.println("e: " + e.toString());
			}
		} catch(Exception e) {
			System.out.println("e: " + e.toString());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		response.sendRedirect("./admin/admin.jsp");
	}

}
