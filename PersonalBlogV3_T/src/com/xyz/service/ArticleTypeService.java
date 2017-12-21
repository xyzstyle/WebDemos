package com.xyz.service;

import com.xyz.connection.Database;
import com.xyz.dao.ArticleTypeDao;
import com.xyz.dao.impl.ArticleTypeDaoImpl;
import com.xyz.model.ArticleModel;
import com.xyz.model.ArticleTypeModel;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ArticleTypeService {
    private ArticleTypeDao articleTypeDao;

    public boolean deleteArticleType(ArticleTypeModel model) {

        articleTypeDao = new ArticleTypeDaoImpl();
        return articleTypeDao.deleteArticleType(model);
    }

    public boolean AddArticleType(ArticleTypeModel model) {
        articleTypeDao = new ArticleTypeDaoImpl();
        return articleTypeDao.addArticleType(model);
    }


    /**
     * 根据某个id值，找到特定某种文章类型。
     *
     * @param id 文章类型所对应的id值
     * @return 文章类型所对应的字符串
     */
    public String queryArticleTypeName(Integer id) {
        articleTypeDao = new ArticleTypeDaoImpl();
        return articleTypeDao.queryArticleTypeName(id);
    }

    /**
     * 返回所有文章类型的列表
     *
     * @return 包含ArticleTypeModel的List
     * @see ArticleTypeModel
     */
    public List<ArticleTypeModel> queryArticleType() {
        articleTypeDao = new ArticleTypeDaoImpl();
        return articleTypeDao.queryArticleType();
    }


}
