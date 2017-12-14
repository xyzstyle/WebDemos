package xyz.webrouter;

import xyz.dao.UserDao;
import xyz.model.UserModel;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

public class LoginServlet  extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        UserDao dao=new UserDao();
        UserModel user=new UserModel();
        user.setName(req.getParameter("name"));
        user.setPassword(req.getParameter("password"));
        int level=dao.userLogin(user);

        HttpSession session=req.getSession();
        PrintWriter out=resp.getWriter();
        if(level==0){
            session.setAttribute("userLevel",level);
            Cookie c = new Cookie("user", user.getName());
            c.setMaxAge(60);
            resp.addCookie(c);
            out.print("<script language=javascript>alert('登录成功！');window.location.href='stu.do?method=0';</script>");
        }else{
            out.print("<script language=javascript>alert('登录失败！');history.go(-1);</script>");
        }
    }
}
