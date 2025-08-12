package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.UserDAO;
import model.entity.UserBean;

/**
 * Servlet implementation class PasswordServlet
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

		try {

			// DAOの生成
			UserDAO userDao = new UserDAO();//オブジェクトの用意
			UserBean userbean = new UserBean();
			userbean.setUser_id(userid);//beanの中に入れてあげる
			userbean.setUser_name(username);//beanの中に入れてあげる
			userbean = userDao.passwordUpdate(userbean);//beanの中にdaoのDBに入ってたものがかえって来る。引数はuserbeanでかえって来る。

			if (userbean.getUser_id() == userbean.getUser_name()) {
				// 認証成功
				url = "login.jsp";//trueだったらlogin.jspに行く

				// セッションオブジェクトの取得
				HttpSession session = request.getSession();//

				// セッションスコープでユーザー情報を保存してあげる。
				session.setAttribute("userbean", userbean);

			} else {
				// 認証失敗
				url = "password_failure.jsp";
			}

		} catch (ClassNotFoundException | SQLException e) {

		}

	}

}
