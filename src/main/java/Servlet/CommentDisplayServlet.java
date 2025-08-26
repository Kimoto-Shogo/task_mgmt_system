package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

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
 * Servlet implementation class CommentDisplayServlet
 */
@WebServlet("/CommentDisplayServlet")
public class CommentDisplayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CommentDisplayServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
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

		if (request.getParameter("task_id") != null) {
			session.setAttribute("task_id", request.getParameter("task_id"));
		}
		int task_id = 0;
		try {
			task_id = Integer.parseInt((String) session.getAttribute("task_id"));
		} catch (NumberFormatException e) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}

		try {
			List<CommentBean> comList = dao.selectComment(task_id);
			session.setAttribute("comList", comList);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}catch (NullPointerException e) {
			response.sendRedirect("CommentDisplayServlet");
		}
		request.getRequestDispatcher("commentdisplay.jsp").forward(request, response);
	}

}
