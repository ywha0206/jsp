package com.farm.controller.user;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.farm.dto.UserDto;
import com.farm.service.UserService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user/findID.do")
public class FindIDController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private UserService service = UserService.INSTANCE;
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//String uid = req.getParameter("uid");
		//UserDto userDto = new UserDto();
		//userDto.setUid(uid);

		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/user/findID.jsp");
		dispatcher.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//데이터 수신
		String name = req.getParameter("name");
		String hp = req.getParameter("hp");
		logger.debug("name" + name + "hp" + hp);
		
		// DB 조회
		UserDto userDto = service.findID(name, hp);
		
		if(userDto != null) {
			// 조회된 아이디가 있는 경우
			logger.info("User found with UID: " + userDto.getUid());
			req.setAttribute("uid", userDto.getUid());
		}else {
			//조회된 아이디가 없는 경우
			logger.info("No matching user found");
			req.setAttribute("errorMessage", "일치하는 정보가 없습니다.");
		}
		
		
		// JSON 출력
		
		//resp.sendRedirect("/WEB-INF/user/findID.jsp");
		
		
	}
}
