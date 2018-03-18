/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import model.*;
import util.Constants;
import util.Utils;

/**
 *
 * @author dovan
 */
public class CartService {

    private Utils utils = new Utils();
    private final String pathApiClient = Constants.HOST_NAME_CLIENT + "cart/";
    private final String pathApiAdmin = Constants.HOST_NAME_ADMIN + "cart/";

    public int addToCart(Cart cart, List<Product> list) {
        Gson gson = new Gson();
        int id = -1;
        try {
            String cartEncode = URLEncoder.encode(gson.toJson(cart), "utf-8");
            String listEncode = URLEncoder.encode(gson.toJson(list), "utf-8");
            String api = pathApiClient + "add?cart=" + cartEncode + "&list=" + listEncode;
            TypeToken<Integer> token = new TypeToken<Integer>() {
            };

            id = (int) utils.convertToObject(api, token);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return id;
    }

    public List<Cart> getListAll() {
        String api = pathApiClient + "list?type=all";
        TypeToken<List<Cart>> token = new TypeToken<List<Cart>>() {
        };

        List<Cart> list = (ArrayList<Cart>) utils.convertToObject(api, token);
        return list;
    }

    public List<Cart> getListAllByIdUser(int id) {
        String api = pathApiClient + "list?type=user&id=" + id;
        TypeToken<List<Cart>> token = new TypeToken<List<Cart>>() {
        };

        List<Cart> list = (ArrayList<Cart>) utils.convertToObject(api, token);
        return list;
    }
}
