/**task_mgmt_system
 * Servlet.TaskRegisterServlet.java
 */
package Servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.TaskRegisterDAO;
import model.entity.CategoryBean;
import model.entity.StatusBean;
import model.entity.TaskBean;
import model.entity.UserBean;

/**
 * Servlet implementation class TaskRegisterServlet
 */
@WebServlet("/task-register-servlet")
public class TaskRegisterServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		TaskRegisterDAO trdao = new TaskRegisterDAO();
		
		//カテゴリ情報の取得
		try {
			List<CategoryBean> cb = trdao.categorycode();
			
			//セッションでカテゴリ情報を保存
			session.setAttribute("category", cb);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		
		//ユーザ情報の取得
		try {
			List<UserBean> ub = trdao.user();
			
			//セッションでユーザ情報を保存
			session.setAttribute("user", ub);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		
		//ステータス情報の取得
		try {
			List<StatusBean> sb = trdao.statuscode();
			
			//セッションでステータス情報を保存
			session.setAttribute("status", sb);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		//リクエストの転送							
		RequestDispatcher rd = request.getRequestDispatcher("task_register.jsp");
		rd.forward(request, response);
	}

	
	//タスク登録
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//エンコード
		request.setCharacterEncoding("UTF-8");
		
		//"task_register.jsp"から値を受け取る
		String taskname = request.getParameter("task_name");
		int category_id = Integer.parseInt(request.getParameter("category_id"));
		Date limit = Date.valueOf(request.getParameter("limit"));//String型からsqlのDate型に直す
		String user_id = request.getParameter("user_id");
		String status_code = request.getParameter("status_code");
		String memo = request.getParameter("memo");
		
		//"TaskBean"に値を格納
		TaskBean tb = new TaskBean();
		tb.setTask_name(taskname);
		tb.setCategory_id(category_id);
		tb.setLimit_date(limit);
		tb.setUser_id(user_id);
		tb.setStatus_code(status_code);
		tb.setMemo(memo);
		
		//タスク登録をして、成功か失敗を"judg"で判定
		TaskRegisterDAO trdao = new TaskRegisterDAO();
		int judge = 0;
		String url = null;
		try {
			judge = trdao.register(tb);
			
			if(judge == 1) {
				url = "task_register_success.jsp";
			}else {
				url = "task_register_failure.jsp";
			}
			
		} catch (ClassNotFoundException | SQLException | NumberFormatException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
		
	}

}
