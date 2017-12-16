package com.xyz.servlet;

import com.xyz.dao.ArticleTypeDao;
import com.xyz.dao.DaoOperatorMethod;
import com.xyz.model.ArticleTypeModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class ArticleTypeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String m = req.getParameter("method");
        if (m == null) {
            return;
        }
        int method = Integer.parseInt(m);
        if (method == 1) {
            this.addArticleType(req, resp);
        }
        if (method == 2) {
            this.deleteArticleType(req, resp);
        }
    }

    // 后台删除文章类别
    public void deleteArticleType(HttpServletRequest request,
                                  HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        ArticleTypeModel articleTypeModel = new ArticleTypeModel();
        articleTypeModel.setId(Integer.valueOf(request.getParameter("id")));
        ArticleTypeDao articleTypeDao = new ArticleTypeDao();
        if (articleTypeDao.operationArticleType(
                DaoOperatorMethod.RECORD_DELETE, articleTypeModel)) {
            out.print("<script language=javascript>alert('删除文章类别成功，请重新查询！');window.location.href='back_ArticleTypeSelect.jsp';</script>");
        } else {
            out.print("<script language=javascript>alert('您需要将类别所在的文章删除,才可删除此类别！');history.go(-1);</script>");
        }

    }

    // 后台添加文章类别
    public void addArticleType(HttpServletRequest request,
                               HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=GBK");
        PrintWriter out = response.getWriter();
        ArticleTypeModel articleTypeModel = new ArticleTypeModel();
        articleTypeModel.setTypeName(request.getParameter("typeName"));
        articleTypeModel.setDescription(request.getParameter("description"));
        ArticleTypeDao articleTypeDao = new ArticleTypeDao();
        if (articleTypeDao.operationArticleType(
                DaoOperatorMethod.RECORD_INSERT, articleTypeModel)) {
            out.print("<script language=javascript>alert('添加文章类别成功，请重新查询！');window.location.href='back_ArticleTypeSelect.jsp';</script>");
        } else {
            out.print("<script language=javascript>alert('添加文章类别失败！');history.go(-1);</script>");
        }

    }
}
