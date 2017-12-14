package xyz.webrouter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by xyz in WebDemos on 2017/12/11 .
 */
public class MyServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        //设置response的编码
        resp.setContentType("text/html;charset=utf-8");
        //从req中取得参数
        String name = req.getParameter("name");
        String age = req.getParameter("age");
        String sex = req.getParameter("sex");
        String professional = req.getParameter("professional");
        //从response中取得out对象，进行html代码输出
        PrintWriter out = resp.getWriter();
        out.println("<html><body>");
        out.println("<div align='center'>");
        out.println("<p>您成功了</p>");
        out.println("<p>您的用户名是:" + name + "</p>");
        out.println("<p>您的年龄是:" + age + "</p>");
        out.println("<p>您的性别是:" + sex + "</p>");
        out.println("<p>您的职称是:" + professional + "</p>");
        out.println("</body></html>");

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
