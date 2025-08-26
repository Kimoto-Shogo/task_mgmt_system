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
 * Servlet implementation class CommentDeleteServlet
 */
@WebServlet("/CommentDeleteServlet")
public class CommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CommentDeleteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
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
		CommentBean deletecomment = (CommentBean) session.getAttribute("deletecomment");

		try {
			if (dao.deleteComment(deletecomment) == 1) {
				response.sendRedirect("CommentDisplayServlet");

			} else {
				request.getRequestDispatcher("commentdelete.jsp").forward(request, response);

			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}catch (NullPointerException e) {
			response.sendRedirect("CommentDisplayServlet");
		}

	}

}
