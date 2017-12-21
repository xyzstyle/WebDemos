package com.xyz.servlet;

import com.xyz.model.ArticleModel;
import com.xyz.model.ArticleTypeModel;
import com.xyz.service.ArticleService;
import com.xyz.service.ArticleTypeService;
import com.xyz.service.PageCount;


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
public class ArticleServlet extends HttpServlet {

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
//        String id = req.getParameter("id");
//        if (id != null) {
//            student.setId(Integer.parseInt(id));
//        }
//        student.setName(formatStr(req.getParameter("name")));
//        student.setPassword(formatStr(req.getParameter("password")));
//        student.setAddress(formatStr(req.getParameter("address")));
        switch (method) {
            case 0:
                this.listStudents(req, resp);
                break;
//            case 1:
//                this.addStudent(req, resp);
//                break;
//            case 2:
//                this.updateStudent(req, resp);
//                break;
//            case 3:
//                this.deleteStudent(req, resp);
//                break;
//            case 4:
//                this.modifyStudent(req, resp);
//                break;
            default:
        }

    }

    private void listStudents(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer typeId = null;
        if (request.getParameter("typeId") != null) {
            typeId = Integer.valueOf(request.getParameter("typeId"));
        }
        ArticleService articleService = new ArticleService();
        int currentPage = 1;
        int maxPageNumber=articleService.getMaxPage();
        String pageNumber = request.getParameter("pageNumber");
        if (pageNumber != null) {
            currentPage = Integer.parseInt(pageNumber);
        }
        List<ArticleModel> articles  = articleService.getArticlesForPage(typeId,currentPage);
        List<ArticleTypeModel> articleTypes=new ArticleTypeService().queryArticleType();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/back_ArticleSelect.jsp");
        request.setAttribute("currentPage",currentPage);
        request.setAttribute("maxPageNumber",maxPageNumber);
        request.setAttribute("articles", articles);
        request.setAttribute("articleTypes",articleTypes);
        requestDispatcher.forward(request, response);
    }




}
