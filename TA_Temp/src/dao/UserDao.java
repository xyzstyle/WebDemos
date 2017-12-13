package dao;

import connection.DatabaseConnection;
import model.UserModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
    private DatabaseConnection connection = null;

    private UserModel userModel;

    public UserDao() {
        connection = new DatabaseConnection();
    }

    public boolean userLogin(UserModel model) {

        String sql = "select * from user where name='" + model.getName() + "' and password = '" + model.getPassword() + "'";
        ResultSet rs = connection.executeQuery(sql);
        try {
            rs.next();
            if (rs.getInt(4) == 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            connection.close();
        }

        return false;
    }
}
