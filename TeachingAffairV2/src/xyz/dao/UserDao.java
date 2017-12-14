package xyz.dao;

import xyz.connection.DatabaseConnection;
import xyz.model.UserModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
    private DatabaseConnection connection = null;

    private UserModel userModel;

    public UserDao() {
        connection = new DatabaseConnection();
    }

    public int userLogin(UserModel model) {

        String sql = "select * from user where name='" + model.getName() + "' and password = '" + model.getPassword() + "'";
        ResultSet rs = connection.executeQuery(sql);
        try {
            rs.next();
            return rs.getInt(4);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            connection.close();
        }
        return -1;
    }
}
