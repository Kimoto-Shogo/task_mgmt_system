package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDAO;
import model.entity.UserBean;


/**
 * Servlet implementation class PasswordServlet
 */
/**パスワードの再設定を判定し各画面に遷移する
 * @author 寺西
 */
@WebServlet("/PasswordServlet")
public class PasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String url = null;

		String userid = request.getParameter("userid");//jspの値を入れてあげる
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		UserDAO dao = new UserDAO();
		UserBean bean = new UserBean();
		
		bean.setUser_id(userid);
		bean.setUser_name(username);
		bean.setPassword(password);
		
		try {
			int count = 0;
			//オブジェクトの用意
			count = dao.passwordUpdate(bean);

			if (count==1) {
				// 認証成功
				url = "password_success.jsp";//trueだったらに行く


			} else {
				// 認証失敗
				url = "password_failure.jsp";
			}

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
		

	}

}
