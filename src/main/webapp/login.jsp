<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
session.invalidate();
%>
<meta charset="UTF-8">
<title>ログイン画面</title>
<!-- Bootstrap CCS 読み込み -->
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body class="bg-light"><!-- 背景を薄いグレーに -->
	<!-- Flexboxで中央よせ vh-100画面の高さを100%使う -->
	<div class="login-container d-flex justify-content-center align-items-center vh-100">
		<!-- card→Bootatrapのカード(白背景+影付の箱) p-4 shadow 内側に余白をつけ、影を追加　style="width: 350px; カードの幅を350pxに固定" -->
		<div class="card p-4 shadow" style="width: 350px;">
			<h3 class="text-center mb-4">ログイン</h3>
			<form action="LoginServlet" method="POST">
				<div class="mb-3">
					<label for="userid" class="form-label">ユーザID：</label>
					<!-- form-control Bootstrapのフォームデザイン適用（幅100%、角丸、枠線つき） -->
					<input type="text" class="form-control" id="userid" name="userid" required>
				</div>

				<div class="mb-3">
					<label for="password" class="form-label">パスワード:</label> <input
						type="password" class="form-control" id="password" name="password"required>
					
				</div>
				<!--  btn btn-primay w-100-->
				<button type="submit" class="btn btn-primary w-100">ログイン</button>
			</form>
		</div>
	</div>
	<!-- Bootstrap JS 読み込み -->
	<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>