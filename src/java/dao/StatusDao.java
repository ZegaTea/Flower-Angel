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
import model.Status;

/**
 *
 * @author dovan
 */
public class StatusDao {

    Connection conn = null;

    public List<Status> getListAll() {
        PreparedStatement ps = null;
        String query = "select * from status";
        List<Status> result = new ArrayList<>();
        try {
            conn = MysqlManager.getInstance().connection();
            ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("status_name");
                result.add(new Status(id, name));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public Status getStatusById(int idS) {
        PreparedStatement ps = null;
        String query = "select * from status where id = " + idS;
        Status result = new Status();
        try {
            conn = MysqlManager.getInstance().connection();
            ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("status_name");
                result.setId(id);
                result.setStatus_name(name);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public void addStatus(String name) {
        PreparedStatement ps = null;
        String query = "insert into status(status_name) values('" + name + "')";
        try {
            conn = MysqlManager.getInstance().connection();
            ps = conn.prepareStatement(query);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateStatus(String name, int id) {
        PreparedStatement ps = null;
        String query = "update status set status_name = '" + name + "' where id = " + id;
        try {
            conn = MysqlManager.getInstance().connection();
            ps = conn.prepareStatement(query);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
