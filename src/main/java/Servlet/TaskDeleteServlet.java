package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.TaskDeleteDAO;

/**
 * Servlet implementation class TaskDeleteServlet
 */
@WebServlet("/TaskDeleteServlet")
public class TaskDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// リクエストのエンコーディング方式を指定
		request.setCharacterEncoding("UTF-8");
		TaskDeleteDAO dao = new TaskDeleteDAO();
		int task_id = Integer.parseInt(request.getParameter("task_id"));
		
		int processingNumber = 0; //処理件数
		try {
			// 削除処理
			processingNumber = dao.deleteItem(task_id);
			
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		// 処理件数をリクエストスコープに設定
		request.setAttribute("processingNumber", processingNumber);
		// 削除結果画面に遷移
		RequestDispatcher rd = request.getRequestDispatcher("task_delete.jsp");
		rd.forward(request, response);
	}

}
