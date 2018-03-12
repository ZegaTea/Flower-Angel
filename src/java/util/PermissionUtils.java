/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import javax.servlet.http.HttpSession;

/**
 *
 * @author dovan
 */
public class PermissionUtils {

    public static boolean checkLogin(HttpSession session) {
        if (session.getAttribute(Constants.ADMIN_ID) == null) {
            return false;
        }
        int id = Integer.valueOf(session.getAttribute(Constants.ADMIN_ID).toString());
        if (id == -1) {
            return false;
        }
        return true;
    }
}
