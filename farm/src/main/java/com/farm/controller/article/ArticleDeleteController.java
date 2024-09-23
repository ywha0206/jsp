package com.farm.controller.article;

import java.io.IOException;

import com.farm.service.ArticleService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/article/delete.do")
public class ArticleDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	 private ArticleService service = ArticleService.INSTANCE;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String cate = req.getParameter("cate");
		String type = req.getParameter("type");
		String no = req.getParameter("no");
		
		
		service.deleteArticle(no);
		
		resp.sendRedirect("/farm/article/list.do?cate="+cate+"&type="+type);
	}
	
}

