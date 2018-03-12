/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.*;

/**
 *
 * @author dovan
 */
public class ProductDao {

    public ProductDao() {
    }

    public List<Product> getAll() {
        List<Product> result = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            String query = "select * from  product ";

            conn = MysqlManager.getInstance().connection();
            ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            Product product;
            while (rs.next()) {
                product = new Product();
                int id = rs.getInt("id");
                product.setId(id);
                product.setProduct_name(rs.getString("product_name"));
                product.setPrice(rs.getDouble("price"));
                product.setDiscount(rs.getDouble("discount"));
                product.setFull_description(rs.getString("full_description"));
                product.setDay_create(rs.getLong("day_create"));

                List<String> listImg = getLinkImage(id);

                while (listImg.size() < 5 && listImg.size() > 0) {
                    listImg.addAll(listImg);
                }
                product.setListImage(listImg);

                result.add(product);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public List<Product> getTop4Newest() {
        List<Product> result = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            String query = "select * from  product order by day_create  limit 4";

            conn = MysqlManager.getInstance().connection();
            ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            Product product;
            while (rs.next()) {
                product = new Product();
                int id = rs.getInt("id");
                product.setId(id);
                product.setProduct_name(rs.getString("product_name"));
                product.setPrice(rs.getDouble("price"));
                product.setDiscount(rs.getDouble("discount"));
                product.setFull_description(rs.getString("full_description"));

                List<String> listImg = getLinkImage(id);

                while (listImg.size() < 5 && listImg.size() > 0) {
                    listImg.addAll(listImg);
                }
                product.setListImage(listImg);

                result.add(product);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public List<Product> getRelatedProduct(int productId) {
        List<Product> result = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            String query = "SELECT pr.*"
                    + " FROM product as  pr"
                    + " INNER JOIN product_category prc ON pr.id = prc.product_id"
                    + " WHERE prc.category_id IN ("
                    + " SELECT pc.category_id"
                    + " FROM product p"
                    + " INNER JOIN product_category pc ON p.id = pc.product_id "
                    + " WHERE p.id = " + productId + ")"
                    + " AND pr.id != " + productId;

            conn = MysqlManager.getInstance().connection();
            ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            Product product;
            while (rs.next()) {
                product = new Product();
                int id = rs.getInt("id");
                product.setId(id);
                product.setProduct_name(rs.getString("product_name"));
                product.setPrice(rs.getDouble("price"));
                product.setDiscount(rs.getDouble("discount"));
                product.setFull_description(rs.getString("full_description"));
                List<String> listImg = getLinkImage(id);

                while (listImg.size() < 5 && listImg.size() > 0) {
                    listImg.addAll(listImg);
                }
                product.setListImage(listImg);
                result.add(product);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

//    public static void main(String[] args) {
//        System.out.println(new ProductDao().getRelatedProduct(1).size());
//    }
    public List<String> getLinkImage(int id) {
        List<String> result = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            String query = "select link_image from  productdetail where product_id = " + id;

            conn = MysqlManager.getInstance().connection();
            ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                result.add(rs.getString("link_image"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public Product getProductById(int id) {
        Product product = new Product();
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            String query = "select * from  product where id = " + id + " limit 1";

            conn = MysqlManager.getInstance().connection();
            ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                product.setId(id);
                product.setProduct_name(rs.getString("product_name"));
                product.setPrice(rs.getDouble("price"));
                product.setDiscount(rs.getDouble("discount"));
                product.setListImage(getLinkImage(id));
                product.setDay_create(rs.getLong("day_create"));
                product.setFull_description(rs.getString("full_description"));
                product.setSort_description(rs.getString("sort_description"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return product;
    }

    public List<Product> getProductByCategory(String category_path) {
        List<Product> result = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            String query = "SELECT p.* "
                    + " FROM product p"
                    + " INNER JOIN product_category pc ON p.id = pc.product_id"
                    + " INNER JOIN category c ON c.id = pc.category_id"
                    + " WHERE c.category_path = '" + category_path + "'"
                    + " order by day_create desc ";

            conn = MysqlManager.getInstance().connection();
            ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            Product product;
            while (rs.next()) {
                product = new Product();
                int id = rs.getInt("id");
                product.setId(id);
                product.setProduct_name(rs.getString("product_name"));
                product.setPrice(rs.getDouble("price"));
                product.setDiscount(rs.getDouble("discount"));
                product.setFull_description(rs.getString("full_description"));

                List<String> listImg = getLinkImage(id);

                while (listImg.size() < 5 && listImg.size() > 0) {
                    listImg.addAll(listImg);
                }
                product.setListImage(listImg);

                result.add(product);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public List<Product> getProductByIdCart(int idCart) {
        List<Product> result = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            String query = "SELECT p.*, cd.quantity "
                    + "FROM product p "
                    + "INNER JOIN `cartdetail` cd ON p.`id` = cd.`product_id` "
                    + "WHERE cd.`cart_id` = " + idCart;

            conn = MysqlManager.getInstance().connection();
            ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            Product product;
            while (rs.next()) {
                product = new Product();
                int id = rs.getInt("id");
                product.setId(id);
                product.setProduct_name(rs.getString("product_name"));
                product.setPrice(rs.getDouble("price"));
                product.setDiscount(rs.getDouble("discount"));
                product.setFull_description(rs.getString("full_description"));
                product.setQuantity(rs.getInt("quantity"));

                List<String> listImg = getLinkImage(id);

                while (listImg.size() < 5 && listImg.size() > 0) {
                    listImg.addAll(listImg);
                }
                product.setListImage(listImg);

                result.add(product);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public int addProduct(Product product) {
        Connection connection = null;
        int id = -1;
        PreparedStatement ps = null;
        String query = "insert into product(product_name, price, discount, sort_description,full_description, day_create ) "
                + " values('" + product.getProduct_name() + "' ,"
                + " " + product.getPrice() + " , "
                + " " + product.getDiscount() + " , "
                + " '" + product.getSort_description() + "' , "
                + " '" + product.getFull_description() + "' , "
                + " " + product.getDay_create() + ")";
        try {
            connection = MysqlManager.getInstance().connection();

            ps = connection.prepareStatement(query);
            ps.executeUpdate();

            query = "SELECT LAST_INSERT_ID() as id ";
            ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            rs.next();
            id = rs.getInt("id");
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return id;
    }

    public void addProductCate(int idProduct, int idCat) {
        Connection connection = null;
        PreparedStatement ps = null;
        String query = "insert into product(product_id, category_id) "
                + " values(" + idProduct + ", " + idCat + ")";
        try {
            connection = MysqlManager.getInstance().connection();

            ps = connection.prepareStatement(query);
            ps.executeUpdate();

            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
