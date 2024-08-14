package sub1;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {
	
	/**
	 * add generated serial version ID
	 */
	private static final long serialVersionUID = 4234852702204424689L;

	@Override
	public void init() throws ServletException {
		//서블릿이 최초로 실행될 때 // 여기서 모든 서블릿이 초기화됨
		System.out.println("HelloServlet init...");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//클라이언트 요청이 get일 경우 doget이 호출
		System.out.println("HelloServlet doGet...");
		
		//html 출력
		resp.setContentType("text/html;charset=utf-8");
		
		PrintWriter writer = resp.getWriter();
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<meta charset='utf-8'/>");
		writer.println("<title> Hello servlet</title>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h3>hello servlet</h3>");
		writer.println("<a href='/ch09/hello.do'>hello</a>");
		writer.println("<a href='/ch09/welcome.do'>welcome</a>");
		writer.println("<a href='/ch09/greeting.do'>greeting</a>");
		writer.println("</body>");
		writer.println("</html>");
		writer.close();
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//클라이언트 요청이 post일 경우 dopost 호출
		System.out.println("HelloServlet doPost...");
	}
	
	@Override
	public void destroy() {
		//init의 반대 서버가 종료될 때 // 서버가 셧다운(중지)될 때 distroy 호출
		System.out.println("HelloServlet destroy...");
	}
	
}
