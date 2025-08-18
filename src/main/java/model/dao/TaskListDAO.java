package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.entity.TaskBean;

public class TaskListDAO {
	
	public List<TaskBean> selectAll() throws ClassNotFoundException, SQLException{
		List<TaskBean> list= new ArrayList<TaskBean>();
		
		String sql ="SELECT * FROM t_task";

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			
			ResultSet res = pstmt.executeQuery();
			
			while (res.next()) {   //ここの部分がおかしい
				TaskBean icb = new TaskBean();
				icb.setTask_id(res.getInt("task_id"));
				icb.setTask_name(res.getString("task_name"));
				icb.setCategory_id(res.getInt("category_id"));
				icb.setLimit_date(res.getDate("limit_date"));
				icb.setUser_id(res.getString("user_id"));
				icb.setStatus_code(res.getString("status_code"));
				icb.setMemo(res.getString("memo"));
				icb.setCreate_datetime(res.getTimestamp("create_datetime"));
				icb.setUpdate_datetime(res.getTimestamp("update_datetime"));
				
				list.add(icb);
				
			}
			return list;
		}
	}
	}
