package xyz.dao.impl;

import xyz.connection.Database;;
import xyz.dao.UserDao;
import xyz.model.UserModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDaoImpl implements UserDao {
    private Connection connection;


    public int userLogin(UserModel model) {
        connection = Database.getConnection();
        String sql = "select * from user where name=? and password =?";
        PreparedStatement ps;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, model.getName());
            ps.setString(2, model.getPassword());
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt(4);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Database.releaseConnection(connection);
        }
        return -1;
    }
}
