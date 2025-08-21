package model.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.SQLException;
import java.util.List;

import org.junit.jupiter.api.Test;

import model.entity.CategoryBean;
import model.entity.StatusBean;
import model.entity.TaskBean;
import model.entity.UserBean;

class TaskEditDAOTest {

	@Test
	void taskDataUpdateTest() throws ClassNotFoundException, SQLException {
		TaskEditDAO dao = new TaskEditDAO();
		TaskBean task = new TaskBean();
		
		assertEquals(0, dao.taskDataUpdate(task));
	}
	
	@Test
	void UserListSelectTest() throws ClassNotFoundException, SQLException {
		TaskEditDAO dao = new TaskEditDAO();
		
		List<UserBean> userList = dao.UserListSelect();
		
		assertNotNull(userList);
	}
	@Test
	void CategoryListSelectTest() throws ClassNotFoundException, SQLException {
		TaskEditDAO dao = new TaskEditDAO();
		
		List<CategoryBean> categoryList = dao.CatedoryListSelect();
		
		assertNotNull(categoryList);
	}
	@Test
	void StatusListSelectTest() throws ClassNotFoundException, SQLException {
		TaskEditDAO dao = new TaskEditDAO();
		
		List<StatusBean> statusList = dao.StatusListSelect();
		
		assertNotNull(statusList);
	}

}
	