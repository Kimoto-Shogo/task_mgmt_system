package model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.entity.CategoryBean;
import model.entity.StatusBean;

public class TaskRegisterDAO {

	//カテゴリ情報の取得("category_id" , "category_name")
	public List<CategoryBean> categorycode() throws ClassNotFoundException, SQLException {
		String sql = "SELECT * FROM m_category";
		List<CategoryBean> list = new ArrayList<>();
		
		try (Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();) {

			//実行
			ResultSet res = stmt.executeQuery(sql);

			while (res.next()) {
				CategoryBean cb = new CategoryBean();
				cb.setCategory_id(res.getInt("category_id"));
				cb.setCategory_name(res.getString("category_name"));
				
				list.add(cb);
			}
		return list;
		}
	}

	
	//ステータスの取得("status_code" , "status_name")
	public List<StatusBean> statuscode() throws SQLException, ClassNotFoundException {
		String sql = "SELECT * FROM m_status";
		List<StatusBean> list = new ArrayList<>();
		
		try (Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();) {

			//実行
			ResultSet res = stmt.executeQuery(sql);

			while (res.next()) {
				StatusBean sb = new StatusBean();
				sb.setStatus_code(res.getString("status_code"));
				sb.setStatus_name(res.getString("status_name"));
				
				list.add(sb);
			}
		
		return list;
		}
	}

}
