/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import com.google.gson.reflect.TypeToken;
import java.util.ArrayList;
import java.util.List;
import model.*;
import util.Constants;
import util.Utils;

/**
 *
 * @author dovan
 */
public class ProductService {

    private Utils utils = new Utils();
    private final String pathApiClient = Constants.HOST_NAME_CLIENT + "product/";
    private final String pathApiAdmin = Constants.HOST_NAME_ADMIN + "product/";

    public List<Product> getTop4Newest() {
        String api = pathApiClient + "list?type=top4";
        TypeToken<List<Product>> token = new TypeToken<List<Product>>() {
        };
        List<Product> result = (ArrayList<Product>) utils.convertToObject(api, token);

        return result;
    }

    public List<Product> getAll() {
        String api = pathApiClient + "list?type=all";
        TypeToken<List<Product>> token = new TypeToken<List<Product>>() {
        };
        List<Product> result = (ArrayList<Product>) utils.convertToObject(api, token);

        return result;
    }

    public List<Product> getRelatedProduct(int productId) {
        String api = pathApiClient + "list?type=rela&productId=" + productId;
        TypeToken<List<Product>> token = new TypeToken<List<Product>>() {
        };
        List<Product> result = (ArrayList<Product>) utils.convertToObject(api, token);

        return result;
    }

    public Product getProductById(int id) {
        String api = pathApiClient + "single?productId=" + id;
        TypeToken<Product> token = new TypeToken<Product>() {
        };
        Product result = (Product) utils.convertToObject(api, token);

        return result;
    }

    public List<Product> getProductByCategory(String category_path) {
        String api = pathApiClient + "list?type=category&category_path=" + category_path;
        TypeToken<List<Product>> token = new TypeToken<List<Product>>() {
        };
        List<Product> result = (ArrayList<Product>) utils.convertToObject(api, token);

        return result;
    }

    public List<Product> getProductByIdCart(int idCart) {
        String api = pathApiClient + "list?type=cart&idCart=" + idCart;
        TypeToken<List<Product>> token = new TypeToken<List<Product>>() {
        };
        List<Product> result = (ArrayList<Product>) utils.convertToObject(api, token);

        return result;
    }

    public void addProduct(String query) {
        String api = pathApiAdmin + "addnew?" + query;
        utils.excutePost(api);
    }
}
