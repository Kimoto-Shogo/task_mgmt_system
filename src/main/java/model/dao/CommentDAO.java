package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.entity.CommentBean;

public class CommentDAO {

	public List<CommentBean> selectComment() throws SQLException, ClassNotFoundException {
		List<CommentBean> commentList = new ArrayList<>();

		String sql = "SELECT\n"
				+ "    t1.task_id,\n"
				+ "    t1.task_name,\n"
				+ "    t4.category_name,\n"
				+ "    t1.limit_date,\n"
				+ "    t2.user_name,\n"
				+ "    t3.status_name,\n"
				+ "    t1.memo,\n"
				+ "    t1.create_datetime,\n"
				+ "    t1.update_datetime,\n"
				+ "    t5.comment_id,\n"
				+ "    t5.user_id,\n"
				+ "    t5.comment,\n"
				+ "    t5.update_datetime\n"
				+ "FROM\n"
				+ "    t_task t1\n"
				+ "INNER JOIN m_user t2 ON t1.user_id = t2.user_id\n"
				+ "INNER JOIN m_status t3 ON t1.status_code = t3.status_code\n"
				+ "INNER JOIN m_category t4 ON t1.category_id = t4.category_id\n"
				+ "INNER JOIN t_comment t5 ON t1.task_id = t5.task_id";

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

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

		
		public int insertItem(CommentBean itemInfo)
				throws SQLException, ClassNotFoundException {

			int processingNumber = 0;
			String sql = "INSERT INTO t_comment(task_id, user_id, comment, update_datetime) VALUES (?, ?, ?, CURRENT_TIMESTAMP)";
			try (Connection con = ConnectionManager.getConnection();
					PreparedStatement pstmt = con.prepareStatement(sql)) {

				pstmt.setInt(1, itemInfo.getTask_id());
				pstmt.setString(2, itemInfo.getUser_id());
				pstmt.setString(3, itemInfo.getComment());

				processingNumber = pstmt.executeUpdate();
			}
		
			return processingNumber;
		}


}