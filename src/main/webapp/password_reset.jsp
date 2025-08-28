<%@page import="model.entity.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>パスワード再設定画面</title>
<!-- Bootstrap CCS 読み込み -->
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body class="bg-light d-flex justify-content-center align-items-center vh-100">
	<div class="card p-4 shadow" style="width: 400px;">
	
	<h3 class="text-center mb-4">パスワード再設定</h3>
	
	<form action="PasswordServlet" method="POST" class="mb-3">
		<div class="mb-3">
		<label class="form-label">ユーザーID:</label>
		<input type="text" name="userid" class="form-control"required>
		</div> 
		<div class="mb-3">
		<label class="form-label">ユーザー名：</label>
		<input type="text" name="username" class="form-control" required>
		</div>
		<div class="mb-3">
		<label class="form-label">新しいパスワード:</label>
		<input type="password" name="password" class="form-control" required>
		</div>
		<button type="submit" class="btn btn-success w-100">再設定</button>
	</form>
	
	<form action="login.jsp" method="POST">
		<button type="submit" class="btn btn-primary w-100">ログイン画面へ</button>
	</form>
	</div>
	<script src="js/bootstrap.bundle.min.js"></script>

</body>
</html>