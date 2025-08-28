<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン失敗画面</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body class="bg-light d-flex justify-content-center align-items-center vh-100">
	<div class="card p-4 shadow" style="width: 400px;">
	<h3 class="text-center text-dark mb-4">ログインに失敗しました</h3>

	<div class="d-grid gap-2">
		<a href="password_reset.jsp" class="btn btn-warning">パスワード再設定画面へ</a>

		<form action="login.jsp" method="post">
			<button type="submit" class="btn btn-primary w-100">ログイン画面へ</button>
		</form>
	</div>
	</div>

	<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>