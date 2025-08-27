<%@page import="model.entity.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
//ログイン確認ここから
@SuppressWarnings("unused")
UserBean user = null;

// セッションが存在していても userbean が無ければセッション無効扱い
if (session != null && (user = (UserBean) session.getAttribute	("userbean")) == null) {
	session = null;
}

// セッションが無効ならログイン画面へ
if (session == null) {
	request.getRequestDispatcher("login.jsp").forward(request, response);
	return;
}
//ログイン確認ここまで
%>
<meta charset="UTF-8">
<!-- BootsapのCSS読み込み -->
<link href="css/bootstrap.min.css" rel="stylesheet" />
<title>コメント書込み画面</title>
</head>
<body>
	<div class="container mt-5">
		<h2>新規コメント書き込み画面</h2>
		<br>
		<hr>
		<form action="CommentInsertServlet" method="post" class="form-control">
					<b>コメント</b>
					<textarea name="comment" maxlength="100" class="form-control"></textarea>
					<div class="d-flex justify-content-end">
						<input  type="submit" value="送信" class="btn btn-primary mt-1">
					</div>
		</form>
		<form action="CommentDisplayServlet" method="post">
			<input type="submit" value="コメント一覧に戻る" class="btn btn-primary mt-2">
		</form>
	</div>
</body>
</html>