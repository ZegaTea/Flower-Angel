package dao;

import java.sql.DriverManager;
import java.sql.SQLException;

import util.Constants;
import java.sql.Connection;

public class MysqlManager {

    private static volatile MysqlManager instance = null;
    private Connection session;

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private MysqlManager() {
        try {
            session = DriverManager.getConnection(Constants.URL_MYSQL, Constants.USER_MYSQL, Constants.PASS_MYSQL);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static MysqlManager getInstance() {
        if (instance == null) {
            synchronized (MysqlManager.class) {
                if (instance == null) {
                    instance = new MysqlManager();
                }
            }
        }
        return instance;
    }

    public Connection connection() {
        try {
            if (session.isClosed()) {
                session = DriverManager.getConnection(Constants.URL_MYSQL, Constants.USER_MYSQL, Constants.PASS_MYSQL);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return session;
    }
}
