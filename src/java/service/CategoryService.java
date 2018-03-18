/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;
import org.apache.naming.java.javaURLContextFactory;
import util.Constants;
import util.Utils;
import java.net.URLDecoder;
import java.net.URLEncoder;

/**
 *
 * @author dovan
 */
public class CategoryService {

    private Utils utils = new Utils();
    private final String pathApiClient = Constants.HOST_NAME_CLIENT + "category/";
    private final String pathApiAdmin = Constants.HOST_NAME_ADMIN + "category/";

    public List<Category> getAllCat() {
        String api = pathApiClient + "list";
        TypeToken<List<Category>> token = new TypeToken<List<Category>>() {
        };
        List<Category> result = (ArrayList<Category>) utils.convertToObject(api, token);
        return result;
    }

    public Category getCategoryById(int id) {
        String api = pathApiAdmin + "single?id=" + id;
        TypeToken<Category> token = new TypeToken<Category>() {
        };
        Category result = (Category) utils.convertToObject(api, token);
        return result;
    }

    public void updateCategory(Category category) {
        Gson gson = new Gson();
        try {
            String json = gson.toJson(category);
            String jsonEncode = URLEncoder.encode(json, "utf-8");
            String api = pathApiAdmin + "modify?type=update&category=" + jsonEncode;
            utils.excutePost(api);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addCategory(Category category) {
        Gson gson = new Gson();
        try {
            String json = gson.toJson(category);
            String jsonEncode = URLEncoder.encode(json, "utf-8");
            String api = pathApiAdmin + "modify?type=addnew&category=" + jsonEncode;
            utils.excutePost(api);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean delCategory(int id) {
        String api = pathApiAdmin + "modify?type=del&id=" + id;
        TypeToken<Boolean> token = new TypeToken<Boolean>() {
        };
        Boolean result = (Boolean) utils.convertToObject(api, token);
        return result;
    }
}
