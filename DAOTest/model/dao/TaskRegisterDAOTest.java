package model.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import org.junit.jupiter.api.Test;

import model.entity.CategoryBean;
import model.entity.StatusBean;
import model.entity.TaskBean;
import model.entity.UserBean;

public class TaskRegisterDAOTest {
	@Test //カテゴリ情報の取得("category_id" , "category_name")
	void category_get_test() throws ClassNotFoundException, SQLException {
		//Arrange
		TaskRegisterDAO trdao = new TaskRegisterDAO();

		//Act
		List<CategoryBean> list = trdao.categorycode();

		//Assert
		assertNotNull(list);

	}

	@Test //ユーザ情報の取得("user_id" , "user_name")
	void user_get_test() throws ClassNotFoundException, SQLException {
		//Arrange
		TaskRegisterDAO trdao = new TaskRegisterDAO();

		//Act
		List<UserBean> list = trdao.user();

		//Assert
		assertNotNull(list);
	}

	@Test //ステータスの取得("status_code" , "status_name")
	void statuscode_get_test() throws ClassNotFoundException, SQLException {
		//Arrange
		TaskRegisterDAO trdao = new TaskRegisterDAO();

		//Act
		List<StatusBean> list = trdao.statuscode();

		//Assert
		assertNotNull(list);
	}

	@Test //タスクの登録をして、成功か失敗を"judg"で判定
	void register_success_test() throws ClassNotFoundException, SQLException, ParseException {
		//Arrange
		TaskRegisterDAO trdao = new TaskRegisterDAO();
		TaskBean tb = new TaskBean();
		
        Date sqlDate= Date.valueOf("2017-03-02");
		
		tb.setTask_name("test");
		tb.setCategory_id(1);
		tb.setLimit_date(sqlDate);
		tb.setUser_id("hoge");
		tb.setStatus_code("00");
		tb.setMemo("");
		
		int judge =0;
		//Act
		judge = trdao.register(tb);

		//Assert
		assertEquals(1 , judge);
	}

}
