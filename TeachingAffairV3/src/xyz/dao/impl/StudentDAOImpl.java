package xyz.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import xyz.connection.Database;
import xyz.dao.StudentDAO;
import xyz.model.StudentModel;

public class StudentDAOImpl implements StudentDAO {

    private Connection connection;
    private PreparedStatement ps;

    public StudentDAOImpl() {

    }

    @Override
    public boolean addStudent(StudentModel student) {
        connection = Database.getConnection();
        String sql = "insert into student(name,password,address) values(?,?,?)";
        int rows = 0;
        try {
            ps = connection.prepareStatement(sql);
            int i = 1;
            ps.setString(i++, student.getName());
            ps.setString(i++, student.getPassword());
            ps.setString(i++, student.getAddress());
            rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            closePS(ps);
            Database.releaseConnection(connection);
        }

    }

    @Override
    public boolean updateStudent(StudentModel student) {
        connection = Database.getConnection();
        String sqlString = "update student set name=?,password=?,address=? where id=?";
        int rows = 0;
        try {
            ps = connection.prepareStatement(sqlString.toString());
            int i = 1;
            ps.setString(i++, student.getName());
            ps.setString(i++, student.getPassword());
            ps.setString(i++, student.getAddress());
            ps.setInt(i++, student.getId());
            rows=ps.executeUpdate();
            ps.close();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            closePS(ps);
            Database.releaseConnection(connection);
        }

    }

    @Override
    public boolean deleteStudent(StudentModel student) {
        connection = Database.getConnection();
        String sqlString = "delete from student where id=?";
        int rows = 0;
        try {
            ps = connection.prepareStatement(sqlString);
            ps.setInt(1, student.getId());
            rows=ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            closePS(ps);
            Database.releaseConnection(connection);
        }

    }

    @Override
    public List<StudentModel> getAllStudents() {

        connection = Database.getConnection();
        try {
            ps = connection.prepareStatement("select * from student ");
            ResultSet rs = ps.executeQuery();
            List<StudentModel> list = new ArrayList<StudentModel>();
            while (rs.next()) {
                StudentModel studentModel = new StudentModel();
                int i = 1;
                studentModel.setId(rs.getInt(i++));
                studentModel.setName(rs.getString(i++));
                studentModel.setPassword(rs.getString(i++));
                studentModel.setAddress(rs.getString(i++));
                list.add(studentModel);

            }
            rs.close();
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            closePS(ps);
            Database.releaseConnection(connection);
        }

    }

    @Override
    public List<StudentModel> getStudents(int curPage, int perpage) {
        connection = Database.getConnection();
        try {
            ps = connection.prepareStatement("select * from student limit ?,?");
            ps.setInt(1, (curPage - 1) * perpage);
            ps.setInt(2, perpage);
            ResultSet rs = ps.executeQuery();
            List<StudentModel> list = new ArrayList<StudentModel>();
            while (rs.next()) {
                StudentModel studentModel = new StudentModel();
                int i = 1;
                studentModel.setId(rs.getInt(i++));
                studentModel.setName(rs.getString(i++));
                studentModel.setPassword(rs.getString(i++));
                studentModel.setAddress(rs.getString(i++));
                list.add(studentModel);

            }
            rs.close();
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            closePS(ps);
            Database.releaseConnection(connection);
        }

    }

    @Override
    public StudentModel getByID(long id) {
        connection = Database.getConnection();
        try {
            ps = connection.prepareStatement("select * from student where id=?");
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            int i = 1;
            StudentModel studentModel = new StudentModel();
            studentModel.setId(rs.getInt(i++));
            studentModel.setName(rs.getString(i++));
            studentModel.setPassword(rs.getString(i++));
            studentModel.setAddress(rs.getString(i));
            return studentModel;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            closePS(ps);
            Database.releaseConnection(connection);
        }

    }

    private static void closePS(PreparedStatement ps) {
        try {
            if (ps != null)
                ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
