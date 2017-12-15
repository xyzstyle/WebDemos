package router;

import dao.StudentDao;
import model.StudentModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by xyz in WebDemos on 2017/12/15 .
 */
public class StudentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    private StudentDao dao = new StudentDao();
    private StudentModel student = new StudentModel();

    public String formatStr(String str) {
        return str == null ? "" : str;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        int method = Integer.parseInt(req.getParameter("method"));
        String id = req.getParameter("id");
        if (id != null) {
            student.setId(Integer.parseInt(id));
        }
        student.setAddress(formatStr(req.getParameter("address")));
        student.setName(formatStr(req.getParameter("name")));
        student.setPassword(formatStr(req.getParameter("password")));
        String result = "";
        switch (method) {
            case 1: {
                if (dao.operateStudent(method, student)) {
                    result = "添加用户成功!";
                } else {
                    result = "添加用户失败!";
                }
                RequestDispatcher rd = req.getRequestDispatcher("AddStudent.jsp");
                req.setAttribute("result", result);
                rd.forward(req, resp);
            }
            break;
            case 2: {
                PrintWriter out = resp.getWriter();
                if (dao.operateStudent(method, student)) {
                    out.print("<script language=javascript>alert('修改成功！');window.location.href='ListStudent.jsp';</script>");
                } else {
                    out.print("<script language=javascript>alert('修改失败！');history.go(-1);</script>");
                }

            }
            break;
            case 3:
                PrintWriter out = resp.getWriter();
                if (dao.operateStudent(method, student)) {
                    out.print("<script language=javascript>alert('删除成功！');window.location.href='ListStudent.jsp';</script>");
                } else {
                    out.print("<script language=javascript>alert('删除失败！');history.go(-1);</script>");
                }
                break;
        }
    }
}
