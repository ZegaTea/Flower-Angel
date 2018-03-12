package model;

import java.util.List;

public class Product {

    int id;
    String product_name;
    double price;
    double discount;
    String sort_description;
    String full_description;
    long day_create;

    List<String> listImage;
    int quantity;

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public List<String> getListImage() {
        return listImage;
    }

    public void setListImage(List<String> listImage) {
        this.listImage = listImage;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public String getSort_description() {
        return sort_description;
    }

    public void setSort_description(String sort_description) {
        this.sort_description = sort_description;
    }

    public String getFull_description() {
        return full_description;
    }

    public void setFull_description(String full_description) {
        this.full_description = full_description;
    }

    public long getDay_create() {
        return day_create;
    }

    public void setDay_create(long day_create) {
        this.day_create = day_create;
    }

    public Product(int id, String product_name, double price, double discount,
            String sort_description, String full_description, long day_create) {
        super();
        this.id = id;
        this.product_name = product_name;
        this.price = price;
        this.discount = discount;
        this.sort_description = sort_description;
        this.full_description = full_description;
        this.day_create = day_create;
    }

    public Product() {
        super();
    }

}
