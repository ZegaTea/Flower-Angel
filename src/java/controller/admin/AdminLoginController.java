/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

/**
 *
 * @author dovan
 */
import dao.UserDao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import util.Constants;
import util.PermissionUtils;

@Controller
@RequestMapping(value = "/admin/login")
public class AdminLoginController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(HttpServletRequest request) {
        HttpSession session = request.getSession();

        if (PermissionUtils.checkLogin(session)) {
            return "redirect:/admin/home/";
        } else {
            return "admin/login/index";
        }
    }

    @RequestMapping(value = "/check-login", method = RequestMethod.POST)
    public String checkLogin(HttpServletRequest request) {
        UserDao userDao = new UserDao();
        String admin_name = request.getParameter("name");
        String admin_pass = request.getParameter("pass");

        int id = userDao.getAdminId(admin_name, admin_pass);
        HttpSession session = request.getSession();
        if (id == -1) {
            session.setAttribute(Constants.LOGIN_FAIL, Constants.LOGIN_FAIL);

            return "redirect:/admin/login/";
        } else {
            session.removeAttribute(Constants.LOGIN_FAIL);
            session.setAttribute(Constants.ADMIN_ID, id);
            return "redirect:/admin/home/";
        }
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logOut(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute(Constants.ADMIN_ID);
        return "redirect:/admin/login/";
    }
}
