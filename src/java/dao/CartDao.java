/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.*;

/**
 *
 * @author dovan
 */
public class CartDao {

    private DateFormat sdf = new SimpleDateFormat("HH:mm:ss dd-MM-yyyy");

    Connection conn = null;

    public CartDao() {
    }

    public int insertCart(Cart cart) {
        int id = -1;
        Connection conn = null;

        String query = "insert into cart(user_id, status_id, total_cost, shipping_address,phone_number, day_create, day_modify) "
                + " values(" + cart.getUser_id() + ","
                + " 1, " + cart.getTotal_cost() + ","
                + " '" + cart.getShipping_address() + "',"
                + " '" + cart.getPhone_number() + "',"
                + " " + cart.getDay_create() + ","
                + " " + cart.getDay_modify() + ")";
        PreparedStatement ps = null;

        try {
            conn = MysqlManager.getInstance().connection();
            ps = conn.prepareStatement(query);
            ps.execute();

            query = "SELECT LAST_INSERT_ID() as id ";
            ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            rs.next();
            id = rs.getInt("id");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return id;
    }

    public void insertCartdetail(int cart_id, int product_id, int quantity) {
        Connection conn = null;

        String query = "insert into cartdetail(cart_id,product_id, quantity) "
                + " values(" + cart_id + ", " + product_id + ", " + quantity + ")";
        PreparedStatement ps = null;

        try {
            conn = MysqlManager.getInstance().connection();
            ps = conn.prepareStatement(query);
            ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Cart> getListAll() {
        List<Cart> result = new ArrayList<>();

        String query = "SELECT c.*, s.`status_name`, u.`email` FROM cart c "
                + " INNER JOIN `status` s ON c.`status_id` = s.`id` "
                + " INNER JOIN `user` u ON c.`user_id` = u.`id` ";

        PreparedStatement ps = null;
        try {
            conn = MysqlManager.getInstance().connection();
            ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cart cart = new Cart();
                cart.setId(rs.getInt("id"));
                cart.setEmail(rs.getString("email"));
                cart.setTotal_cost(rs.getDouble("total_cost"));
                cart.setDate_create(sdf.format(new Date(rs.getLong("day_create"))));
                cart.setDate_modify(sdf.format(new Date(rs.getLong("day_modify"))));
                cart.setShipping_address(rs.getString("shipping_address"));
                cart.setDiscount(rs.getDouble("discount"));
                cart.setPhone_number(rs.getString("phone_number"));
                cart.setStatus_name(rs.getString("status_name"));

                result.add(cart);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
    
      public List<Cart> getListAllByIdUser(int id) {
        List<Cart> result = new ArrayList<>();

        String query = "SELECT c.*, s.`status_name` FROM cart c "
                + " INNER JOIN `status` s ON c.`status_id` = s.`id` "
                + " where c.user_id = " + id;

        PreparedStatement ps = null;
        try {
            conn = MysqlManager.getInstance().connection();
            ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cart cart = new Cart();
                cart.setId(rs.getInt("id"));
                cart.setTotal_cost(rs.getDouble("total_cost"));
                cart.setDate_create(sdf.format(new Date(rs.getLong("day_create"))));
                cart.setDate_modify(sdf.format(new Date(rs.getLong("day_modify"))));
                cart.setShipping_address(rs.getString("shipping_address"));
                cart.setDiscount(rs.getDouble("discount"));
                cart.setPhone_number(rs.getString("phone_number"));
                cart.setStatus_name(rs.getString("status_name"));
                cart.setStatus_id(rs.getInt("status_id"));
                result.add(cart);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public List<Product> getProductByCartId(int id) {
        List<Product> result = new ArrayList<>();
        Product product;
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            String query = "SELECT p.*, cd.`quantity` FROM `product` p "
                    + " INNER JOIN `cartdetail` cd ON p.`id` = cd.`product_id` "
                    + " WHERE cd.`cart_id` = " + id;
            ProductDao productDao = new ProductDao();
            conn = MysqlManager.getInstance().connection();
            ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                product = new Product();
                int idP = rs.getInt("id");
                product.setId(idP);
                product.setProduct_name(rs.getString("product_name"));
                product.setPrice(rs.getDouble("price"));
                product.setDiscount(rs.getDouble("discount"));
                product.setQuantity(rs.getInt("quantity"));
                product.setListImage(productDao.getLinkImage(idP));
                
                result.add(product);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
}
