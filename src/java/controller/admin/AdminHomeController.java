/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

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

/**
 *
 * @author dovan
 */
@Controller
@RequestMapping(value = "/admin/home")
public class AdminHomeController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(HttpServletRequest request) {

        HttpSession session = request.getSession();

        if (PermissionUtils.checkLogin(session)) {
            return "admin/home/index";
        } else {
            return "redirect:/admin/login/";
        }
    }

}
