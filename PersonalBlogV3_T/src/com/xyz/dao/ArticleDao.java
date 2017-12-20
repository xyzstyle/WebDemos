package com.xyz.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.xyz.model.ArticleModel;


public interface ArticleDao {


    /**
     * @return 布尔类型，如果操作成功，则返回true，否则false
     * @see ArticleModel
     */
    public boolean addArticle(ArticleModel articleModel);

    public boolean updateArticle(ArticleModel articleModel);

    public boolean deleteArticle(ArticleModel articleModel);

    /**
     * @return 所选类型的所有文章对象的列表，如果typeId为null，则返回所有文章。
     * @see ArticleModel
     */
    public List<ArticleModel> queryAllArticles();

    /**
     * 根据某个id值，找到特定某篇文章。
     *
     * @param id 文章id值
     * @return 某篇文章，对应一个ArticleModel对象
     * @see ArticleModel
     */
    public ArticleModel queryArticle(long id);

}
