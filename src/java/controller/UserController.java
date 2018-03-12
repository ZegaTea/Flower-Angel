/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

/**
 *
 * @author dovan
 */
import com.google.gson.Gson;
import dao.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.User;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import util.Constants;

@Controller
@RequestMapping(value = "/user")
public class UserController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "login/index";
    }

    @RequestMapping(value = "/check-login", method = RequestMethod.GET, consumes = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    String checkLogin(HttpServletRequest request) {
        String response = "{\"msg\":\"success\"}";
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDao userDao = new UserDao();

        int resultLogin = userDao.checkLogin(username, password);
        if (resultLogin == -1) {
            response = "{\"msg\":\"error\"}";
        }

        User user = userDao.getUserInfo(resultLogin);

        HttpSession session = request.getSession();

        session.setAttribute(Constants.USER, user);
        return response;
    }

    @RequestMapping(value = "/logout", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    String logOut(HttpServletRequest request) {
        String response = "{\"msg\":\"success\"}";

        HttpSession session = request.getSession();
        try {
            session.removeAttribute(Constants.USER);
        } catch (Exception e) {
            e.printStackTrace();
            response = "{\"msg\":\"error\"}";
        }

        return response;
    }
}
