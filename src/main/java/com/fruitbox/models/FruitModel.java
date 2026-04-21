package com.fruitbox.models;

public class FruitModel {
	private int id;
    private String name;
    private double price;
    private int quantity;
    private String image;
    public FruitModel() {
    	
    }
    public FruitModel(String name, double price, int quantity, String image) {
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
    }
	public FruitModel(int id, String name, double price, int quantity, String image) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
		this.image = image;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "FruitModel [id=" + id + ", name=" + name + ", price=" + price + ", quantity=" + quantity + ", image="
				+ image + "]";
	}
	
    
}
