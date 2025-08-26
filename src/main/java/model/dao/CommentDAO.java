package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.entity.CommentBean;

public class CommentDAO {

	public List<CommentBean> selectComment(int taskId) throws SQLException, ClassNotFoundException {
		List<CommentBean> commentList = new ArrayList<>();

		String sql = "SELECT * FROM t_comment WHERE task_id = ?";
		
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setInt(1, taskId);
			ResultSet res = pstmt.executeQuery();

			while (res.next()) {
				CommentBean cb = new CommentBean();

				cb.setComment_id(res.getInt("comment_id"));
				cb.setTask_id(res.getInt("task_id"));
				cb.setUser_id(res.getString("user_id"));
				cb.setComment(res.getString("comment"));
				cb.setUpdate_datetime(res.getTimestamp("update_datetime"));

				commentList.add(cb);
			}
		}
		return commentList;
	}

		
		public int insertComment(CommentBean itemInfo)
				throws SQLException, ClassNotFoundException {

			int processingNumber = 0;
			String sql = "INSERT INTO t_comment(task_id, user_id, comment) VALUES (?, ?, ?)";
			try (Connection con = ConnectionManager.getConnection();
					PreparedStatement pstmt = con.prepareStatement(sql)) {

				pstmt.setInt(1, itemInfo.getTask_id());
				pstmt.setString(2, itemInfo.getUser_id());
				pstmt.setString(3, itemInfo.getComment());

				processingNumber = pstmt.executeUpdate();
			}
		
			return processingNumber;
		}
		
		public int deleteComment(CommentBean dCom) throws SQLException, ClassNotFoundException {
			int processingNumber = 0;
			String sql = "DELETE FROM t_comment WHERE comment_id = ?";
			try (Connection con = ConnectionManager.getConnection();
					PreparedStatement pstmt = con.prepareStatement(sql)) {

				pstmt.setInt(1, dCom.getComment_id());

				processingNumber = pstmt.executeUpdate();
			}
		
			return processingNumber;
		}
		
		public int deleteComment(CommentBean dCom) throws SQLException, ClassNotFoundException {
			int processingNumber = 0;
			String sql = "DELETE FROM t_comment WHERE comment_id = ?";
			try (Connection con = ConnectionManager.getConnection();
					PreparedStatement pstmt = con.prepareStatement(sql)) {

				pstmt.setInt(1, dCom.getComment_id());

				processingNumber = pstmt.executeUpdate();
			}
		
			return processingNumber;
		}


}