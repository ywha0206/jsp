package com.farm.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.farm.dto.CartDto;
import com.farm.dto.OrderDto;
import com.farm.util.DBHelper;
import com.farm.util.SQL;

public class CartDao extends DBHelper{
	
	private static CartDao instance = new CartDao();
	public static CartDao getInstance() {
		return instance;
	}
	private CartDao() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
public void insertCart(CartDto dto) {
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_CART);
			psmt.setInt(1,dto.getProdId());
			psmt.setString(2,dto.getUid());
			psmt.setInt(3,dto.getQuantity());
			psmt.setString(4,dto.getDiscount());

			psmt.setInt(5,dto.getPoint());
			psmt.setInt(6,dto.getPrice());

			
			psmt.executeUpdate();
			
		} catch (Exception e) {
			logger.error(e.getMessage());

		} finally {

			closeAll();
		}
		
	}
	
public CartDto selectCart(String cart) {
	
	CartDto dto = null;
	
	try {
		
		conn = getConnection();
		psmt = conn.prepareStatement(SQL.SELECT_CART);
		psmt.setString(1, cart);
		

		
		rs = psmt.executeQuery();
		
		if(rs.next()) {
			dto = new CartDto();
			dto.setCartNo(rs.getInt(1));
			dto.setProdId(rs.getInt(2));
			dto.setCategory(rs.getString(3));
			dto.setProname(rs.getString(4));
			dto.setQuantity(rs.getInt(5));
			dto.setDiscount(rs.getString(6));
			dto.setPoint(rs.getInt(7));
			dto.setPrice(rs.getInt(8));

			
		}
		
	} catch (Exception e) {
		logger.error(e.getMessage());
	}finally {
		closeAll();
	}
	return dto;
}

public List<CartDto> selectCarts(String uid) {
	
	List<CartDto> carts = new ArrayList<CartDto>();
	
	try {
		
		conn = getConnection();
		psmt = conn.prepareStatement(SQL.SELECT_CARTS);
		psmt.setString(1, uid);
		
		
		rs = psmt.executeQuery();
		
		while(rs.next()) {
			CartDto dto = new CartDto();
			dto.setCartNo(rs.getInt(1));
			dto.setCategory(rs.getString(2));
			dto.setProname(rs.getString(3));
			dto.setQuantity(rs.getInt(4));
			dto.setDiscount(rs.getString(5));
			dto.setPoint(rs.getInt(6));
			dto.setPrice(rs.getInt(7));
			dto.setProdId(rs.getInt(8));
			
			carts.add(dto);
		}
		
	} catch (Exception e) {
		logger.error(e.getMessage());
	}finally {
		closeAll();
	}
	return carts;
}
	
	public void updateCart(CartDto dto) {
		
	}
	

	public void deleteCart(int cartno){
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.DELETE_CART);
			psmt.setInt(1, cartno);
			psmt.executeUpdate();

			
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
			closeAll();
		}

	}
	 public int selectCartNoByProdId(int prodId) {
	        int cartNo = -1;
	        try {
	            conn = getConnection();
	            psmt = conn.prepareStatement(SQL.SELECT_CART_NO_BY_PROD_ID);
	            psmt.setInt(1, prodId);
	            rs = psmt.executeQuery();
	            if (rs.next()) {
	                cartNo = rs.getInt("cartNo");
	            }
	        } catch (Exception e) {
	            logger.error(e.getMessage());
	        } finally {
	            closeAll();
	        }
	        return cartNo;
	    }
	
	

}