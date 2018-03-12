package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.User;

public class UserDao {

    public UserDao() {
    }

    public User getUserInfo(int id) {
        User user = new User();
        Connection conn = null;

        String query = "select * from user where id = " + id + " limit 1";
        PreparedStatement ps = null;

        try {
            conn = MysqlManager.getInstance().connection();
            ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user.setAddress(rs.getString("address"));
                user.setDob(rs.getString("dob"));
                user.setEmail(rs.getString("email"));
                user.setGender(rs.getString("gender"));
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setPhone_number(rs.getString("phone_number"));
            }

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public int checkLogin(String username, String password) {
        Connection conn = null;

        int id = -1;

        String query = "select count(*) as C from user "
                + " where username = '" + username + "' and password = '" + password + "'"
                + " and role = 0";
        PreparedStatement ps = null;
        int count = 0;
        try {
            conn = MysqlManager.getInstance().connection();
            ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            rs.next();
            count = rs.getInt("C");

            if (count == 1) {
                query = "select id from user "
                        + " where username = '" + username + "' and password = '" + password + "' limit 1";
                ps = conn.prepareStatement(query);
                rs = ps.executeQuery();
                rs.next();
                id = rs.getInt("id");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return id;
    }

    public int createUserFastBuy(User user) {
        Connection conn = null;

        int id = -1;
        PreparedStatement ps = null;
        String query = "insert into user(email, name, address, phone_number, role)"
                + " values('" + user.getEmail() + "',"
                + " '" + user.getName() + "',"
                + " '" + user.getAddress() + "',"
                + " '" + user.getPhone_number() + "', 0 )";

        String generatedColumns[] = {"id"};
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

//    public static void main(String[] args) {
//        User u = new User();
//        u.setAddress("asdasd");
//        u.setEmail("asda@asdad");
//        u.setName("asdasd");
//        u.setPhone_number("234629346");
//
//        System.out.println(new UserDao().createUserFastBuy(u));
//    }
    public int getAdminId(String name, String pass) {
        Connection conn = null;
        PreparedStatement ps = null;
        int id = -1;

        String query = "select count(*) as c from user "
                + " where username = '" + name + "' and password = '" + pass + "' and role = 1";

        try {
            conn = MysqlManager.getInstance().connection();
            ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            rs.next();
            int count = rs.getInt("c");
            if (count == 1) {
                query = "select id from user "
                        + " where username = '" + name + "' and password = '" + pass + "' and role = 1";
                ps = conn.prepareStatement(query);
                rs = ps.executeQuery();
                rs.next();
                id = rs.getInt("id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id;
    }

}
