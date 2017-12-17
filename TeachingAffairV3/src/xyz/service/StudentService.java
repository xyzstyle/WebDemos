package xyz.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import xyz.connection.Database;
import xyz.dao.StudentDAO;
import xyz.dao.impl.StudentDAOImpl;
import xyz.model.StudentModel;

public class StudentService {
    private StudentDAO studentDAO;

    public StudentService() {

        studentDAO = new StudentDAOImpl();
    }

    public boolean addStudent(StudentModel student) {

        return studentDAO.addStudent(student);


    }

    public boolean updateStudent(StudentModel student) {


        return studentDAO.updateStudent(student);

    }

    public boolean deleteStudent(StudentModel student) {


        return studentDAO.deleteStudent(student);

    }

    public List<StudentModel> listAllStudents() {

        return studentDAO.listAllStudents();

    }

    public StudentModel getByID(int id) {
        return studentDAO.getByID(id);
    }

    public List<StudentModel> listStudents(int pageNo) {
        //return studentDAO.listStudents(pageNo, PageCount.STUDENT_PAGE_COUNT);
        List<StudentModel> all=studentDAO.listAllStudents();
        List<StudentModel>  part=new ArrayList<>();
        for(int i=(pageNo-1)*PageCount.STUDENT_PAGE_COUNT;i<pageNo*PageCount.STUDENT_PAGE_COUNT;i++){
            if (i >= all.size()) {
                break;
            }
            part.add(all.get(i));
        }
        return part;
    }
}
