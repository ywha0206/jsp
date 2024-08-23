package com.jboard.controller.comment;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.jboard.dto.CommentDto;
import com.jboard.service.CommentService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/comment/write.do")
public class WriteController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	CommentService service = CommentService.instance;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//데이터 수신
		String parent = req.getParameter("parent");
		String comment = req.getParameter("comment");
		String writer = req.getParameter("writer");
		String regip = req.getRemoteAddr();
		
		//dto생성
		CommentDto dto = new CommentDto();
		dto.setParent(parent);
		dto.setContent(comment);
		dto.setWriter(writer);
		dto.setRegip(regip);
	
		//댓글 쓰기
		int pk = service.insertComment(dto);
		
		//등록한 댓글 조회
		CommentDto commentDto = service.selectComment(pk);
		logger.debug("pk 볼 거야"+pk);
		logger.debug("writeCon : "+ commentDto);
		
		/*
		JsonObject json = new JsonObject();
		json.addProperty("nick", commentDto.getNick());
		json.addProperty("rdate", commentDto.getRdate());
		json.addProperty("content",commentDto.getContent());
		*/
		
		//json 생성 및 출력 > ajax로 요청했으니까 json 출력해야 돼 리다이렉트가 아니라서 요청이 하나 줄어듦
		Gson gson = new Gson();
		String json = gson.toJson(commentDto);
		
		PrintWriter printWriter = resp.getWriter();
		printWriter.print(json);
		
	}
}
