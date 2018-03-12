/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import com.google.gson.Gson;
import dao.*;
import java.util.ArrayList;
import java.util.List;
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
@RequestMapping(value = "/admin/danh-muc")
public class AdminCategoryController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(HttpServletRequest request, ModelMap mm) {
        HttpSession session = request.getSession();

        if (PermissionUtils.checkLogin(session)) {
            CategoryDao categoryDao = new CategoryDao();
            List<Category> listCat = categoryDao.getAllCat();

            mm.put("listCat", listCat);
            return "admin/category/index";
        } else {
            return "redirect:/admin/login/";
        }
    }

    @RequestMapping(value = "/tim-kiem", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    public @ResponseBody
    String findCate(HttpServletRequest request, HttpServletResponse response) {
        response.setCharacterEncoding("UTF-8"); // this line solves the problem
        response.setContentType("application/json");
        HttpSession session = request.getSession();
        if (PermissionUtils.checkLogin(session)) {
            CategoryDao categoryDao = new CategoryDao();
            String id = request.getParameter("id");
            Category category = categoryDao.getCategoryById(Integer.valueOf(id));

            Gson gson = new Gson();
            String res = gson.toJson(category);
            return res;
        } else {
            return null;
        }
    }

    @RequestMapping(value = "/cap-nhat", method = RequestMethod.GET)
    public String editCate(HttpServletRequest request,
            @RequestParam(value = "cateId") int id,
            @RequestParam(value = "cateName") String cateName,
            @RequestParam(value = "catePath") String catePath) {
        HttpSession session = request.getSession();
        if (PermissionUtils.checkLogin(session)) {
            CategoryDao categoryDao = new CategoryDao();
            Category category = new Category();
            category.setCategory_name(cateName);
            category.setCategory_path(catePath);;
            category.setId(id);

            categoryDao.updateCategory(category);
            return "redirect:/admin/danh-muc/";
        } else {
            return "redirect:/admin/login/";
        }
    }

    @RequestMapping(value = "/them-moi", method = RequestMethod.GET)
    public String addCate(HttpServletRequest request,
            @RequestParam(value = "cateName") String cateName,
            @RequestParam(value = "catePath") String catePath) {
        HttpSession session = request.getSession();
        if (PermissionUtils.checkLogin(session)) {
            CategoryDao categoryDao = new CategoryDao();
            Category category = new Category();
            category.setCategory_name(cateName);
            category.setCategory_path(catePath);;

            categoryDao.addCategory(category);
            return "redirect:/admin/danh-muc/";
        } else {
            return "redirect:/admin/login/";
        }
    }

    @RequestMapping(value = "/xoa", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    public @ResponseBody
    String delCate(HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (PermissionUtils.checkLogin(session)) {
            String id = request.getParameter("cateId");
            CategoryDao categoryDao = new CategoryDao();

            boolean res = categoryDao.delCategory(Integer.valueOf(id));

            if (res == true) {
                return Constants.JSON_SUCCESS;
            } else {
                return Constants.JSON_ERROR;
            }

        } else {
            return null;
        }
    }
}
