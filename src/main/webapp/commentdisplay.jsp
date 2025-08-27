<%@page import="model.entity.UserBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List,model.entity.CommentBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	<h2>コメント画面</h2>
	<hr>
	<br>
	<%if(comList.isEmpty()) {%>
	<h3>コメントはまだ投稿されていません。</h3>
	<%}else{%>
	<table style="text-align: center;">
		<tr>
			<th colspan="2">投稿データ</th>
			<th>投稿者</th>
			<th>コメントメッセージ</th>
		</tr>
		<%
		for (CommentBean comment : comList) {
		%>
		<tr>
			<!-- colspan -->
			<td><%=comment.getComment_id()%></td>
			<td><%=comment.getUpdate_datetime()%></td>
			<td><%=comment.getUser_id() %></td>
			<!-- colspanここまで -->
			<td style="text-align: left;"><%=comment.getComment()%></td>
			<td>
				<%
				if (comment.getUser_id().equals(user.getUser_id())) {
				%>
				<form action="commentdelete.jsp" method="post">
					<input type="hidden" name="comment_id"
						value="<%=comment.getComment_id()%>"> <input type="submit"
						value="削除">
				</form> <%}%>
			</td>
		</tr>
		<%}%>
	</table>
	<%} %>
	<form action="">
		<input type="submit" formaction="CommentInsertServlet"
			formmethod="get" value="コメントを書き込む"> <input type="submit"
			formaction="TaskListServlet" formmethod="get" value="タスク一覧に戻る">
	</form>
</body>
</html>
