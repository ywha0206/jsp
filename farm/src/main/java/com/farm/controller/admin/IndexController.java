package com.farm.controller.admin;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/index.do")
public class IndexController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/admin/index.jsp");
		dispatcher.forward(req, resp);
	}
	
	
	}
	