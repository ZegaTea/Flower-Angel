/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.*;
import dao.UserDao;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.ProductService;

/**
 *
 * @author dovan
 */
@Controller
@RequestMapping(value = "/trang-chu")
public class HomeController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(ModelMap mm) {
        //        CategoryService categoryService = new CategoryService();
//        ProductDao productDao = new ProductDao();
        ProductService productService = new ProductService();
        List<Product> listProduct = productService.getTop4Newest();
        mm.addAttribute("new_product", listProduct);

        return "home/index";
    }
}
