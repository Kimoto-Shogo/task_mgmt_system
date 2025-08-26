package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.CommentDAO;
import model.entity.CommentBean;
import model.entity.UserBean;

/**
 * Servlet implementation class CommentInsertServlet
 */
@WebServlet("/CommentInsertServlet")
public class CommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CommentInsertServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("commentinsert.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		request.setCharacterEncoding("UTF-8");
		CommentDAO dao = new CommentDAO();
		//ログイン確認ここから
		@SuppressWarnings("unused")
		UserBean user = null;

		// セッションが存在していても userbean が無ければセッション無効扱い
		if (session != null && (user = (UserBean) session.getAttribute("userbean")) == null) {
			session = null;
		}

		// セッションが無効ならログイン画面へ
		if (session == null) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}
		//ログイン確認ここまで

		String commentString = request.getParameter("comment")
		.replace("<", "?")
		.replace(">", "?")
		.replace("&", "?")
		.replace("\"", "?")
		.replace("\'", "?");
		int task_id = Integer.parseInt(session.getAttribute("task_id").toString());
		CommentBean combean = new CommentBean();
		

		combean.setTask_id(task_id);
		combean.setUser_id(user.getUser_id());
		combean.setComment(commentString);

		try {
			//nullの場合INSERTしない
			if (commentString != null) {
				if (dao.insertComment(combean) == 1) {
					request.setAttribute("comment", null);
					response.sendRedirect("CommentDisplayServlet");
				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}catch (NullPointerException e) {
			request.getRequestDispatcher("CommentDisplayServlet").forward(request, response);
		}

	}

}
