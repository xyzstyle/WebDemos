/*
 * Created on 2015-11-10
 *
 * 
 */
package xyz.dao;

import java.util.List;
import xyz.model.StudentModel;

/**
 * @author xyz
 *        
 */
public interface StudentDAO {


	public boolean addStudent(StudentModel student) ;

	public boolean updateStudent(StudentModel student) ;

	public boolean deleteStudent(StudentModel student) ;

	public List<StudentModel> getAllStudents() ;

	public List<StudentModel> getStudents(int curPage, int perpage) ;

	public StudentModel getByID(long id) ;

}
