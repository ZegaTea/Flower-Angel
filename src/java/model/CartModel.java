/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author dovan
 */
public class CartModel {
    private String quantity;
    private int productId;

    public CartModel(String quantity, int productId) {
        this.quantity = quantity;
        this.productId = productId;
    }

    public CartModel() {
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }
    
}
