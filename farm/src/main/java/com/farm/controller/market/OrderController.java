package com.farm.controller.market;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.farm.dto.CartDto;
import com.farm.dto.OrderDto;
import com.farm.dto.UserDto;
import com.farm.service.CartService;
import com.farm.service.OrderService;
import com.farm.service.ProductService;
import com.farm.service.UserService;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/market/order.do")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private CartService cartService = CartService.INSTANCE;
	private UserService userService = UserService.INSTANCE;
	private OrderService orderService = OrderService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		HttpSession session = req.getSession();
    	UserDto sessUser = (UserDto) session.getAttribute("sessUser");
    	String uid = sessUser.getUid();
		
		String[] carts = req.getParameterValues("cart");
		logger.debug("carts : " + Arrays.toString(carts));
		
		
		List<CartDto> cartDtos = new ArrayList<CartDto>(); 
		for(String cart : carts) {
			 CartDto cartDTO = cartService.selectCart(cart);
			 cartDtos.add(cartDTO);
		}
		
		
		UserDto user = userService.selectUser(uid);
		
		req.setAttribute("carts", cartDtos);
		req.setAttribute("user", user);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/market/order.jsp");
		dispatcher.forward(req, resp);
		
		
		

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
    	UserDto sessUser = (UserDto) session.getAttribute("sessUser");
    	String uid = sessUser.getUid();
		
		
	
	}
}


