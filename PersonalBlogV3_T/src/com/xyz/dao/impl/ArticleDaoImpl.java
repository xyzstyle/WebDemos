package com.xyz.dao.impl;

import com.xyz.connection.Database;
import com.xyz.dao.ArticleDao;
import com.xyz.model.ArticleModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class ArticleDaoImpl implements ArticleDao {

    private Connection connection;

    public ArticleDaoImpl() {

    }


    /**
     * @return 布尔类型，如果操作成功，则返回true，否则false
     * @see ArticleModel
     */
    @Override
    public boolean addArticle(ArticleModel articleModel) {
        connection = Database.getConnection();
        String sql = "insert into Article(typeId,title,content,phTime,number) values(?,?,?,?,?)";
        PreparedStatement ps;
        int rows = 0;
        try {
            ps = connection.prepareStatement(sql);
            int i = 1;
            ps.setInt(i++, articleModel.getTypeId());
            ps.setString(i++, articleModel.getTitle());
            ps.setString(i++, articleModel.getContent());
            ps.setString(i++, articleModel.getPhTime());
            ps.setInt(i++, articleModel.getNumber());
            rows = ps.executeUpdate();
            ps.close();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            Database.releaseConnection(connection);
        }

    }

    @Override
    public boolean updateArticle(ArticleModel articleModel) {
        connection = Database.getConnection();
        String sqlString = "update Article set name=?,password=?,address=? where id=?";
        PreparedStatement ps;
        int rows = 0;
        try {
            ps = connection.prepareStatement(sqlString.toString());
            int i = 1;
            ps.setInt(i++, articleModel.getTypeId());
            ps.setString(i++, articleModel.getTitle());
            ps.setString(i++, articleModel.getContent());
            ps.setString(i++, articleModel.getPhTime());
            ps.setInt(i++, articleModel.getNumber());
            rows = ps.executeUpdate();
            ps.close();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            Database.releaseConnection(connection);
        }

    }

    @Override
    public boolean deleteArticle(ArticleModel articleModel) {
        connection = Database.getConnection();
        String sqlString = "delete from Article where id=?";
        PreparedStatement ps = null;
        int rows = 0;

        try {
            ps = connection.prepareStatement(sqlString);
            ps.setInt(1, articleModel.getId());
            rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();

            return false;
        } finally {
            Database.releaseConnection(connection);
        }

    }

    /**
     * @return 所选类型的所有文章对象的列表，返回所有文章。
     * @see ArticleModel
     */
    public List<ArticleModel> queryAllArticles() {
        connection = Database.getConnection();
        PreparedStatement ps=null;
        try {
            ps = connection.prepareStatement("select * from tb_article ");
            ResultSet rs = ps.executeQuery();
            List<ArticleModel> list = new ArrayList<>();
            while (rs.next()) {
                ArticleModel articleModel = new ArticleModel();
                int i = 1;
                articleModel.setId(rs.getInt(i++));
                articleModel.setTypeId(rs.getInt(i++));
                articleModel.setTitle(rs.getString(i++));
                articleModel.setContent(rs.getString(i++));
                articleModel.setPhTime(rs.getString(i++));
                articleModel.setNumber(rs.getInt(i++));
                list.add(articleModel);
            }
            rs.close();

            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {

            Database.releaseConnection(connection);
        }
    }



    /**
     * 根据某个id值，找到特定某篇文章。
     *
     * @return 某篇文章，对应一个ArticleModel对象
     * @see ArticleModel
     */
    public ArticleModel queryArticle(long id) {
        ArticleModel articleModel = new ArticleModel();
        String sql = "select * from tb_article where id=?";
        connection = Database.getConnection();


        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                articleModel = new ArticleModel();
                articleModel.setId(rs.getInt(1));
                articleModel.setTypeId(rs.getInt(2));
                articleModel.setTitle(rs.getString(3));
                articleModel.setContent(rs.getString(4));
                articleModel.setPhTime(rs.getString(5));
                articleModel.setNumber(rs.getInt(6));
            }
            return articleModel;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            Database.releaseConnection(connection);
        }
    }

}
