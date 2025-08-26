// TaskDeleteDAO.java
package model.dao;

import java.sql.*;
import model.entity.TaskBean;

public class TaskDeleteDAO {

    public int deleteItem(int itemCode) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM t_task WHERE task_id = ?";
        try (Connection con = ConnectionManager.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, itemCode);
            return pstmt.executeUpdate();
        }
    }

    /** 削除確認表示用にタスク1件の詳細を取得（JOINで名称も取る） */
    public TaskBean findDetailById(int taskId) throws SQLException, ClassNotFoundException {
        String sql =
            "SELECT t.task_id, t.task_name, t.category_id, t.limit_date, t.user_id, " +
            "       t.status_code, t.memo, t.create_datetime, t.update_datetime, " +
            "       c.category_name, u.user_name, s.status_name " +
            "FROM t_task t " +
            "LEFT JOIN m_category c ON t.category_id = c.category_id " +
            "LEFT JOIN m_user u     ON t.user_id     = u.user_id " +
            "LEFT JOIN m_status s   ON t.status_code = s.status_code " +
            "WHERE t.task_id = ?";

        try (Connection con = ConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, taskId);
            try (ResultSet rs = ps.executeQuery()) {
                if (!rs.next()) return null;
                TaskBean tb = new TaskBean();
                tb.setTask_id(rs.getInt("task_id"));
                tb.setTask_name(rs.getString("task_name"));
                tb.setCategory_id(rs.getInt("category_id"));
                tb.setLimit_date(rs.getDate("limit_date"));
                tb.setUser_id(rs.getString("user_id"));
                tb.setStatus_code(rs.getString("status_code"));
                tb.setMemo(rs.getString("memo"));
                tb.setCreate_datetime(rs.getTimestamp("create_datetime"));
                tb.setUpdate_datetime(rs.getTimestamp("update_datetime"));
                tb.setCategory_name(rs.getString("category_name"));
                tb.setUser_name(rs.getString("user_name"));
                tb.setStatus_name(rs.getString("status_name"));
                return tb;
            }
        }
    }
}
