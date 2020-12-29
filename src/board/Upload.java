package board;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/upload2.do")
@MultipartConfig(maxFileSize = 1024*1024*5)
public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
	private final String DB_URL = "jdbc:mariadb://jeongps.com:3306/japan_dbsxodnjs456";
	private final String DB_USER = "dbsxodnjs456";
	private final String DB_PASSWORD = "dljeQPcyr0WZUKUS";
	
    public Upload() {
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ohyes");
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String img = null;
		PrintWriter out = response.getWriter();
		
		String path = request.getSession().getServletContext().getRealPath("/upload/");
		System.out.println(path);
		
		Collection<Part> p = request.getParts();
		
		for(Part data : p) {
			if(data.getContentType() != null) {
				String fileName = data.getSubmittedFileName();
				if(fileName != null && fileName.length() != 0) {
					data.write(path+fileName);
					img = "<img src='./upload/"+fileName+"'>";
				}
			}
		}
		Connection conn = null;
		PreparedStatement pstmt = null;
		System.out.println(img);
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			
			String sql;
			sql = "INSERT INTO UPLOAD (IMG) VALUES (?);";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, img);
			pstmt.executeUpdate();
			
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
		response.sendRedirect("./Test.jsp");
	}
}