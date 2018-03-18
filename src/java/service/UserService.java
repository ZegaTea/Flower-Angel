/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.User;
import util.Constants;
import util.Utils;

/**
 *
 * @author dovan
 */
public class UserService {

    private Utils utils = new Utils();
    private final String pathApiClient = Constants.HOST_NAME_CLIENT + "user/";
    private final String pathApiAdmin = Constants.HOST_NAME_ADMIN + "user/";

    public User getUserInfo(int id) {
        String api = pathApiClient + "info?id=" + id;
        TypeToken<User> token = new TypeToken<User>() {
        };

        User user = (User) utils.convertToObject(api, token);
        return user;
    }

    public int checkLogin(String username, String password) {
        String api = pathApiClient + "checklogin?type=client&username=" + username + "&pass=" + password;
        TypeToken<Integer> token = new TypeToken<Integer>() {
        };

        int id = (int) utils.convertToObject(api, token);
        return id;
    }

    public int createUser(User user) {
        Gson gson = new Gson();
        try {
            String jsonEncode = URLEncoder.encode(gson.toJson(user), "utf-8");
            String api = pathApiClient + "modify?user=" + jsonEncode;
            TypeToken<Integer> token = new TypeToken<Integer>() {
            };

            int id = (int) utils.convertToObject(api, token);
            return id;
        } catch (Exception e) {
            return -1;
        }
    }
    
    public int adminLogin(String name, String pass){
        String api = Constants.HOST_NAME_ADMIN + "check/login?type=admin&username=" + name + "&pass=" + pass;
        TypeToken<Integer> token = new TypeToken<Integer>() {
        };

        int id = (int) utils.convertToObject(api, token);
        return id;
    }
}
