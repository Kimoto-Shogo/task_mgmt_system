<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.entity.UserBean" %>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<title>メニュー画面</title>
<!-- Bootstrap CCS 読み込み -->
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="login-container d-flex justify-content-center align-items-center vh-100">
<div class="card p-4 shadow" style="width: 350px;">
<h3 class="text-center mb-4">メニュー</h3>

	<form action="task-register-servlet" method="GET" class="mb-2">
		<button type="submit" class="btn btn-primary w-100">タスク登録</button>
	</form>
	
	<form action="TaskListServlet" method="GET" class="mb-2">
		<button type="submit" class="btn btn-success w-100">タスク一覧表示</button>
	</form>
	</div>
	
		<form action="LogoutServlet" method="POST" class="position-absolute w-100" style="bottom: 100px; left: 0;">
	<div class="d-flex justify-content-center">
		<button type="submit" class="btn btn-secondary">ログアウト</button>
	</div>
	</form>
	</div>
	<!-- Bootstrap JS 読み込み -->
	<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>