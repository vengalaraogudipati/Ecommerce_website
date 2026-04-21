package com.fruitbox.models;

public class CartModel {

    private int id;
    private String username;
    private int fruitId;
    private String fruitName;
    private double price;
    private int quantity;
    private String image;   

    public CartModel() {
    }

    public CartModel(int id, String username, int fruitId, String fruitName,
                     double price, int quantity, String image) {
        this.id = id;
        this.username = username;
        this.fruitId = fruitId;
        this.fruitName = fruitName;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getFruitId() {
        return fruitId;
    }

    public void setFruitId(int fruitId) {
        this.fruitId = fruitId;
    }

    public String getFruitName() {
        return fruitName;
    }

    public void setFruitName(String fruitName) {
        this.fruitName = fruitName;
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

    // 🔥 IMAGE GETTER & SETTER
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "CartModel [id=" + id + ", username=" + username +
                ", fruitId=" + fruitId + ", fruitName=" + fruitName +
                ", price=" + price + ", quantity=" + quantity +
                ", image=" + image + "]";
    }
}