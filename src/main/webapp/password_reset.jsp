<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>パスワード再設定画面</title>
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

	<h2>パスワード再設定</h2>
	<form action="PasswordServlet" method="POST">
		ユーザID：<input type="text" name="userid"><br> 
		ユーザー名：<input type="text" name="username"><br>
		新しいパスワード:<input type="password" name="password"><br>
		<input type="submit"value="再設定"><br>
	</form>
	
	<form action="login.jsp" method="POST">
		<input type="submit" value="ログイン画面へ">
	</form>

</body>
</html>