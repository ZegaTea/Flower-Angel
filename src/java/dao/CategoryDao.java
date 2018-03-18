package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import model.Category;

public class CategoryDao {

    public List<Category> getAllCat() {
        List<Category> result = new ArrayList<Category>();
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            String query = "select id,category_name, category_path from category";
            conn = MysqlManager.getInstance().connection();

            ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            Category cat;
            while (rs.next()) {
                cat = new Category();
                cat.setId(rs.getInt("id"));
                cat.setCategory_name(rs.getString("category_name"));
                cat.setCategory_path(rs.getString("category_path"));
                result.add(cat);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public Category getCategoryById(int id) {
        Category result = new Category();
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            String query = "select id,category_name, category_path from category"
                    + " where id = " + id;
            conn = MysqlManager.getInstance().connection();

            ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            Category cat;
            while (rs.next()) {
                result.setId(rs.getInt("id"));
                result.setCategory_name(rs.getString("category_name"));
                result.setCategory_path(rs.getString("category_path"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public void updateCategory(Category category) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            String query = "update category "
                    + " set category_name = '" + category.getCategory_name() + "',"
                    + " category_path = '" + category.getCategory_path() + "' "
                    + " where id = " + category.getId();
            conn = MysqlManager.getInstance().connection();

            ps = conn.prepareStatement(query);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addCategory(Category category) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            String query = "insert into category(category_name, category_path) "
                    + " values('" + category.getCategory_name() + "', '" + category.getCategory_path() + "')";
            conn = MysqlManager.getInstance().connection();

            ps = conn.prepareStatement(query);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean delCategory(int id) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            String query = "delete from category where id  = " + id;
            conn = MysqlManager.getInstance().connection();

            ps = conn.prepareStatement(query);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
