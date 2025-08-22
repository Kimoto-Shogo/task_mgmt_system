<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.entity.UserBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>メニュー画面</title>
</head>
<body>

<%		session = request.getSession(false);
		@SuppressWarnings("unused")
		UserBean user = null;
		
		if (session != null && (user = (UserBean)session.getAttribute("userbean")) == null) {
			session = null;
		}
		
		if(session == null) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}
		%>


	<form action="task-register-servlet" method="GET">
		<input type="submit" value="タスク登録画面"><br>
	</form>
	
	<form action="TaskListServlet" method="GET">
		<input type="submit" value="タスク一覧表示画面"><br>
	</form>
	
	<form action="LogoutServlet" method="POST">
	
		<input type="submit" value="ログアウト"><br>
	</form>

</body>
</html>