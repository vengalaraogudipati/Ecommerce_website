package com.fruitbox.dao;

import java.util.List;

import com.fruitbox.models.CartModel;


public interface CartDAOInterface {
	String addToCart(CartModel c);
	List<CartModel> getCartByUser(String username);
	String removeFromCart(int cartId);
	String clearCart(String username);
	


}
