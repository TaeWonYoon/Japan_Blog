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

@WebServlet("/board/edit")
public class BoardEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// mariadb 연결정보
	private final String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
	private final String DB_URL = "jdbc:mariadb://jeongps.com:3306/japan_dbsxodnjs456";
	private final String DB_USER = "dbsxodnjs456";
	private final String DB_PASSWORD = "dljeQPcyr0WZUKUS";
       
    public BoardEdit() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		Date time = new Date();
		SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd HH:mm");
		String dateTime = format.format(time);
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		System.out.println("bno="+bno+" title="+title+" content="+content+" dataTime="+dateTime);
		Connection conn = null;
		Statement state = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			state = conn.createStatement();
			
			String sql;
			sql = "UPDATE JP_BOARD SET TITLE = ?, CONTENT = ?, DATE_TIME = ? WHERE BNO = ?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, title);
				pstmt.setString(2, content);
				pstmt.setString(3, dateTime);
				pstmt.setInt(4, bno);
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
		
		response.sendRedirect("../board/view.jsp?board_bno=" + bno);
	}

}