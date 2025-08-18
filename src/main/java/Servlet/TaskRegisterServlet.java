package Servlet;

import java.io.IOException;
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

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
