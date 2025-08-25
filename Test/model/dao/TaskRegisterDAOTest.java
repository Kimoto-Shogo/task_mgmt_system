package model.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import org.junit.jupiter.api.Test;

import model.entity.CategoryBean;
import model.entity.StatusBean;
import model.entity.TaskBean;
import model.entity.UserBean;

public class TaskRegisterDAOTest {
	@Test //カテゴリ情報の取得("category_id" , "category_name")
	void category_test() throws ClassNotFoundException, SQLException {
		//Arrange
		TaskRegisterDAO trdao = new TaskRegisterDAO();

		//Act
		List<CategoryBean> cb = trdao.categorycode();

		//Assert
		assertNotNull(cb);
	}

	@Test //ユーザ情報の取得("user_id" , "user_name")
	void user_test() throws ClassNotFoundException, SQLException {
		//Arrange
		TaskRegisterDAO trdao = new TaskRegisterDAO();

		//Act
		List<UserBean> ub = trdao.user();

		//Assert
		assertNotNull(ub);
	}

	@Test //ステータスの取得("status_code" , "status_name")
	void status_test() throws ClassNotFoundException, SQLException {
		//Arrange
		TaskRegisterDAO trdao = new TaskRegisterDAO();

		//Act
		List<StatusBean> sb = trdao.statuscode();

		//Assert
		assertNotNull(sb);
	}

	@Test //タスクの登録をして、成功か失敗を"judg"で判定
	void task_register_test() throws ClassNotFoundException, SQLException {
		//Arrange
		TaskRegisterDAO trdao = new TaskRegisterDAO();
		Date sqlDate = Date.valueOf("2025-08-25");
		int judge = 0;
		//"TaskBean"に値を格納
		TaskBean tb = new TaskBean();
		tb.setTask_name("TestTask");
		tb.setCategory_id(1);
		tb.setLimit_date(sqlDate);
		tb.setUser_id("hoge");
		tb.setStatus_code("00");
		tb.setMemo("");

		//Act
		judge = trdao.register(tb);

		//Assert
		assertEquals(1, judge);
	}
}
