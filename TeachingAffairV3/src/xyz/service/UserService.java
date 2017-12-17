package xyz.service;

import xyz.connection.Database;
import xyz.dao.StudentDAO;
import xyz.dao.UserDao;
import xyz.dao.impl.StudentDAOImpl;
import xyz.dao.impl.UserDaoImpl;
import xyz.model.StudentModel;
import xyz.model.UserModel;

import java.sql.Connection;

public class UserService {

    private UserDao userDao;

    public UserService() {
        userDao = new UserDaoImpl();
    }

    public int userLogin(UserModel user) {
        int level = userDao.userLogin(user);
        return level;
    }
}
