package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.CommentDAO;
import model.entity.CommentBean;

/**
 * Servlet implementation class CommentServlet
 */
@WebServlet("/commentservlet")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<CommentBean> commentList = new ArrayList<>();

		CommentDAO dao = new CommentDAO();
		CommentBean co = new CommentBean();

		// パラメータ受け取り
		String commentText = request.getParameter("comment");
		String userId = request.getParameter("user_id");
		String taskIdStr = request.getParameter("task_id");

		if (commentText != null && userId != null && taskIdStr != null) {
			int taskId = Integer.parseInt(taskIdStr);

			co.setComment(commentText);
			co.setUser_id(userId);
			co.setTask_id(taskId);

			try {
				dao.insertItem(co);
			} catch (SQLException | ClassNotFoundException e) {
				e.printStackTrace();
			}
		}

		try {
			commentList = dao.selectComment();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		request.setAttribute("commentList", commentList);

		RequestDispatcher rd = request.getRequestDispatcher("comment.jsp");
		rd.forward(request, response);
	}
}
