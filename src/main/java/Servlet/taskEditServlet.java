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
 * タスク編集画面用サーブレット
 * @author 山下
 */
@WebServlet("/taskEditServlet")
public class taskEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * コンストラクタ
	 */
	public taskEditServlet() {
		super();
	}

	/**
	 * GETメソッドの処理（タスク編集画面を開く処理）
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// セッションを取得（falseを指定 → 新規作成しない）
		HttpSession session = request.getSession(false);
		request.setCharacterEncoding("UTF-8");

		// セッションからタスク一覧を取得
		@SuppressWarnings("unchecked")
		List<TaskBean> taskList = (ArrayList<TaskBean>) session.getAttribute("taskList");

		// リクエストパラメータから task_id を取得
		int task_id = -1;
		try {
			task_id = Integer.parseInt(request.getParameter("task_id"));
		} catch (NumberFormatException e) {
			// 数値変換に失敗した場合 → 一覧画面に戻す
			request.getRequestDispatcher("TaskListServlet").forward(request, response);
			return;
		}

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

		
		// taskList が null または範囲外アクセス時 → 一覧画面に戻す
			try {
				// 編集対象のタスクを探してセッションに保存
				for (TaskBean task : taskList) {
					if (task.getTask_id() == task_id) {
						session.setAttribute("updateTask", task);
					}
				}
			} catch (NullPointerException e) {
				request.getRequestDispatcher("TaskListServlet").forward(request, response);
				return;
			}

		// DAOを使ってカテゴリ・ステータス・ユーザー一覧を取得しセッションに保存
		TaskEditDAO dao = new TaskEditDAO();
		try {
			session.setAttribute("categoryList", dao.CatedoryListSelect());
			session.setAttribute("statusList", dao.StatusListSelect());
			session.setAttribute("userList", dao.UserListSelect());
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		// 編集画面へフォワード
		request.getRequestDispatcher("taskedit.jsp").forward(request, response);
	}

	/**
	 * POSTメソッドの処理（タスク編集内容の更新処理）
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// セッション取得
		HttpSession session = request.getSession(false);
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

		// 更新処理開始
		request.setCharacterEncoding("UTF-8");
		TaskEditDAO dao = new TaskEditDAO();
		TaskBean updateTask = (TaskBean) session.getAttribute("updateTask");

		// HTMLインジェクション対策（危険な文字を置換）
		String task_name = request.getParameter("task_name")
				.replace("<", "?")
				.replace(">", "?")
				.replace("&", "?")
				.replace("\"", "?")
				.replace("\'", "?");

		String memo = request.getParameter("memo")
				.replace("<", "?")
				.replace(">", "?")
				.replace("&", "?")
				.replace("\"", "?")
				.replace("\'", "?");

		// リクエストから取得した値を更新対象タスクにセット
		updateTask.setTask_name(task_name);
		updateTask.setCategory_id(Integer.parseInt(request.getParameter("category_id")));
		updateTask.setLimit_date(Date.valueOf(request.getParameter("limit_date")));
		updateTask.setUser_id(request.getParameter("user_id"));
		updateTask.setStatus_code(request.getParameter("status_code"));
		updateTask.setMemo(memo);

		// 更新処理結果格納用
		int resultnum = 0;
		String url = "taskediterror.jsp"; // 失敗時の遷移先

		try {
			// DAOでDB更新処理
			resultnum = dao.taskDataUpdate(updateTask);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
			request.getRequestDispatcher(url).forward(request, response);
		}

		// 更新成功した場合は success ページへ
		if (resultnum == 1) {
			url = "taskeditsuccess.jsp";
		}

		// 結果画面へ遷移
		request.getRequestDispatcher(url).forward(request, response);
	}
}
