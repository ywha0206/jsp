package com.farm.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.farm.dto.OrderDto;
import com.farm.util.DBHelper;
import com.farm.util.SQL;

public class OrderDao extends DBHelper{
	
	private static OrderDao instance = new OrderDao();
	public static OrderDao getInstance() {
		return instance;
	}
	private OrderDao() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	public void insertOrder( OrderDto dto ) {
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_CART);
			psmt.setString(1, null);
			psmt.setString(2, null);
			psmt.setString(3, null);
			psmt.setString(4, null);
			psmt.setString(5, null);
			psmt.setString(6, null);
			psmt.setString(7, null);
			psmt.setString(8, null);
			psmt.setString(9, null);
			psmt.setString(10, null);
			psmt.setString(11, null);
			psmt.setString(12, null);
			
			psmt.executeUpdate();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
			closeAll();
		}
		
		
	}
	
	public OrderDto selectOrder() {
		return null;
	}
	
	public List<OrderDto> selectOrders() {
		List<OrderDto> orders = new ArrayList<>();
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_ORDERS);
			rs = psmt.executeQuery();
			logger.debug(rs.toString());
			while(rs.next()) {
				OrderDto dto = new OrderDto();
				dto.setOrderNo(rs.getInt(1));
				dto.setUid(rs.getString(2));
				dto.setProdId(rs.getInt(3));
				dto.setPrice(rs.getInt(4));
				dto.setQuantity(rs.getInt(5));
				dto.setDelivery(rs.getInt(6));
				dto.setTotalAmount(rs.getInt(8));
				dto.setUsedPoint(rs.getInt(9));
				dto.setPayAmount(rs.getInt(10));
				dto.setOrderDate(rs.getString(11));
				
				orders.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			closeAll();
		}
		
		logger.debug("dao orders: "+orders.toString());
		return orders;
	}
	public void updateOrder(OrderDto dto) {
		
	}
	public void deleteOrder(String proname){
		
	}
	

}
