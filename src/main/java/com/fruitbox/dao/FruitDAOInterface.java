package com.fruitbox.dao;

import java.util.List;

import com.fruitbox.models.FruitModel;

public interface FruitDAOInterface {
	boolean addFruit(FruitModel fruit);
	List<FruitModel> getAllFruits();
	public boolean deleteFruit(int id);
	public FruitModel getFruitById(int id);
	public boolean updateFruit(FruitModel fruit);
}
