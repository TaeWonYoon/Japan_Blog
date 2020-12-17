package board;

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

@WebServlet("/board/delete")
public class BoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// mariadb 연결정보
	private final String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
	private final String DB_URL = "jdbc:mariadb://jeongps.com:3306/japan_dbsxodnjs456";
	private final String DB_USER = "dbsxodnjs456";
	private final String DB_PASSWORD = "dljeQPcyr0WZUKUS";
       
    public BoardDelete() {
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	String bno_comment = request.getParameter("bno_comment");
    	String bno = request.getParameter("bno");
    	String boardHobby = request.getParameter("boardHobby");
    	Connection conn = null;
		Statement state = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			state = conn.createStatement();
			
			String sql;
			sql = "DELETE FROM JP_COMMENT WHERE BNO_COMMENT=? LIMIT 1;";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bno_comment);
				pstmt.executeUpdate();
			} catch(Exception e) {
				System.out.println("e: " + e.toString());
			}
		} catch(Exception e) {
			System.out.println("e: " + e.toString());
		} finally {
			if (state != null) {
				try {
					state.close();
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
		
		response.sendRedirect("../board/view.jsp?board_bno="+bno+"&boardHobby="+boardHobby);
    
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String bno = request.getParameter("bno");
		String boardHobby = request.getParameter("boardHobby");
		
		Connection conn = null;
		Statement state = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			state = conn.createStatement();
			
			String sql;
			sql = "DELETE FROM JP_BOARD WHERE BNO=? LIMIT 1;";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bno);
				pstmt.executeUpdate();
			} catch(Exception e) {
				System.out.println("e: " + e.toString());
			}
		} catch(Exception e) {
			System.out.println("e: " + e.toString());
		} finally {
			if (state != null) {
				try {
					state.close();
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
		
		response.sendRedirect("../board/list.jsp?boardHobby="+boardHobby);
	}

}