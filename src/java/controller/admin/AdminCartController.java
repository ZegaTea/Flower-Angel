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
import service.CartService;
import service.ProductService;
import util.Constants;
import util.PermissionUtils;

/**
 *
 * @author dovan
 */
@Controller
@RequestMapping(value = "/admin/don-hang")
public class AdminCartController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(HttpServletRequest request, ModelMap mm) {
        HttpSession session = request.getSession();

        if (PermissionUtils.checkLogin(session)) {
            CartService cartService = new CartService();

            mm.put("listCart", cartService.getListAll());
            return "admin/cart/index";
        } else {
            return "redirect:/admin/login/";
        }
    }
    
    @RequestMapping(value = "/chi-tiet-{id}", method = RequestMethod.GET)
    public String cartDetail(HttpServletRequest request, ModelMap mm, 
            @PathVariable(value = "id") int id){
        
        HttpSession session = request.getSession();

        if (PermissionUtils.checkLogin(session)) {
            ProductService productService = new ProductService();

            mm.put("listCartDetail", productService.getProductByIdCart(id));
            mm.put("idCart", id);
            return "admin/cart/detail";
        } else {
            return "redirect:/admin/login/";
        }
    }

}
