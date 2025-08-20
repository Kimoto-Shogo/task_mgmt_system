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
import javax.servlet.http.HttpSession;

import model.dao.TaskListDAO;
import model.entity.TaskBean;

@WebServlet("/TaskListServlet")
public class TaskListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		List<TaskBean> taskList = new ArrayList<>();

		// DAOの生成
		TaskListDAO dao = new TaskListDAO();

		try {
			// DAOの利用
			taskList = dao.selectAll();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		// リクエストスコープへの属性の設定
		session.setAttribute("taskList", taskList);

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher("task.jsp");
		rd.forward(request, response);
	}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		List<TaskBean> taskList = new ArrayList<>();
		
		TaskListDAO dao = new TaskListDAO();
		
		try {
			// DAOの利用
			taskList = dao.selectAll();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("taskList", taskList);
		
		RequestDispatcher rd = request.getRequestDispatcher("task.jsp");
		rd.forward(request, response);
		
	}

}
