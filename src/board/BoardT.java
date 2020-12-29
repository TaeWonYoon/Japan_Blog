package board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/upload22.do")
public class BoardT extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public BoardT() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ohyes");
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		String path = request.getSession().getServletContext().getRealPath("/upload/");
		System.out.println(path);
		
		Collection<Part> p = request.getParts();
		
		for(Part data : p) {
			if(data.getContentType() != null) {
				String fileName = data.getSubmittedFileName();
				if(fileName != null && fileName.length() != 0) {
					data.write(path+fileName);
					out.print("<img src='./upload/"+fileName+"'>");
				}
			}
		}
	
	}

}
