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

import model.dao.TaskEditDAO;
import model.entity.TaskBean;

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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		TaskEditDAO dao = new TaskEditDAO();
		@SuppressWarnings("unchecked")
		List<TaskBean> taskList = (ArrayList<TaskBean>)session.getAttribute("taskList");
		
		TaskBean updateTask = taskList.get(Integer.parseInt(request.getParameter("id")));
		
		session.setAttribute("updateTask", updateTask);
		try {
			session.setAttribute("categoryList",dao.CatedoryListSelect());
			session.setAttribute("statusList",dao.StatusListSelect());
			session.setAttribute("UserList",dao.UserListSelect());
		} catch (ClassNotFoundException | SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		RequestDispatcher dis = request.getRequestDispatcher("taskedit.jsp");
		dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
