package model.dao;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.List;

import org.junit.jupiter.api.Test;

import model.entity.CommentBean;

class CommentDAOTest {

	@Test
	void commentSelectTest() throws ClassNotFoundException, SQLException {
		//Arrange
		CommentDAO cdao = new CommentDAO();
		int taskId = 6;

		//Act
		List<CommentBean> cb = cdao.selectComment(taskId);

		//Assert
		assertNotNull(cb);
	}

	@Test
	void InsertCommentTest() throws ClassNotFoundException, SQLException {
		//Arrange
		CommentDAO cdao = new CommentDAO();
		CommentBean cb = new CommentBean();
		cb.setTask_id(5);
		cb.setUser_id("hoge");
		cb.setComment("test");

		//Act
		int ic = cdao.insertComment(cb);

		//Assert
		assertEquals(1, ic);
	}

	@Test
	void DeleteCommentTest() throws ClassNotFoundException, SQLException {
		//Arrange
		CommentDAO cdao = new CommentDAO();
		CommentBean cb = new CommentBean();
		cb.setComment_id(6);

		//Act
		int dc = cdao.deleteComment(cb);

		//Assert
		assertEquals(1, dc);
	}

}
