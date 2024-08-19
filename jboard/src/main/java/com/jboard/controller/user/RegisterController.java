package com.jboard.controller.user;

import java.io.IOException;

import dto.UserDto;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.UserService;

@WebServlet("/user/register.do")
public class RegisterController extends HttpServlet {
	
	
	
	private static final long serialVersionUID = 1L;
	UserService service = UserService.instance;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/user/register.jsp");
		dispatcher.forward(req, resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		//데이터 수신
		String uid = req.getParameter("uid");
		String pass = req.getParameter("pass1");
		String name = req.getParameter("name");
		String nick = req.getParameter("nick");
		String email = req.getParameter("email");
		String hp = req.getParameter("hp");
		String zip = req.getParameter("zip");
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
	
		//dto생성
		UserDto userDto = new UserDto();
		userDto.setUid(uid);
		userDto.setPass(uid);
		userDto.setName(uid);
		userDto.setNick(uid);
		userDto.setEmail(uid);
		userDto.setHp(uid);
		userDto.setZip(uid);
		userDto.setAddr1(uid);
		userDto.setAddr2(uid);
		
		service.insertUser(userDto);
		
		resp.sendRedirect("/jboard/user/login.do");
	
	}
}
