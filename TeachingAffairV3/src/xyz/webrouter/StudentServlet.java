package xyz.webrouter;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import xyz.service.StudentService;
import xyz.model.StudentModel;

public class StudentServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8188591396564460252L;
	private int method;
	private StudentService studentService;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//req.setCharacterEncoding("utf-8");
		this.method = Integer.parseInt(req.getParameter("method"));
		if (method == 1) {
			this.addStudent(req, resp);
		}
		if (method == 2) {
			this.updateStudent(req, resp);
		}
		if (method == 3) {
			this.deleteStudent(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

	public void addStudent(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		StudentModel student = new StudentModel();
		String result;
		studentService = new StudentService();
		student.setName(request.getParameter("name"));
		student.setPassword(request.getParameter("password"));
		student.setAddress(request.getParameter("address"));
		if (studentService.addStudent(student)) {
			result = "添加用户成功!";
		} else {
			result = "添加用户失败!";
		}
		request.setAttribute("result", result);
		System.out.println("result:" + result);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("StudentAdd.jsp");
		requestDispatcher.forward(request, response);
		// 不能够使用response.sendRedirect()方法
		
	}

	public void updateStudent(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		StudentModel student = new StudentModel();
		studentService = new StudentService();
		student.setName(request.getParameter("name"));
		student.setPassword(request.getParameter("password"));
		student.setAddress(request.getParameter("address"));
		student.setId(Integer.parseInt(request.getParameter("id")));
		if (studentService.updateStudent(student)) {
			out.print("<script language=javascript>alert('修改成功！');window.location.href='StudentList.jsp';</script>");
		} else {
			out.print("<script language=javascript>alert('修改失败！');history.go(-1);</script>");
		}
	}

	public void deleteStudent(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		StudentModel student = new StudentModel();
		studentService = new StudentService();
		student.setId(Integer.parseInt(request.getParameter("id")));
		if (studentService.deleteStudent(student)) {
			out.print("<script language=javascript>alert('删除成功！');window.location.href='StudentList.jsp';</script>");
		} else {
			out.print("<script language=javascript>alert('删除失败！');history.go(-1);</script>");
		}

	}
}
