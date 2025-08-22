package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.UserDAO;
import model.entity.UserBean;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// セッションオブジェクトの取得
		HttpSession session = request.getSession();//
		
		request.setCharacterEncoding("UTF-8");
		String url = null; 
		
		String userid = request.getParameter("userid");//jspの値を入れてあげる
		String password = request.getParameter("password");
		
		try {
			
			// DAOの生成
			UserDAO userDao = new UserDAO();//オブジェクトの用意
			UserBean userbean = new UserBean();
			userbean.setUser_id(userid);//beanの中に入れてあげる
			userbean.setPassword(password);//beanの中に入れてあげる
			userbean = userDao.loginCheck(userbean);//beanの中にdaoのDBに入ってたものがかえって来る。引数はuserbeanでかえって来る。
			
			if (userbean.getUser_name() != null) {//nameが空ではなかったらtrueになる
				// 認証成功
				url = "menu.jsp";//trueだったらmenu.jspに行く

				// セッションスコープでユーザー情報を保存してあげる。
				session.setAttribute("userbean", userbean);

			} else {
				//ログイン失敗
				session.setAttribute("userbean", userbean);
				url = "login-failure.jsp";
	
			}
			
			
			
		} catch (ClassNotFoundException|SQLException e){
			e.printStackTrace();
		}
		
		// リクエストの転送、menu.jspに転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	
	}

}
