package model.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.Test;

import model.entity.TaskBean;

class TaskDeleteDAOTest {

    /** 1) タスクを1件登録 → 2) ID特定 → 3) 削除して1件削除を確認 → 4) 本当に消えたか確認 */
    @Test
    void delete_existing_task_returns_1_and_actually_deleted() throws ClassNotFoundException, SQLException {
        // Arrange
        String uniqueName = "DELTEST_" + System.currentTimeMillis();

        // まず登録（みんなのテストに合わせて既存の値を使用）
        TaskRegisterDAO registerDao = new TaskRegisterDAO();
        TaskBean tb = new TaskBean();
        tb.setTask_name(uniqueName);
        tb.setCategory_id(1);                    // 既存カテゴリ
        tb.setLimit_date(Date.valueOf(LocalDate.now().plusDays(7)));
        tb.setUser_id("hoge");                   // 既存ユーザー
        tb.setStatus_code("00");                 // 既存ステータス
        tb.setMemo("delete test");
        assertEquals(1, registerDao.register(tb), "登録が成功すること");

        // 登録したタスクのIDを取得（名前で拾う）
        TaskListDAO listDao = new TaskListDAO();
        List<TaskBean> list = listDao.selectAll();
        Optional<TaskBean> created = list.stream()
                .filter(t -> uniqueName.equals(t.getTask_name()))
                .findFirst();
        assertTrue(created.isPresent(), "登録直後に一覧で見つかること");
        int createdId = created.get().getTask_id();

        // Act: 削除実行
        TaskDeleteDAO deleteDao = new TaskDeleteDAO();
        int deleted = deleteDao.deleteItem(createdId); // ← メソッド名が違えば合わせてね
        assertEquals(1, deleted, "既存タスクを削除すると1件削除になること");

        // Assert: 本当に消えたか
        List<TaskBean> after = listDao.selectAll();
        boolean stillExists = after.stream().anyMatch(t -> t.getTask_id() == createdId);
        assertFalse(stillExists, "削除後に一覧に残っていないこと");
    }

    /** 存在しないIDを削除したら0件になること（副作用なし） */
    @Test
    void delete_not_existing_task_returns_0() throws ClassNotFoundException, SQLException {
        TaskDeleteDAO deleteDao = new TaskDeleteDAO();

        // たぶん存在しないであろう十分大きいID
        int nonExistingId = Integer.MAX_VALUE;
        int deleted = deleteDao.deleteItem(nonExistingId); // ← メソッド名が違えば合わせて
        assertEquals(0, deleted, "存在しないIDなら0件削除になること");
    }
}
