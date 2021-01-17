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

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	super.doGet(req, resp);
    }
    
	// 로그인 처리
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        
		String id = request.getParameter("id");
		String password = request.getParameter("pw");
		int level = 0;
		String nickName = "";
		Boolean idCorrect = false;
		Boolean passwordCorrect = false;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			
			Class.forName(JDBC_DRIVER); // 디비 드라이버
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			System.out.println("연결");
			
			String sql = null;
			sql = "SELECT * FROM JP_USER WHERE ID = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setNString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			// 아이디 맞음
			//System.out.println(rs);
			if (rs != null) {
				idCorrect = true;
				
				while(rs.next()) {
					String passwordInDB = rs.getNString("PASSWORD");
					nickName = rs.getNString("NICKNAME");
					level =  rs.getInt("USER_TYPE");
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
			
		} catch(Exception e) {
			System.out.println("e: " + e.toString());
		} finally {
			try {
				if(pstmt != null) {
				pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch(SQLException e) {
				System.out.println("e: " + e.toString());
			}
		}
						
		// 아이디, 비밀번호가 맞음
		if (idCorrect && passwordCorrect) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			session.setAttribute("level", level);
			String grade = "";
			if(level == 1) {
				grade = "1";
			} else if (level == 2) {
				grade = "2";
			} else if (level == 3) {
				grade = "3";
			} else if (level == 4) {
				grade = "4";
			} else {
				grade = "5";
			}
			session.setAttribute("grade", grade);
			session.setAttribute("nickName", nickName);
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
