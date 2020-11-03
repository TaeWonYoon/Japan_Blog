package auth;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// mariadb 연결정보
	private final String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
	private final String DB_URL = "jdbc:mariadb://jeongps.com:3306/japan_dbsxodnjs456";
	private final String DB_USER = "dbsxodnjs456";
	private final String DB_PASSWORD = "dljeQPcyr0WZUKUS";

    /**
     * Default constructor. 
     */
    public login() {
        // TODO Auto-generated constructor stub
    }

	// 로그인 처리
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        
		String id = request.getParameter("id");
		String password = request.getParameter("pw");
		System.out.println(id + password);
		
		Boolean idCorrect = false;
		Boolean passwordCorrect = false;
		
		Connection conn = null;
		Statement state = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			System.out.println("연결");
			state = conn.createStatement();
			
			String sql;
			sql = "SELECT * FROM Test WHERE ID=? LIMIT 1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setNString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			// 아이디 맞음
			if (rs != null) {
				idCorrect = true;
				
				while(rs.next()) {
					String passwordInDB = rs.getNString("PASSWORD");
					
					// 비밀번호 일치
					if (password.equals(passwordInDB)) {
						passwordCorrect = true;
					}
					
					// 비밀번호 틀림
					else {
						System.out.println("비밀번호 틀림");
					}			
				}
			} 
			
			// 아이디 틀림
			else {
				System.out.println("아이디 틀림");
			}
			
			rs.close();
			state.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("e: " + e.toString());
		} finally {
			try {
				if (state != null) {
					state.close();
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
						
		// 아이디, 비밀번호가 맞음
		if (idCorrect && passwordCorrect) {
			HttpSession session = request.getSession(true);
			session.setAttribute("id", id);
			session.setAttribute("login", true);
			response.sendRedirect("/index.jsp");
		} 
		
		// 아이디, 비밀번호 틀림
		else {
			PrintWriter out = response.getWriter();
			
			try {
				out.println("<!DOCTYPE html>");
				out.println("<html>");
				out.println("<head>");
				out.println("<meta charset='UTF-8'>");
				out.println("<title>로그인 결과</title>");
				out.println("</head>");
				out.println("<body>");
				
				if (!idCorrect) {
					out.println("<p>아이디를 확인해주세요.</p>");	
				}
				
				if (!passwordCorrect) {
					out.println("<p>비밀번호를 확인해주세요.</p>");	
				}
				
				out.println("<p><a href='/auth/login.jsp'>로그인 화면</a></p>");	
				out.println("</body>");
				out.println("</html>");
			} finally {
				out.close();
			}
		}
	}

}
