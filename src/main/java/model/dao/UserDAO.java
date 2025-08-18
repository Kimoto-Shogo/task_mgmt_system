package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.entity.UserBean;

public class UserDAO {

	public UserBean loginCheck(UserBean bean) throws ClassNotFoundException, SQLException {

		String sql = "SELECT * FROM m_user WHERE user_id = ? AND password = ?";

		UserBean userbean = new UserBean();

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, bean.getUser_id());//プレースホルダにbeanの値を入れてあげる。
			pstmt.setString(2, bean.getPassword());
			ResultSet res = pstmt.executeQuery();//sqlの実行

			if (res.next()) {//一回の呼び出しならif文でOK

				//getしたDBのカラム（user_id）などをuserbeanにsetしてあげる
				userbean.setUser_id(res.getString("user_id"));
				userbean.setPassword(res.getString("password"));
				userbean.setUser_name(res.getString("user_name"));
			}

		}

		return userbean;

	}
	
	
	
	public int passwordUpdate(UserBean bean) throws ClassNotFoundException, SQLException {
		
		int count = 0;
		String sql = "UPDATE m_user SET password = ? WHERE user_id = ? AND user_name = ?";
		

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1,bean.getPassword());//プレースホルダにbeanの値を入れてあげる。
			pstmt.setString(2,bean.getUser_id());
			pstmt.setString(3,bean.getUser_name());
			
			count = pstmt.executeUpdate();//sqlの実行
			
		}

		
		return count;
		
	}
	

}
