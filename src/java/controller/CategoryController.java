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
import dao.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import util.Constants;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.*;
import service.CategoryService;
import service.ProductService;

@Controller
@RequestMapping(value = "/danh-muc")
public class CategoryController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(ModelMap mm) {
        ProductService productService = new ProductService();
        CategoryService categoryService = new CategoryService();
        Category firstCate = categoryService.getAllCat().get(0);
        List<Product> listProduct = productService.getProductByCategory(firstCate.getCategory_path());

        mm.put("listProductCat", listProduct
                .stream()
                .limit(Constants.LIMIT)
                .collect(Collectors.toList()));
        mm.put("nameCat", firstCate.getCategory_name());
        mm.put("pathCat", firstCate.getCategory_path());

        int totalRecord = listProduct.size();

        int maxPage = 5;
        int totalPage = 0;
        int page = 1;
        totalPage = totalRecord / Constants.LIMIT;
        totalRecord = totalRecord - (totalPage * Constants.LIMIT);
        if (totalRecord > 0) {
            totalPage++;
        }

        int startPageIndex = Math.max(1, page - maxPage / 2);
        int endPageIndex = Math.min(totalPage, page + maxPage / 2);

        mm.put("Page", page);
        mm.put("TotalPage", totalPage);
        mm.put("MaxPage", maxPage);
        mm.put("First", 1);
        mm.put("Last", totalPage);
        mm.put("Next", page + 1);
        mm.put("Prev", page - 1);
        mm.put("startPageIndex", startPageIndex);
        mm.put("endPageIndex", endPageIndex);

        return "category/index";
    }

    @RequestMapping(value = "/{pathCate}/page-{pageNumber}", method = RequestMethod.GET)
    public String dividePage(ModelMap mm,
             @PathVariable(value = "pathCate") String pathCate,
             @PathVariable(value = "pageNumber") int pageNumber) {

        ProductService productService = new ProductService();
        CategoryService categoryService = new CategoryService();
        Category firstCate = categoryService.getAllCat()
                .stream()
                .filter(x -> x.getCategory_path().equals(pathCate))
                .findFirst()
                .get();
        List<Product> listProduct = productService.getProductByCategory(firstCate.getCategory_path());

        mm.put("listProductCat", listProduct
                .stream()
                .skip(pageNumber * Constants.LIMIT)
                .limit(Constants.LIMIT)
                .collect(Collectors.toList()));
        mm.put("nameCat", firstCate.getCategory_name());
        mm.put("pathCat", firstCate.getCategory_path());

        int totalRecord = listProduct.size();

        int maxPage = 5;
        int totalPage = 0;
        int page = pageNumber;
        totalPage = totalRecord / Constants.LIMIT;
        totalRecord = totalRecord - (totalPage * Constants.LIMIT);
        if (totalRecord > 0) {
            totalPage++;
        }

        int startPageIndex = Math.max(1, page - maxPage / 2);
        int endPageIndex = Math.min(totalPage, page + maxPage / 2);

        mm.put("Page", page);
        mm.put("TotalPage", totalPage);
        mm.put("MaxPage", maxPage);
        mm.put("First", 1);
        mm.put("Last", totalPage);
        mm.put("Next", page + 1);
        mm.put("Prev", page - 1);
        mm.put("startPageIndex", startPageIndex);
        mm.put("endPageIndex", endPageIndex);
        
        return "category/index";
    }
}
