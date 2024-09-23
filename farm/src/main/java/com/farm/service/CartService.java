package com.farm.service;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.farm.dao.CartDao;
import com.farm.dao.OrderDao;
import com.farm.dto.CartDto;
import com.farm.dto.OrderDto;

public enum CartService {

	INSTANCE;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private CartDao dao = CartDao.getInstance();

	public void insertCart(CartDto dto) {
		 dao.insertCart(dto);
	}
	
	public CartDto selectCart(String cart) {
		return dao.selectCart(cart);
	}
	public List<CartDto> selectCarts(String uid) {
		return dao.selectCarts(uid);
	}
	
	public void updateCart(CartDto dto) {
		
	}

	public void deleteCart(int cartno){
		dao.deleteCart(cartno);

	}
	public int getCartNoByProdId(int prodId) {
        return dao.selectCartNoByProdId(prodId);
    }
	
}