package com.xyz.dao.impl;


import com.xyz.connection.Database;
import com.xyz.dao.ArticleTypeDao;
import com.xyz.model.ArticleModel;
import com.xyz.model.ArticleTypeModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ArticleTypeDaoImpl implements ArticleTypeDao {


    private Connection connection;

    public ArticleTypeDaoImpl() {

    }


    public boolean deleteArticleType(ArticleTypeModel model) {
        connection = Database.getConnection();
        String sql = "delete from tb_articleType where id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, model.getId());
            if (ps.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            Database.releaseConnection(connection);
        }

    }

    public boolean AddArticleType(ArticleTypeModel model) {

        String sql = "insert into tb_articleType(typeName,description) values (?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, model.getTypeName());
            ps.setString(2, model.getDescription());
            if (ps.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            Database.releaseConnection(connection);
        }

    }


    /**
     * 根据某个id值，找到特定某种文章类型。
     *
     * @param id 文章类型所对应的id值
     * @return 文章类型所对应的字符串
     */
    public String queryArticleTypeName(Integer id) {
        connection = Database.getConnection();
        String typeName = null;
        String sql = "select * from tb_articleType where id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            typeName = rs.getString("typeName");

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return typeName;
    }

    /**
     * 返回所有文章类型的列表
     *
     * @return 包含ArticleTypeModel的List
     * @see ArticleTypeModel
     */
    public List<ArticleTypeModel> queryArticleType() {
        connection = Database.getConnection();
        List<ArticleTypeModel> list = new ArrayList<ArticleTypeModel>();
        ArticleTypeModel model = null;
        String sql = "select * from tb_articleType";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                model = new ArticleTypeModel();
                model.setId(rs.getInt(1));
                model.setTypeName(rs.getString(2));
                model.setDescription(rs.getString(3));
                list.add(model);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

}
