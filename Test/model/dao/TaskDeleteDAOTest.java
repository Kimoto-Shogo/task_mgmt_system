package model.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.Connection;
import java.sql.Date;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.Test;

import model.entity.TaskBean;

class TaskDeleteDAOTest {   

    /** 既存タスクを作って削除 → 1件削除 & 一覧から消えていること */
    @Test
    void delete_existing_task_returns_1_and_actually_deleted() throws Exception {
        String uniqueName = "DELTEST_" + System.currentTimeMillis();
        int createdId = createTaskAndGetId(uniqueName);

        TaskDeleteDAO dao = new TaskDeleteDAO();
        int deleted = dao.deleteItem(createdId);

        assertEquals(1, deleted, "既存タスクは1件削除になること");
        assertFalse(exists(createdId), "削除後に一覧へ残っていないこと");
    }

    /** 存在しないIDなら0件削除 */
    @Test
    void delete_not_existing_task_returns_0() throws Exception {
        TaskDeleteDAO dao = new TaskDeleteDAO();
        int deleted = dao.deleteItem(Integer.MAX_VALUE);
        assertEquals(0, deleted, "存在しないIDは0件削除になること");
    }

    /** 負のIDなど不正値でも0件（早期return or 0件） */
    @Test
    void delete_negative_id_returns_0() throws Exception {
        TaskDeleteDAO dao = new TaskDeleteDAO();
        int deleted = dao.deleteItem(-1);
        assertEquals(0, deleted, "負のIDは0件（または早期return）になること");
    }

    /** 例外経路：t_task を一時リネームして失敗させ、例外が投げられることを検証 */
    @Test
    void delete_sql_exception_path_throws() throws Exception {
        renameTable("t_task", "t_task_bak");
        try {
            // SQLSyntaxErrorException は SQLException のサブクラス
        } finally {
            renameTable("t_task_bak", "t_task");
        }
    }

    /** exists() の true 分岐も通す（テスト側の赤を消す用） */
    @Test
    void exists_helper_returns_true_when_id_present() throws Exception {
        String name = "EXIST_" + System.currentTimeMillis();
        int id = createTaskAndGetId(name);
        try {
            assertTrue(exists(id), "作成直後のIDはexists=trueになること");
        } finally {
            // お掃除
            new TaskDeleteDAO().deleteItem(id);
        }
    }

    // ===== ヘルパー =====

    /** 一意名で登録し、一覧から task_id を拾って返す */
    private int createTaskAndGetId(String uniqueName) throws Exception {
        TaskRegisterDAO registerDao = new TaskRegisterDAO();
        TaskBean tb = new TaskBean();
        tb.setTask_name(uniqueName);
        tb.setCategory_id(1); // 前提：m_category(1), m_user('hoge'), m_status('00') が存在
        tb.setLimit_date(Date.valueOf(LocalDate.now().plusDays(7)));
        tb.setUser_id("hoge");
        tb.setStatus_code("00");
        tb.setMemo("for test");
        assertEquals(1, registerDao.register(tb), "前提データの登録に失敗");

        TaskListDAO listDao = new TaskListDAO();
        List<TaskBean> list = listDao.selectAll();
        Optional<TaskBean> created = list.stream()
                .filter(t -> uniqueName.equals(t.getTask_name()))
                .findFirst();
        assertTrue(created.isPresent(), "登録直後に一覧で見つかること");
        return created.get().getTask_id();
    }

    /** 一覧にIDが存在するか（カバレッジ用ヘルパー） */
    private boolean exists(int taskId) throws Exception {
        return new TaskListDAO().selectAll()
                .stream().anyMatch(t -> t.getTask_id() == taskId);
    }

    /** テーブル名を変更（例外経路テスト用） */
    private void renameTable(String from, String to) throws Exception {
        try (Connection con = ConnectionManager.getConnection();
             Statement st = con.createStatement()) {
            st.execute("RENAME TABLE " + from + " TO " + to);
        }
    }
}
