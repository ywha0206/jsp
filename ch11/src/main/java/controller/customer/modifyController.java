package controller.customer;

import java.io.Console;
import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.CustomerDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.CustomerService;

@WebServlet("/customer/modify.do")
public class modifyController extends HttpServlet {
	private static final long serialVersionUID = 5095999767950283131L;

	private CustomerService service = CustomerService.INSTANCE;
	
	//로거 생성
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//데이터 수신
		String custId = req.getParameter("custId");
		
		//데이터 조회
		CustomerDTO customer = service.selectCustomer(custId);
		
		//데이터 공유
		req.setAttribute("customer", customer);
		
		//view 포워드
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/customer/modify.jsp");
		dispatcher.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
				//데이터 수신
				String custId = req.getParameter("custId");
				String name = req.getParameter("name");
				String hp = req.getParameter("hp");
				String addr = req.getParameter("addr");
				String rdate = req.getParameter("rdate");
				
				//DTO 생성 (DTO - 데이터 전송 객체, 컴포넌트 간 데이터 교환을 위한 객체)
				CustomerDTO dto = new CustomerDTO();
				dto.setCustId(custId);
				dto.setName(name);
				dto.setHp(hp);
				dto.setAddr(addr);
				dto.setRdate(rdate);
	
				
				//데이터 수정 요청
				service.updateCustomer(dto);
				
				resp.sendRedirect("/ch11/customer/list.do");
				
				
	}
}
