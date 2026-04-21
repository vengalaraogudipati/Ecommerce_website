package com.fruitbox.dao;

import java.util.List;
import com.fruitbox.models.OrderModel;

public interface OrderDAOInterface {
	public List<OrderModel> getOrdersByUsername(String username);
	String saveOrder(OrderModel order);
	boolean cancelOrder(int orderId);
	
}
