/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;

/**
 *
 * @author dovan
 */
public class ProductCart {
    private  int idCart;
    private List<Product> listProduct;

    public ProductCart(int idCart, List<Product> listProduct) {
        this.idCart = idCart;
        this.listProduct = listProduct;
    }

    public ProductCart() {
    }

    public int getIdCart() {
        return idCart;
    }

    public void setIdCart(int idCart) {
        this.idCart = idCart;
    }

    public List<Product> getListProduct() {
        return listProduct;
    }

    public void setListProduct(List<Product> listProduct) {
        this.listProduct = listProduct;
    }
    
    
}
