package xyz.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by xyz in WebDemos on 2017/12/11 .
 */

public class DbServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String method = req.getParameter("method");
        switch (method) {
            case "1":
                addUser(resp);
                break;
            case "2":
                deleteUser(resp);
                break;
            case "3":
                modifyUser(resp);
                break;
        }
    }

    private void addUser(HttpServletResponse resp) throws  IOException{
        PrintWriter out = resp.getWriter();
        out.print("Add finished");

    }

    private void deleteUser(HttpServletResponse resp)throws  IOException{
        PrintWriter out = resp.getWriter();
        out.print("delete finished");
    }

    private void modifyUser(HttpServletResponse resp) throws  IOException{
        PrintWriter out = resp.getWriter();
        out.print("modify finished");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
