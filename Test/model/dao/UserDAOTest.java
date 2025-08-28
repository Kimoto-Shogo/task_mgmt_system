package model.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.SQLException;

import org.junit.jupiter.api.Test;

import model.entity.UserBean;

/**UserDAOのテストコード
 * @author 寺西
 * 
 */
class UserDAOTest {

	@Test
	void loginCheckTest() throws ClassNotFoundException, SQLException{
		UserDAO dao = new UserDAO();
		UserBean bean = new UserBean();
		bean.setUser_id("hoge");
		bean.setPassword("piyo");
		bean.setUser_name("hogehoge");
		UserBean out = dao.loginCheck(bean);
		
		assertEquals(bean.getUser_id(),out.getUser_id());
	}
	
	
	@Test
	void passwordUpdateTest() throws ClassNotFoundException, SQLException{
		UserDAO dao = new UserDAO();
		UserBean bean = new UserBean();
		bean.setPassword("piyo");
		bean.setUser_id("hoge");
		bean.setUser_name("hogehoge");
		int out = dao.passwordUpdate(bean);
		
		assertEquals(1,out);
	
		
	}
	

}
