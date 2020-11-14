package board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/add")
public class BoardAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// mariadb 연결 정보
	private final String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
	private final String DB_URL = "jdbc:mariadb://jeongps.com:3306/japan_dbsxodnjs456";
	private final String DB_USER = "dbsxodnjs456";
	private final String DB_PASSWORD = "dljeQPcyr0WZUKUS";
	
    public BoardAdd() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
				
		//HttpSession session = request.getSession(true);
		//String userId = (String) session.getAttribute("id");
		String userId = "test"; ///////////////////////////////////////////////////////////////////추후 수정 바람!!
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Date time = new Date();
		SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		String dateTime = format.format(time);
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			
			String sql;
			sql = "INSERT INTO JP_BOARD (TITLE, CONTENT, USER_ID, DATE_TIME) VALUES (?, ?, ?, ?);";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, title);
				pstmt.setString(2, content);
				pstmt.setString(3, userId);
				pstmt.setString(4, dateTime);
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
		
		response.sendRedirect("../board/list.jsp");
	}

}