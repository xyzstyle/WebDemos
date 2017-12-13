package dao;

import connection.DatabaseConnection;
import model.StudentModel;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentDao {

    /**
     * 本类的功能：实现表student的增删改查等功能。
     */

    private DatabaseConnection connection = null;

    private StudentModel studentModel;

    public StudentDao() {
        connection = new DatabaseConnection();
    }

    /**
     * @param operation 操作类型，可能值为增加，修改，删除(1,2,3)
     * @param model     学生用户对象，对象中的属性值作为SQL语句的参数出现
     * @return 布尔类型，如果操作成功，则返回true，否则false
     * @see StudentModel
     */
    public boolean operateStudent(int operation, StudentModel model) {
        boolean flag = false;
        String sql = null;
        if (operation == DaoOperatorMethod.RECORD_INSERT)
            sql = "insert into student(name,password,address) values ('" + model.getName() + "','" + model.getPassword()
                    + "','" + model.getAddress() + "')";
        if (operation == DaoOperatorMethod.RECORD_UPDATE)
            sql = "update student set name='" + model.getName() + "',password='" + model.getPassword() + "',address='"
                    + model.getAddress() + "' where id='" + model.getId() + "'";
        if (operation == DaoOperatorMethod.RECORD_DELETE)
            sql = "delete from student where id='" + model.getId() + "'";
        if (connection.executeUpdate(sql)) {
            flag = true;
        }
        connection.close();
        return flag;
    }

    /**
     * 查询所有学生资料，以List形式返回。
     *
     * @return 所有学生的列表。
     * @see StudentModel
     */
    public List<StudentModel> queryStudentList() {
        List<StudentModel> list = new ArrayList<StudentModel>();
        String sql = null;

        sql = "select * from student";

        ResultSet rs = connection.executeQuery(sql);
        try {
            while (rs.next()) {
                studentModel = new StudentModel();
                studentModel.setId(rs.getInt(1));
                studentModel.setName(rs.getString(2));
                studentModel.setPassword(rs.getString(3));
                studentModel.setAddress(rs.getString(4));
                list.add(studentModel);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        connection.close();
        return list;
    }

    /**
     * 根据某个id值，找到特定学生。
     *
     * @param id 学生id
     * @return 某个学生，对应studentModel对象
     * @see StudentModel
     */
    public StudentModel queryStudentModel(Integer id) {
        String sql = "select * from student where id=" + id;
        ResultSet rs = connection.executeQuery(sql);
        try {
            rs.next();
            studentModel = new StudentModel();
            studentModel.setId(rs.getInt(1));
            studentModel.setName(rs.getString(2));
            studentModel.setPassword(rs.getString(3));
            studentModel.setAddress(rs.getString(4));

        } catch (SQLException e) {
            e.printStackTrace();
        }
        connection.close();
        return studentModel;
    }
}
