package com.xyz.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.xyz.connection.DatabaseBasis;
import com.xyz.model.ArticleTypeModel;

public class ArticleTypeDao {
	
	private DatabaseBasis connection = null;
	
	public ArticleTypeDao() {
		connection = new DatabaseBasis();
	}

	/**
	 * 添加或者删除文章的类型
	 * @param operation  操作类型，分别是删除，添加。
	 * @param form  类型对象，其中的内容作为SQL的参数出现。
	 * @return  返回值为布尔类型，如果操作成功，则返回true，否则false
	 * @see  ArticalTypeForm
	 */
	public boolean operationArticleType(int operation, ArticleTypeModel model) {
		boolean flag = false;
		String sql = null;
		if (operation==DaoOperatorMethod.RECORD_INSERT)
			sql = "insert into tb_articleType(typeName,description) values ('" + model.getTypeName()
					+ "','" + model.getDescription() + "')";
		if (operation==DaoOperatorMethod.RECORD_DELETE)
			sql = "delete from tb_articleType where id='" + model.getId()+"'";
		if (connection.executeUpdate(sql)) {
			flag = true;
		}
		return flag;
	}

	
	/**
	 * 根据某个id值，找到特定某种文章类型。
	 * @param id  文章类型所对应的id值
	 * @return  文章类型所对应的字符串
	 */
	public String queryArticleTypeName(Integer id) {
		String typeName = null;
		String sql = "select * from tb_articleType where id='" + id + "'";
		ResultSet rs = connection.executeQuery(sql);
		try {
			while (rs.next()) {
				typeName = rs.getString("typeName");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return typeName;
	}

	/**
	 * 返回所有文章类型的列表
	 * @return  包含ArticleTypeModel的List
	 * @see ArticleTypeModel
	 */
	public List<ArticleTypeModel> queryArticleType() {
		List<ArticleTypeModel> list = new ArrayList<ArticleTypeModel>();
		ArticleTypeModel model = null;
		String sql = "select * from tb_articleType";
		ResultSet rs = connection.executeQuery(sql);
		try {
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
