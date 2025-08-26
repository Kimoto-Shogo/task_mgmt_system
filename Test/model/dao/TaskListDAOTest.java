package model.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.SQLException;
import java.util.List;

import org.junit.jupiter.api.Test;

import model.entity.TaskBean;

public class TaskListDAOTest {

    @Test
    void task_list_test() throws ClassNotFoundException, SQLException {
        // Arrange
        TaskListDAO dao = new TaskListDAO();

        // Act
        List<TaskBean> taskList = dao.selectAll();

        // Assert
        assertNotNull(taskList, "リストがnullではないこと");
        

        // 先頭のタスクを簡易チェック（必要に応じてループも）
        TaskBean task = taskList.get(0);
        assertNotNull(task.getTask_id(), "task_idがnullでないこと");
        assertNotNull(task.getTask_name(), "task_nameがnullでないこと");
        assertNotNull(task.getCategory_name(), "category_nameがnullでないこと");
        assertNotNull(task.getUser_name(), "user_nameがnullでないこと");
        assertNotNull(task.getStatus_name(), "status_nameがnullでないこと");
    }
}
