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
		
		String sql ="SELECT\r\n"
				+ "    t1.task_id,\r\n"
				+ "    t1.task_name,\r\n"
				+ "    t4.category_name,\r\n"
				+ "    t1.limit_date,\r\n"
				+ "    t2.user_name,\r\n"
				+ "    t3.status_name,\r\n"
				+ "    t1.memo,\r\n"
				+ "    t1.create_datetime,\r\n"
				+ "    t1.update_datetime\r\n"
				+ "FROM\r\n"
				+ "    t_task t1\r\n"
				+ "INNER JOIN m_user t2 ON t1.user_id = t2.user_id\r\n"
				+ "INNER JOIN m_status t3 ON t1.status_code = t3.status_code\r\n"
				+ "INNER JOIN m_category t4 ON t1.category_id = t4.category_id;\r\n"
				+ "";

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			
			ResultSet res = pstmt.executeQuery();
			
			while (res.next()) {   
				TaskBean task = new TaskBean();

		        task.setTask_id(res.getInt("task_id"));
		        task.setTask_name(res.getString("task_name"));

		        // category_nameとstatus_name、user_nameはTaskBeanに新たに追加 詳細クラス図を訂正
		        task.setCategory_name(res.getString("category_name"));  // ← TaskBeanにフィールド追加
		        task.setLimit_date(res.getDate("limit_date"));
		        task.setUser_name(res.getString("user_name"));          // ← TaskBeanにフィールド追加
		        task.setStatus_name(res.getString("status_name"));      // ← TaskBeanにフィールド追加

		        task.setMemo(res.getString("memo"));
		        task.setCreate_datetime(res.getTimestamp("create_datetime"));
		        task.setUpdate_datetime(res.getTimestamp("update_datetime"));

		        list.add(task);
			}
			return list;
		}
	}
	}
