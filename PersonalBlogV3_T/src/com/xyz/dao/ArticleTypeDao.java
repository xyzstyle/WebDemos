package com.xyz.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.xyz.connection.Database;
import com.xyz.model.ArticleModel;
import com.xyz.model.ArticleTypeModel;

public interface ArticleTypeDao {


    public boolean deleteArticleType(ArticleTypeModel model);

    public boolean AddArticleType(ArticleTypeModel model);

    /**
     * 根据某个id值，找到特定某种文章类型。
     *
     * @param id 文章类型所对应的id值
     * @return 文章类型所对应的字符串
     */
    public String queryArticleTypeName(Integer id);

    /**
     * 返回所有文章类型的列表
     *
     * @return 包含ArticleTypeModel的List
     * @see ArticleTypeModel
     */
    public List<ArticleTypeModel> queryArticleType();
}