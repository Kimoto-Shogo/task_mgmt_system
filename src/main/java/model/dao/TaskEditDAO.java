package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.entity.CategoryBean;
import model.entity.StatusBean;
import model.entity.TaskBean;
import model.entity.UserBean;

public class TaskEditDAO {
	
	public int taskDataUpdate(TaskBean task) throws ClassNotFoundException, SQLException {
		String sql = "UPDATE t_task SET task_name = ?, category_id = ?, limit_date = ?, user_id = ?, status_code = ?, memo = ? WHERE task_id = ?";
		
		
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement ps = con.prepareStatement(sql)) {
			
			ps.setString(1, task.getTask_name());
			ps.setInt(2, task.getCategory_id());
			ps.setDate(3, task.getLimit_date());
			ps.setString(4, task.getUser_id());
			ps.setString(5, task.getStatus_code());
			ps.setString(6, task.getMemo());
			ps.setInt(7, task.getTask_id());
			
			return ps.executeUpdate();
			}
		
	}
	
	public List<UserBean> UserListSelect() throws ClassNotFoundException, SQLException {
		String sql = "SELECT * FROM m_user";
		List<UserBean> userList = new ArrayList<>();
		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement ps = con.prepareStatement(sql)){
			ResultSet res = ps.executeQuery();
			
			while(res.next()) {
				UserBean user = new UserBean();
				user.setUser_id(res.getString("user_id"));
				user.setUser_name(res.getString("user_name"));
				
				userList.add(user);
			}
			return userList;
		}
		
	}
	
	public List<CategoryBean> CatedoryListSelect() throws ClassNotFoundException, SQLException {
		String sql = "SELECT * FROM m_category";
		List<CategoryBean> categoryList = new ArrayList<>();
		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement ps = con.prepareStatement(sql)){
			ResultSet res = ps.executeQuery();
			
			while(res.next()) {
				CategoryBean category = new CategoryBean();
				category.setCategory_id(res.getInt("category_id"));
				category.setCategory_name(res.getString("category_name"));
				
				categoryList.add(category);
			}
			return categoryList;
		}
	}
	
	public List<StatusBean> StatusListSelect() throws ClassNotFoundException, SQLException {
		String sql = "SELECT * FROM m_status";
		List<StatusBean> statusList = new ArrayList<>();
		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement ps = con.prepareStatement(sql)){
			ResultSet res = ps.executeQuery();
			
			while(res.next()) {
				StatusBean status = new StatusBean();
				status.setStatus_code(res.getString("status_code"));
				status.setStatus_name(res.getString("status_name"));
				
				statusList.add(status);
			}
		return statusList;
		}
	}

}