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

@WebServlet("/board/coment")
public class BoardComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// mariadb 연결 정보
	private final String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
	private final String DB_URL = "jdbc:mariadb://jeongps.com:3306/japan_dbsxodnjs456";
	private final String DB_USER = "dbsxodnjs456";
	private final String DB_PASSWORD = "dljeQPcyr0WZUKUS";
	
    public BoardComment() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		//HttpSession session = request.getSession(true);
		String userId = (String) session.getAttribute("id"); //로그인아이디
		int bno = Integer.parseInt(request.getParameter("bno"));
		String postId = request.getParameter("postId"); //작성자아이디
		String comment = request.getParameter("comment_content");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			
			String sql;
			sql = "INSERT INTO JP_COMMENT (COMMENT_BNO, BOARD_ID, LOGIN_ID, COMMENT) VALUES (?, ?, ?, ?);";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bno);
				pstmt.setString(2, postId);
				pstmt.setString(3, userId);
				pstmt.setString(4, comment);
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
		
		response.sendRedirect("/board/view.jsp?board_bno="+bno);
	}
}