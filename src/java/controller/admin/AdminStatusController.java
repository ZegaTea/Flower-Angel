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
import service.StatusService;
import util.Constants;
import util.PermissionUtils;

/**
 *
 * @author dovan
 */
@Controller
@RequestMapping(value = "/admin/trang-thai")
public class AdminStatusController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(HttpServletRequest request, ModelMap mm) {
        HttpSession session = request.getSession();

        if (PermissionUtils.checkLogin(session)) {
            StatusService statusService = new StatusService();
            List<Status> listSt = statusService.getListAll();

            mm.put("listSt", listSt);
            return "admin/status/index";
        } else {
            return "redirect:/admin/login/";
        }
    }

    @RequestMapping(value = "/tim-kiem", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    public @ResponseBody
    String findStatus(HttpServletRequest request, HttpServletResponse response) {
        response.setCharacterEncoding("UTF-8"); // this line solves the problem
        response.setContentType("application/json");
        HttpSession session = request.getSession();
        if (PermissionUtils.checkLogin(session)) {
            StatusService statusService = new StatusService();
            String id = request.getParameter("id");
            Status status = statusService.getStatusById(Integer.valueOf(id));

            Gson gson = new Gson();
            String res = gson.toJson(status);
            return res;
        } else {
            return null;
        }
    }

    @RequestMapping(value = "/cap-nhat", method = RequestMethod.GET)
    public String editStatus(HttpServletRequest request,
            @RequestParam(value = "stId") int id,
            @RequestParam(value = "stName") String stName) {
        HttpSession session = request.getSession();
        if (PermissionUtils.checkLogin(session)) {
            StatusService statusService = new StatusService();
            statusService.updateStatus(stName, id);
            return "redirect:/admin/trang-thai/";
        } else {
            return "redirect:/admin/login/";
        }
    }

    @RequestMapping(value = "/them-moi", method = RequestMethod.GET)
    public String addCate(HttpServletRequest request,
            @RequestParam(value = "stName") String stName) {
        HttpSession session = request.getSession();
        if (PermissionUtils.checkLogin(session)) {
            StatusService statusService = new StatusService();
            statusService.addStatus(stName);

            return "redirect:/admin/trang-thai/";
        } else {
            return "redirect:/admin/login/";
        }
    }
}
