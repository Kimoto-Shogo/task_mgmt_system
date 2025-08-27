<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログアウト画面</title>
<!-- Bootstrap CCS 読み込み -->
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body
	class="bg-light d-flex justify-content-center align-items-center vh-100">
	<div class="card p-4 shadow" style="widh: 350px">
		<h3 class="text-center mb-4 text-dark">ログアウトしました</h3>

		<form action="login.jsp" method="POST">
			<button type="submit" class="btn btn-primary w-100">ログイン画面へ</button>
		</form>
	</div>
	<!-- Bootstrap JS 読み込み -->
	<script src="js/bootstrap.bundle.min.js"></script>

</body>
</html>