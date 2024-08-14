package sub1;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class WelcomtServlet extends HttpServlet{

	private static final long serialVersionUID = 8956070153714035071L;

	@Override
	public void init() throws ServletException {

	
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//클라이언트 요청이 get일 경우 doget이 호출
		System.out.println("WelcomeServlet doGet...");
		
		//html 출력
		resp.setContentType("text/html;charset=utf-8");
		
		PrintWriter writer = resp.getWriter();
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<meta charset='utf-8'/>");
		writer.println("<title> Welcome servlet</title>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h3> Welcome servlet</h3>");
		writer.println("<a href='/ch09/hello.do'>hello</a>");
		writer.println("<a href='/ch09/welcome.do'>welcome</a>");
		writer.println("<a href='/ch09/greeting.do'>greeting</a>");
		writer.println("</body>");
		writer.println("</html>");
		writer.close();
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}
