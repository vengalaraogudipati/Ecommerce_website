package com.fruitbox.dao;
import com.fruitbox.models.*;
public interface UserDAOInterface {
	public String UserRegister(UserModel u);
	public String userLogin(UserLoginModel ulm);

}
