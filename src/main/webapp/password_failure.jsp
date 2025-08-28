<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>パスワード再設定失敗画面</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>

<body class="bg-light">

	<!-- Flexboxで中央寄せ -->
	<div class="d-flex justify-content-center align-items-center vh-100">
		<!-- Bootstrapカード -->
		<div class="card p-4 shadow" style="width: 350px;">
			<h3 class="text-center mb-4 text-danger">エラー</h3>
			<p class="text-center mb-4">パスワードの再設定に失敗しました。</p>

			<!-- 再設定画面へ戻るボタン -->
			<form action="password_reset.jsp" method="POST">
				<button type="submit" class="btn btn-primary w-100">パスワード設定画面へ</button>
			</form>
		</div>
	</div>

	<!-- Bootstrap JS 読み込み -->
	<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>