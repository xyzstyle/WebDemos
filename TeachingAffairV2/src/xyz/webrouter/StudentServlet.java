package xyz.webrouter;

import xyz.dao.StudentDao;
import xyz.model.StudentModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by xyz in WebDemos on 2017/12/13 .
 */
public class StudentServlet extends HttpServlet {

    private int method;
    private StudentDao studentDao;
    private StudentModel student = new StudentModel();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    public String formatStr(String str) {
        return str == null ? "" : str;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        this.method = Integer.parseInt(req.getParameter("method"));
        String id = req.getParameter("id");
        if (id != null) {
            student.setId(Integer.parseInt(id));
        }
        student.setName(formatStr(req.getParameter("name")));
        student.setPassword(formatStr(req.getParameter("password")));
        student.setAddress(formatStr(req.getParameter("address")));
        switch (method) {
            case 0:
                this.listStudents(req, resp);
                break;
            case 1:
                this.addStudent(req, resp);
                break;
            case 2:
                this.updateStudent(req, resp);
                break;
            case 3:
                this.deleteStudent(req, resp);
                break;
            case 4:
                this.modifyStudent(req,resp);
                break;
            default:
        }

    }

    private void listStudents(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        studentDao = new StudentDao();
        List<StudentModel> students = studentDao.queryStudentList();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/ListStudent.jsp");
        request.setAttribute("students", students);
        requestDispatcher.forward(request, response);
    }

    public void addStudent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(!student.getName().equals("")){
            String result;
            studentDao = new StudentDao();
            if (studentDao.operateStudent(method, student)) {
                result = "添加用户成功!";
            } else {
                result = "添加用户失败!";
            }
            request.setAttribute("result", result);
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/AddStudent.jsp");
        requestDispatcher.forward(request, response);
        // 不能够使用response.sendRedirect()方法
    }

    private void updateStudent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        studentDao = new StudentDao();
        if (studentDao.operateStudent(method, student)) {
            request.setAttribute("result", "<script language=javascript>alert('修改成功！');</script>");
        } else {
            request.setAttribute("result", "<script language=javascript>alert('修改失败！');</script>");
        }
        listStudents(request, response);
    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        studentDao = new StudentDao();
        if (studentDao.operateStudent(method, student)) {
            request.setAttribute("result", "<script language=javascript>alert('删除成功！');</script>");
        } else {
            request.setAttribute("result", "<script language=javascript>alert('删除失败！');</script>");
        }
        listStudents(request, response);
    }

    private void modifyStudent(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

        if (request.getParameter("id") == null) {
            response.sendRedirect("stu.do?method=0");
            return;
        }else {
            StudentModel student=null;
            studentDao = new StudentDao();
            student = studentDao.queryStudentModel(Integer.parseInt(request.getParameter("id")));
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/ModifyStudent.jsp");
            request.setAttribute("student", student);
            requestDispatcher.forward(request, response);
        }
    }
}
