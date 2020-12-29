package board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/board/add")
@MultipartConfig(maxFileSize = 1024*1024*5)
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
		
		HttpSession session = request.getSession();
		//HttpSession session = request.getSession(true);
		String path = request.getSession().getServletContext().getRealPath("/upload/");
		String img = null;
		Collection<Part> p = request.getParts();
		
		String userId = (String) session.getAttribute("id");
		String hobby = request.getParameter("hobby");
		System.out.println(hobby);
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Date time = new Date();
		SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd HH:mm");
		String dateTime = format.format(time);
		
		for(Part data : p) {
			if(data.getContentType() != null) {
				String fileName = data.getSubmittedFileName();
				if(fileName != null && fileName.length() != 0) {
					 data.write(path+userId+"_"+fileName);
					 img = userId+"_"+fileName;
				}
			}
		}
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			
			String sql;
			sql = "INSERT INTO JP_BOARD (ID, HOBBY, TITLE, CONTENT, USER_ID, DATE_TIME, VIEW_COUNT, IMG) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userId);
				pstmt.setString(2, hobby);
				pstmt.setString(3, title);
				pstmt.setString(4, content);
				pstmt.setString(5, userId);
				pstmt.setString(6, dateTime);
				pstmt.setInt(7, 0);
				pstmt.setString(8, img);
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
		
		response.sendRedirect("/board/list.jsp?boardHobby="+hobby);
	}
}