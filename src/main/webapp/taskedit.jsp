<%@page import="model.entity.UserBean"%>
<%@page import="model.entity.StatusBean"%>
<%@page import="model.entity.CategoryBean"%>
<%@page import="model.entity.TaskBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%
// セッションから更新対象のタスク情報を取得
TaskBean updateTask = (TaskBean) session.getAttribute("updateTask");

// セッションからカテゴリ一覧を取得（キャスト時はunchecked警告が出るため@SuppressWarnings使用）
@SuppressWarnings("unchecked")
List<CategoryBean> categoryList = (ArrayList<CategoryBean>) session.getAttribute("categoryList");

// ステータス一覧
@SuppressWarnings("unchecked")
List<StatusBean> statusList = (ArrayList<StatusBean>) session.getAttribute("statusList");

// ユーザ一覧
@SuppressWarnings("unchecked")
List<UserBean> userList = (ArrayList<UserBean>) session.getAttribute("userList");
%>
<script type="text/javascript">
	// 「メニューに戻る」ボタン押下時の確認ダイアログ処理
	function onClick() {
		con = confirm("変更内容を放棄し、メニューに戻りますか？");
		if (con) {
			// OKを押した場合メニュー画面へ遷移
			window.open('http://localhost:8080/task_mgmt_system/menu.jsp?',
					'_self');
		}
	}
</script>
<style type="text/css">
/* テーブルデザイン */
table {
	text-align: center;
	border: 1px solid black;
	box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
}

table td {
	text-align: center;
	border: 1px solid black;
	border-left: 1px dotted black; /* 左右は点線に */
	border-right: 1px dotted black;
	box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
}
</style>
<meta charset="UTF-8">
<title>タスク編集画面</title>
</head>
<body>
	<h1>タスク編集画面</h1>
	<hr>
	<br>

	<!-- タスク編集フォーム -->
	<form action="taskEditServlet" method="POST">
		<table>
			<tr>
				<td style="font-weight: bold;">タスクID</td>
				<!-- IDは表示のみ（入力不可） -->
				<td><%=updateTask.getTask_id()%></td>
			</tr>
			<tr>
				<td style="font-weight: bold;">タスク名</td>
				<td>※1 <!-- 入力必須、最大50文字 --> <input type="text" name="task_name"
					value="<%=updateTask.getTask_name()%>" placeholder="タスク名"
					maxlength="50" required></td>
			</tr>
			<tr>
				<td style="font-weight: bold;">カテゴリ</td>
				<td>
					<!-- カテゴリのプルダウン生成 --> <select name="category_id" required>
						<%
						for (CategoryBean category : categoryList) {
						%>
						<option value="<%=category.getCategory_id()%>"
							<%// 更新対象タスクのカテゴリ名と一致すればselected属性を付与
if (updateTask.getCategory_name().equals(category.getCategory_name())) {%>
							selected <%}%>>
							<%=category.getCategory_name()%>
						</option>
						<%
						}
						%>
				</select>
				</td>
			</tr>
			<tr>
				<td style="font-weight: bold;">期限</td>
				<td>
					<!-- 日付入力必須 --> <input type="date" name="limit_date"
					value="<%=updateTask.getLimit_date()%>" required>
				</td>
			</tr>
			<tr>
				<td style="font-weight: bold;">担当者</td>
				<td>
					<!-- 担当者プルダウン --> <select name="user_id" required>
						<%
						for (UserBean user : userList) {
						%>
						<option value="<%=user.getUser_id()%>"
							<%// 担当者名が一致すればselected
if (updateTask.getUser_name().equals(user.getUser_name())) {%>
							selected <%}%>>
							<%=user.getUser_name()%>
						</option>
						<%
						}
						%>
				</select>
				</td>
			</tr>
			<tr>
				<td style="font-weight: bold;">ステータス</td>
				<td>
					<!-- ステータスプルダウン --> <select name="status_code" required>
						<%
						for (StatusBean status : statusList) {
						%>
						<option value="<%=status.getStatus_code()%>"
							<%// ステータス名が一致すればselected
if (updateTask.getStatus_name().equals(status.getStatus_name())) {%>
							selected <%}%>>
							<%=status.getStatus_name()%>
						</option>
						<%
						}
						%>
				</select>
				</td>
			</tr>
			<tr>
				<td style="font-weight: bold;">メモ</td>
				<td>※1 <!-- 最大100文字まで入力可能 --> <textarea name="memo"
						placeholder="100文字まで" maxlength="100" cols="" rows=""><%=updateTask.getMemo()%></textarea>
				</td>
			</tr>
		</table>
		<!-- 更新と取り消しボタン -->
		<input type="submit" value="更新"> <input type="reset"
			value="取り消し">
	</form>

	<!-- メニューに戻るボタン（JavaScript confirmを利用） -->
	<form action="menu.jsp">
		<input type="button" value="メニューに戻る" onclick="onClick()">
	</form>

	<!-- 注意事項 -->
	<p>※1:[&lt;] [&gt;] [&amp;] [&quot;] [&#39;]は自動的に?に置換されます</p>
</body>
</html>
