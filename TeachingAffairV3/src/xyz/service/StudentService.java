package xyz.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import xyz.connection.Database;
import xyz.dao.StudentDAO;
import xyz.dao.impl.StudentDAOImpl;
import xyz.model.StudentModel;

public class StudentService extends BaseService {
	private StudentDAO studentDAO;
	
	public StudentService(){
		
			studentDAO = new StudentDAOImpl();
	}

	public boolean addStudent(StudentModel student) {
		Connection connection = null;
		try {
			studentDAO.addStudent(student);
			Database.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			message = e.getMessage();
			Database.rollback();
			return false;
		} finally {
			Database.releaseConnection(connection);
		}
	}

	public boolean updateStudent(StudentModel student) {
		Connection connection = null;
		try {
			
			studentDAO.updateStudent(student);
			Database.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			message = e.getMessage();
			Database.rollback();
			return false;
		} finally {
			Database.releaseConnection(connection);
		}
	}

	public boolean deleteStudent(StudentModel student) {
		Connection connection = null;
		try {
			
			studentDAO.deleteStudent(student);
			// 此处可以删除该学生的成绩表中的成绩等
			Database.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			message = e.getMessage();
			Database.rollback();
			return false;
		} finally {
			Database.releaseConnection(connection);
		}
	}

	public List<StudentModel> listAllStudents() {
		Connection connection = null;
		try {
			
			return studentDAO.listAllStudents();
		} catch (Exception e) {
			e.printStackTrace();
			message = e.getMessage();
			Database.rollback();
		} finally {
			Database.releaseConnection(connection);
		}
		return new ArrayList<StudentModel>();
	}

	public StudentModel getByID(int id) {
		Connection conn = null;
		try {
			

			StudentModel student = studentDAO.getByID(id);
			Database.commit();
			return student;
		} catch (Exception e) {
			e.printStackTrace();
			message = e.getMessage();
			return null;
		} finally {
			Database.releaseConnection(conn);
		}
	}

	public List<StudentModel> listStudents(int pageNo, int pageSize) {

		
		try {
			
			return studentDAO.listStudents(pageNo, pageSize);
		} catch (Exception e) {
			e.printStackTrace();
			message = e.getMessage();
			return null;
		} 

	}
}
