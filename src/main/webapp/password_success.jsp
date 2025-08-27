<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>パスワード再設定完了</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body class="bg-light d-flex justify-content-center align-items-center vh-100">
	<div class="card p-4 shadow" style="width: 400px;">
	<h3 class="text-center mb-4">パスワード再設定完了</h3>
	<p class="text-center text-success mb-4">パスワードの再設定が完了いたしました</p>
	
	<form action="login.jsp" method="POST">
		<button type="submit" class="btn btn-primary w-100">ログイン画面へ</button>
	</form>
	</div>

</body>
</html>