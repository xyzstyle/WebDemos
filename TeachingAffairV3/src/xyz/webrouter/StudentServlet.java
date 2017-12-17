package xyz.webrouter;

import xyz.model.StudentModel;
import xyz.service.PageCount;
import xyz.service.StudentService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by xyz in WebDemos on 2017/12/13 .
 */
public class StudentServlet extends HttpServlet {


    private StudentService studentService;
    private StudentModel student = new StudentModel();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    private String formatStr(String str) {
        return str == null ? "" : str;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int method = Integer.parseInt(req.getParameter("method"));
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
                this.modifyStudent(req, resp);
                break;
            default:
        }

    }

    private void listStudents(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        studentService = new StudentService();
        int currentPage = 1;
        int recordCounts = studentService.listAllStudents().size();
        int maxPageNumber = 1;
        if (recordCounts % PageCount.STUDENT_PAGE_COUNT == 0) {
            maxPageNumber = recordCounts / PageCount.STUDENT_PAGE_COUNT;
        } else {
            maxPageNumber = recordCounts / PageCount.STUDENT_PAGE_COUNT + 1;
        }

        String pageNumber = request.getParameter("pageNumber");
        if (pageNumber != null) {
            currentPage = Integer.parseInt(pageNumber);
        }
        List<StudentModel> students  = studentService.listStudents(currentPage);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/ListStudent.jsp");
        request.setAttribute("currentPage",currentPage);
        request.setAttribute("maxPageNumber",maxPageNumber);
        request.setAttribute("students", students);
        requestDispatcher.forward(request, response);

    }

    private void addStudent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!student.getName().equals("")) {
            String result;
            studentService = new StudentService();
            if (studentService.addStudent(student)) {
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
        studentService = new StudentService();
        if (studentService.updateStudent(student)) {
            request.setAttribute("result", "<script language=javascript>alert('修改成功！');</script>");
        } else {
            request.setAttribute("result", "<script language=javascript>alert('修改失败！');</script>");
        }
        listStudents(request, response);
    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        studentService = new StudentService();
        if (studentService.deleteStudent(student)) {
            request.setAttribute("result", "<script language=javascript>alert('删除成功！');</script>");
        } else {
            request.setAttribute("result", "<script language=javascript>alert('删除失败！');</script>");
        }
        listStudents(request, response);
    }

    private void modifyStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        studentService = new StudentService();
        student = studentService.getByID(student.getId());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/ModifyStudent.jsp");
        request.setAttribute("student", student);
        requestDispatcher.forward(request, response);

    }
}
