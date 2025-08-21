package Servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.TaskEditDAO;
import model.entity.TaskBean;
import model.entity.UserBean;

/**
 * Servlet implementation class taskEditServlet
 */
@WebServlet("/taskEditServlet")
public class taskEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public taskEditServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		@SuppressWarnings("unused")
		UserBean user = null;

		if (session != null && (user = (UserBean) session.getAttribute("userbean")) == null) {
			session = null;
		}

		if (session == null) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}
		request.setCharacterEncoding("UTF-8");
		TaskEditDAO dao = new TaskEditDAO();
		@SuppressWarnings("unchecked")
		List<TaskBean> taskList = (ArrayList<TaskBean>) session.getAttribute("taskList");

		int task_id = Integer.parseInt(request.getParameter("task_id"));

		for (TaskBean task : taskList) {
			if (task.getTask_id() == task_id) {
				session.setAttribute("updateTask", task);
			}
		}

		try {
			session.setAttribute("categoryList", dao.CatedoryListSelect());
			session.setAttribute("statusList", dao.StatusListSelect());
			session.setAttribute("userList", dao.UserListSelect());
		} catch (ClassNotFoundException | SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		request.getRequestDispatcher("taskedit.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//セッション管理
		HttpSession session = request.getSession(false);
		@SuppressWarnings("unused")
		UserBean user = null;

		if (session != null && (user = (UserBean) session.getAttribute("userbean")) == null) {
			session = null;
		}

		if (session == null) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}

		//変更処理ここから
		request.setCharacterEncoding("UTF-8");
		TaskEditDAO dao = new TaskEditDAO();
		TaskBean updateTask = (TaskBean) session.getAttribute("updateTask");

		updateTask.setTask_name(request.getParameter("task_name"));
		updateTask.setCategory_id(Integer.parseInt(request.getParameter("category_id")));
		updateTask.setLimit_date(Date.valueOf(request.getParameter("limit_date")));
		updateTask.setUser_id(request.getParameter("user_id"));
		updateTask.setStatus_code(request.getParameter("status_code"));
		updateTask.setMemo(request.getParameter("memo"));

		int resultnum = 0;
		String url = "taskediterror.jsp";
		try {
			resultnum = dao.taskDataUpdate(updateTask);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
			request.getRequestDispatcher(url).forward(request, response);
		}

		if (resultnum == 1) {
			url = "taskeditsuccess.jsp";
		}
		request.getRequestDispatcher(url).forward(request, response);

	}

}
