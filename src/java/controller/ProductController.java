/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.liferay.portal.kernel.json.JSONObject;
import dao.ProductDao;
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
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.util.StringPool;
import com.sun.org.apache.bcel.internal.classfile.Code;
import dao.CartDao;
import dao.UserDao;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import org.springframework.http.MediaType;
import service.CartService;
import service.ProductService;
import util.EmailUtils;

/**
 *
 * @author dovan
 */
@Controller
@RequestMapping(value = "/san-pham")
public class ProductController {

    @RequestMapping(value = "/chi-tiet-{productId}", method = RequestMethod.GET)
    public String getProductDetailById(ModelMap mm, @PathVariable(value = "productId") int productId) {

        ProductService productService = new ProductService();

        Product product = productService.getProductById(productId);

        mm.put("productDetail", product);

        List<Product> listRelaProduct = productService.getRelatedProduct(productId);

        mm.put("listRela", listRelaProduct);

        return "product/detail";
    }

    @RequestMapping(value = "/them-gio-hang1", method = RequestMethod.GET, consumes = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    String addToCartAjax(HttpServletRequest request) {
        String response = "{\"msg\":\"success\"}";

        HttpSession session = request.getSession();
        ProductService productService = new ProductService();
        List<Product> listCart = null;
        String x = request.getParameter("idP");
        int id = Integer.valueOf(x);
        Product product = null;
        if (session.getAttribute(Constants.CART) == null) {
            listCart = new ArrayList<>();

            product = productService.getProductById(id);
            product.setQuantity(1);
            listCart.add(product);
        } else {
            listCart = (ArrayList<Product>) session.getAttribute(Constants.CART);
            int state = 0;
            for (int i = 0; i < listCart.size(); i++) {
                if (listCart.get(i).getId() == id) {
                    product = listCart.get(i);
                    product.setQuantity(product.getQuantity() + 1);
                    listCart.set(i, product);
                    state = 1;
                    break;
                }
            }

            if (state == 0) {
                product = productService.getProductById(id);
                product.setQuantity(1);
                listCart.add(product);
            }
        }
        float total = 0;
        for (Product pr : listCart) {
            total = total + (float) (pr.getPrice() * pr.getQuantity() * (100 - pr.getDiscount()) / 100);
        }
        session.setAttribute(Constants.TOTAL, total);
        session.setAttribute(Constants.CART, listCart);

        return response;
    }

    @RequestMapping(value = "/them-gio-hang", method = RequestMethod.GET)
    public String addToCartWithQuantity(HttpServletRequest request, @RequestParam(value = "id") int id,
            @RequestParam(value = "quantity") int quantity) {
        HttpSession session = request.getSession();
        ProductService productService = new ProductService();
        List<Product> listCart = null;
        Product product = null;

        if (session.getAttribute(Constants.CART) == null) {
            listCart = new ArrayList<>();

            product = productService.getProductById(id);
            product.setQuantity(quantity);
            listCart.add(product);
        } else {
            listCart = (ArrayList<Product>) session.getAttribute(Constants.CART);
            int state = 0;
            for (int i = 0; i < listCart.size(); i++) {
                if (listCart.get(i).getId() == id) {
                    product = listCart.get(i);
                    product.setQuantity(product.getQuantity() + quantity);
                    listCart.set(i, product);
                    state = 1;
                    break;
                }
            }

            if (state == 0) {
                product = productService.getProductById(id);
                product.setQuantity(quantity);
                listCart.add(product);
            }
        }

        float total = 0;
        for (Product pr : listCart) {
            total = total + (float) (pr.getPrice() * pr.getQuantity() * (100 - pr.getDiscount()) / 100);
        }
        session.setAttribute(Constants.TOTAL, total);
        session.setAttribute(Constants.CART, listCart);

        return "redirect:/trang-chu/";
    }

    @RequestMapping(value = "/thanh-toan", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public String order(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        response.setCharacterEncoding("UTF-8"); // this line solves the problem
        response.setContentType("text/html");
        Cart cart = new Cart();
        String email = request.getParameter("cusEmail");
        String name = request.getParameter("cusName");
        String phoneNumber = request.getParameter("cusPhone");
        String address = request.getParameter("cusAddress");

        if (session.getAttribute(Constants.USER) == null) {
            User user = new User();
            user.setAddress(address);
            user.setEmail(email);
            user.setName(name);
            user.setPhone_number(phoneNumber);

            UserDao userDao = new UserDao();
            cart.setUser_id(userDao.createUserFastBuy(user));
        } else {
            User u = (User) session.getAttribute(Constants.USER);
            cart.setUser_id(u.getId());
        }

        cart.setShipping_address(address);
        cart.setPhone_number(phoneNumber);
        float total = Float.valueOf(session.getAttribute(Constants.TOTAL).toString());
        cart.setTotal_cost(total);
        long date = Calendar.getInstance().getTimeInMillis();
        cart.setDay_create(date);
        cart.setDay_modify(date);

        CartService cartService = new CartService();
        List<Product> listProduct = (ArrayList<Product>) session.getAttribute(Constants.CART);
        int idCart = cartService.addToCart(cart, listProduct);
        String msg = "";
        for (Product pr : listProduct) {
            msg += ("+Mã sản phẩm: " + pr.getId() + "\n\t Tên sản phẩm: " + pr.getProduct_name() + "\n\t Số lượng: " + pr.getQuantity() + "\n");
        }

        if (idCart != -1) {
            EmailUtils.sendEmail(idCart, total, msg, email);
        }

        session.setAttribute(Constants.BUY_SUCCESS, 1);
        session.removeAttribute(Constants.CART);
        session.removeAttribute(Constants.TOTAL);

        return "redirect:/trang-chu/";
    }

    @RequestMapping(value = "/don-hang")
    public String cart(HttpServletRequest request, ModelMap mm) {
        HttpSession session = request.getSession();
        CartService cartService = new CartService();
        ProductService productService = new ProductService();
        User user = (User) session.getAttribute(Constants.USER);

        List<Cart> listCart = cartService.getListAllByIdUser(user.getId());
        List<ProductCart> listProduct = new ArrayList<>();
        for (Cart c : listCart) {
            listProduct.add(new ProductCart(c.getId(), productService.getProductByIdCart(c.getId())));
        }
        mm.put("listCartProduct", listCart);
        mm.put("listProduct", listProduct);
        return "product/cart";
    }
    
    @RequestMapping(value = "/tim-don-hang")
    public String cart2(HttpServletRequest request, ModelMap mm, @RequestParam(value = "id") int id) {
        HttpSession session = request.getSession();
        ProductService productService = new ProductService();
        User user = (User) session.getAttribute(Constants.USER);

        List<Product> listProduct = productService.getProductByIdCart(id);
        
        mm.put("listProductSingle", listProduct);
        mm.put("invoiceId", id);
        return "product/cart";
    }

    @RequestMapping(value = "/xoa-{id}", method = RequestMethod.GET)
    public String removeCartItem(HttpServletRequest request, @PathVariable(value = "id") int id) {
        HttpSession session = request.getSession();
        List<Product> listCart = (ArrayList<Product>) session.getAttribute(Constants.CART);
        listCart = listCart.stream()
                .filter(x -> x.getId() != id)
                .collect(Collectors.toList());

        float total = 0;
        for (Product pr : listCart) {
            total = total + (float) (pr.getPrice() * pr.getQuantity() * (100 - pr.getDiscount()) / 100);
        }
        session.setAttribute(Constants.TOTAL, total);
        session.setAttribute(Constants.CART, listCart);
        String referer = request.getHeader("Referer");
        return "redirect:" + referer;
    }

    @RequestMapping(value = "/cap-nhat", method = RequestMethod.GET, consumes = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    String updateCartAjax(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Gson gson = new Gson();
        try {
            TypeToken<List<CartModel>> token = new TypeToken<List<CartModel>>() {
            };
            List<CartModel> listCartModel = gson.fromJson(request.getParameter("cartModel"), token.getType());
            List<Product> listProduct = (ArrayList<Product>) session.getAttribute(Constants.CART);

            for (CartModel item : listCartModel) {
                Product product = listProduct.stream()
                        .filter(x -> x.getId() == item.getProductId())
                        .findFirst()
                        .get();
                listProduct = listProduct.stream()
                        .filter(x -> x.getId() != item.getProductId())
                        .collect(Collectors.toList());

                product.setQuantity(Integer.valueOf(item.getQuantity()));

                listProduct.add(product);
            }

            session.setAttribute(Constants.CART, listProduct);

            float total = 0;
            for (Product pr : listProduct) {
                total = total + (float) (pr.getPrice() * pr.getQuantity() * (100 - pr.getDiscount()) / 100);
            }
            session.setAttribute(Constants.TOTAL, total);
        } catch (Exception ex) {
            ex.printStackTrace();
            return Constants.JSON_ERROR;
        }
        return Constants.JSON_SUCCESS;
    }
}
