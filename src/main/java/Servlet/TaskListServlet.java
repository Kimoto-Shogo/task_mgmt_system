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

import model.dao.TaskListDAO;
import model.entity.TaskBean;

@WebServlet("/TaskListServlet")
public class TaskListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<TaskBean> employeeList = new ArrayList<>();

		// DAOの生成
		TaskListDAO dao = new TaskListDAO();

		try {
			// DAOの利用
			employeeList = dao.selectAll();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		// リクエストスコープへの属性の設定
		request.setAttribute("employeeList", employeeList);

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher("task.jsp");
		rd.forward(request, response);
	}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		List<TaskBean> employeeList = new ArrayList<>();
		
		TaskListDAO dao = new TaskListDAO();
		
		try {
			// DAOの利用
			employeeList = dao.selectAll();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("employeeList", employeeList);
		
		RequestDispatcher rd = request.getRequestDispatcher("task.jsp");
		rd.forward(request, response);
		
	}

}
