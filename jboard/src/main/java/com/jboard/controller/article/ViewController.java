package com.jboard.controller.article;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jboard.dto.ArticleDto;
import com.jboard.dto.CommentDto;
import com.jboard.service.ArticleService;
import com.jboard.service.CommentService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/article/view.do")
public class ViewController extends HttpServlet {
	private static final long serialVersionUID = 4818082532605926530L;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private ArticleService service = ArticleService.getInstance();
	private CommentService commentService = CommentService.instance;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//데이터 수신
		String no = req.getParameter("no");
		
		//데이터 조회
		ArticleDto articleDto= service.selectArticle(no);
		
		//댓글 조회
		List<CommentDto> comments = commentService.selectComments(no);
		
		logger.debug("commenttest: "+comments.toString());
		
		
		//공유참조
		req.setAttribute("articleDto", articleDto);
		req.setAttribute("comments", comments);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/article/view.jsp");
		dispatcher.forward(req, resp);
	
	}
}
