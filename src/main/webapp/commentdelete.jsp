<%@page import="model.entity.UserBean"%>
<%@page import="model.entity.CommentBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- BootsapのCSS読み込み -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<title>コメント削除画面</title>
<%
//ログイン確認ここから
@SuppressWarnings("unused")
UserBean user = null;

// セッションが存在していても userbean が無ければセッション無効扱い
if (session != null && (user = (UserBean) session.getAttribute("userbean")) == null) {
	session = null;
}

// セッションが無効ならログイン画面へ
if (session == null) {
	request.getRequestDispatcher("login.jsp").forward(request, response);
	return;
}
//ログイン確認ここまで
@SuppressWarnings("unchecked")
List<CommentBean> comList = (List<CommentBean>) session.getAttribute("comList");
int dCommentId = Integer.parseInt(request.getParameter("comment_id"));
session.setAttribute("dCommentId", dCommentId);
CommentBean deletecomment = null;
for (CommentBean comment : comList) {
	if (comment.getComment_id() == dCommentId) {
		deletecomment = comment;
	}
}
session.setAttribute("deletecomment", deletecomment);
%>
</head>
<body>
	<div class="container mt-5">
		<h2>以下のコメントを削除しますか？</h2>
		<table class="table table-active">
			<tr>
				<th colspan="2">投稿データ</th>
				<th class="">コメント</th>
			</tr>
			<tr>
				<!-- colspan -->
				<td><%=deletecomment.getComment_id()%></td>
				<td><%=deletecomment.getUpdate_datetime()%></td>
				<!-- colspanここまで -->
				<td class="w-75"><%=deletecomment.getComment()%></td>
			</tr>
		</table>
		<form action="CommentDeleteServlet" method="post" >
			<div class="d-flex justify-content-end">
				<input type="submit" value="削除" class="btn btn-secondary mt-1">
			</div>
			<input type="submit" class="btn btn-primary"
			formaction="CommentDisplayServlet" formmethod="get" value="コメント一覧に戻る">
		</form>
	</div>
</body>
</html>