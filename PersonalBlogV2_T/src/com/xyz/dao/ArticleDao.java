package com.xyz.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.xyz.connection.DatabaseBasis;
import com.xyz.model.ArticleModel;


public class ArticleDao {
	
	private DatabaseBasis connection = null;

	private ArticleModel articleModel = null;

	public ArticleDao() {
		connection = new DatabaseBasis();
	}

	
	/**
	 * @param operation 操作类型，可能值为增加，修改，删除，
	 * @param form  文章对象，对象中的属性值作为SQL语句的参数出现
	 * @return  布尔类型，如果操作成功，则返回true，否则false
	 * @see  ArticleModel
	 */
	public boolean operationArticle(int operation, ArticleModel form) {
		boolean flag = false;
		String sql = null;
		if (operation==DaoOperatorMethod.RECORD_INSERT)
			sql = "insert into tb_article values ('" + form.getTypeId() + "','"
					+ form.getTitle() + "','" + form.getContent() + "','"
					+ form.getPhTime() + "','" + form.getNumber() + "')";
		if (operation==DaoOperatorMethod.RECORD_UPDATE)
			sql = "update tb_article set typeID='" + form.getTypeId()
					+ "',title='" + form.getTitle() + "',content='"
					+ form.getContent() + "' where id='" + form.getId() + "'";
		if (operation==DaoOperatorMethod.RECORD_DELETE)
			sql = "delete from tb_article where id='" + form.getId() + "'";
		if (operation==DaoOperatorMethod.RECORD_UPDATE_ONEFIELD)
			sql = "update tb_article set number=number+1 where id='"
					+ form.getId() + "'";
		if (connection.executeUpdate(sql)) {
			flag = true;
		}
		return flag;
	}

	/**
	 * @param typeId 为文章类型
	 * @return 所选类型的所有文章对象的列表，如果typeId为null，则返回所有文章。
	 * @see ArticleModel
	 */
	public List<ArticleModel> queryArticle(Integer typeId) {
		List<ArticleModel> list = new ArrayList<ArticleModel>();
		String sql = null;
		if (typeId == null)
			sql = "select * from tb_article";
		else
			sql = "select * from tb_article where typeID='" + typeId
					+ "' order by id desc";
		ResultSet rs = connection.executeQuery(sql);
		try {
			while (rs.next()) {
				articleModel = new ArticleModel();
				articleModel.setId(rs.getInt(1));
				articleModel.setTypeId(rs.getInt(2));
				articleModel.setTitle(rs.getString(3));
				articleModel.setContent(rs.getString(4));
				articleModel.setPhTime(rs.getString(5));
				articleModel.setNumber(rs.getInt(6));
				list.add(articleModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 根据某个id值，找到特定某篇文章。
	 * @param id 文章id值
	 * @return 某篇文章，对应一个ArticleModel对象
	 * @see ArticleModel
	 */
	public ArticleModel queryArticleModel(Integer id) {
		String sql = "select * from tb_article where id='" + id + "'";
		ResultSet rs = connection.executeQuery(sql);
		try {
			while (rs.next()) {
				articleModel = new ArticleModel();
				articleModel.setId(rs.getInt(1));
				articleModel.setTypeId(rs.getInt(2));
				articleModel.setTitle(rs.getString(3));
				articleModel.setContent(rs.getString(4));
				articleModel.setPhTime(rs.getString(5));
				articleModel.setNumber(rs.getInt(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		this.operationArticle(DaoOperatorMethod.RECORD_UPDATE_ONEFIELD, articleModel);
		return articleModel;
	}

}
