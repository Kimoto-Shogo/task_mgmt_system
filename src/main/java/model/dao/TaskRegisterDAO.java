package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.entity.CategoryBean;
import model.entity.StatusBean;
import model.entity.TaskBean;
import model.entity.UserBean;

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
	
	//ユーザ情報の取得("user_id" , "user_name")
	public List<UserBean> user() throws SQLException, ClassNotFoundException {
		String sql = "SELECT * FROM m_user";
		List<UserBean> list = new ArrayList<>();
		
		try (Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();) {

			//実行
			ResultSet res = stmt.executeQuery(sql);

			while (res.next()) {
				UserBean ub = new UserBean();
				ub.setUser_id(res.getString("user_id"));
				ub.setUser_name(res.getString("user_name"));
				
				list.add(ub);
				
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

	
	//タスクの登録をして、成功か失敗を"judg"で判定
	public int register(TaskBean tb) throws ClassNotFoundException, SQLException {
		int judge = 0;
		String sql = "INSERT INTO t_task (task_name , category_id , limit_date , user_id , status_code , memo) VALUES (? , ? , ? , ? , ? , ?);";
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);) {
			
			//プレースフォルダ("?")に値をセット
			pstmt.setString(1 , tb.getTask_name());
			pstmt.setInt(2 , tb.getCategory_id());
			pstmt.setDate(3 , tb.getLimit_date());
			pstmt.setString(4 ,tb.getUser_id());
			pstmt.setString(5 ,tb.getStatus_code());
			pstmt.setString(6 ,tb.getMemo());

			//更新が成功された回数("1")が"judge"に代入される
			judge = pstmt.executeUpdate();//SQL実行
			
		return judge;
		}
	}
}
