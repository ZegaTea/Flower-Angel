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
    private final String pathApi = Constants.HOST_NAME_CLIENT + "product/";

    public List<Product> getTop4Newest() {
        String api = pathApi + "list?type=top4";
        TypeToken<List<Product>> token = new TypeToken<List<Product>>() {
        };
        List<Product> result = (ArrayList<Product>) utils.convertToObject(api, token);
        
        return result;
    }
}
