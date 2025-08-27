<%@page import="model.entity.UserBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List,model.entity.CommentBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- BootsapのCSS読み込み -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<title>コメント画面</title>
<%
//ログイン確認ここから
@SuppressWarnings("unused")
UserBean user = null;

//セッションが存在していても userbean が無ければセッション無効扱い
if (session != null && (user = (UserBean) session.getAttribute("userbean")) == null) {
	session = null;
}

//セッションが無効ならログイン画面へ
if (session == null) {
	request.getRequestDispatcher("login.jsp").forward(request, response);
	return;
}
//ログイン確認ここまで
@SuppressWarnings("unchecked")
List<CommentBean> comList = (List<CommentBean>) session.getAttribute("comList");
%>
</head>
<body>
	<div class="container mt-5">
		<h2>コメント画面</h2>
		<hr>
		<br>
		<%
		if (comList.isEmpty()) {
		%>
		<h3>コメントはまだ投稿されていません。</h3>
		<%
		} else {
		%>
		<table class="table table-active">
			<tr>
				<th colspan="2">投稿データ</th>
				<th>投稿者</th>
				<th  class="w-50">コメント</th>
				<th></th>	
			</tr>
			<%
			for (CommentBean comment : comList) {
			%>
			<tr>
				<!-- colspan -->
				<td><%=comment.getComment_id()%></td>
				<td><%=comment.getUpdate_datetime()%></td>
				<!-- colspanここまで -->
				<td><%=comment.getUser_id()%></td>
				<td><%=comment.getComment()%></td>
				<td>
					<%
					if (comment.getUser_id().equals(user.getUser_id())) {
					%>
					<form action="commentdelete.jsp" method="post">
						<input type="hidden" class="btn btn-secondary mt-1" name="comment_id"
							value="<%=comment.getComment_id()%>">
						<input type="submit" class="btn btn-secondary" value="削除">
					</form> <%
 }
 %>
				</td>
			</tr>
			<%
			}
			%>
		</table>
		<%
		}
		%>
		<form class="mb-5">
			<input type="submit" class="btn btn-primary" formaction="CommentInsertServlet" 
				formmethod="get" value="コメントを書き込む">
			<input type="submit" class="btn btn-primary"
				formaction="TaskListServlet" formmethod="get" value="タスク一覧に戻る">
		</form>
	</div>
</body>
</html>
