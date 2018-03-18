/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import dao.*;
import java.util.ArrayList;
import java.util.Calendar;
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
import service.CategoryService;
import service.ProductService;
import util.Constants;
import util.PermissionUtils;

/**
 *
 * @author dovan
 */
@Controller
@RequestMapping(value = "/admin/san-pham")
public class AdminProductController {
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(HttpServletRequest request, ModelMap mm) {
        HttpSession session = request.getSession();
        if (PermissionUtils.checkLogin(session)) {
            ProductService productService = new ProductService();
            List<Product> listPr = productService.getAll();
            List<Category> listCat = new CategoryService().getAllCat();
            mm.put("listProduct", listPr);
            mm.put("listCat", listCat);
            return "admin/product/index";
        } else {
            return "redirect:/admin/login/";
        }
    }
    
    @RequestMapping(value = "/them-moi", method = RequestMethod.GET)
    public String addProduct(HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (PermissionUtils.checkLogin(session)) {
            String query = request.getQueryString();
            ProductService productService = new ProductService();
            productService.addProduct(query);
            return "redirect:/admin/san-pham/";
        } else {
            return "redirect:/admin/login/";
        }
    }
}
