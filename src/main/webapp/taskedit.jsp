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

<meta charset="UTF-8">
<title>タスク編集画面</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body class="container mt-5">
	<div class="card shadow p-4">
		<h2 class="text-center md-4">タスク編集画面</h2>


		<!-- タスク編集フォーム -->
		<form action="taskEditServlet" method="POST">
			<div class="mb-3">
				<label class="form-label fw-bold">タスクID</label> <input type="text"
					class="form-control" value="<%=updateTask.getTask_id()%>" disabled>
			</div>

			<div class="mb-3">
				<label class="form-label fw-bold">タスク名<span
					class="text-danger">※必須</span></label> <input type="text" name="task_name"
					class="form-control" value="<%=updateTask.getTask_name()%>"
					maxlength="50" required>
			</div>

			<div class="mb-3">
				<label class="form-label fw-bold">カテゴリ</label> <select
					name="category_id" class="form-select" required>
					<% for (CategoryBean category : categoryList) { %>
					<option value="<%=category.getCategory_id()%>"
						<% if (updateTask.getCategory_name().equals(category.getCategory_name()))  {%>
						selected <% } %>>
						<%=category.getCategory_name()%>
					</option>
					<% } %>
				</select>
			</div>

			<div class="mb-3">
				<label class="form-label fw-bold">期限</label> <input type="date"
					name="limit_date" class="form-control"
					value="<%=updateTask.getLimit_date()%>" required>
			</div>

			<div class="md-3">
				<label class="form-label fw-bold">担当者</label> <select name="user_id"
					class="form-select" required>
					<% for (UserBean user : userList) { %>
					<option value="<%=user.getUser_id()%>"
						<% if (updateTask.getUser_name().equals(user.getUser_name())) { %>
						selected <% } %>>
						<%=user.getUser_name()%>
					</option>
					<% } %>
				</select>
			</div>

			<div class="mb-3">
				<label class="form-label fw-bold">ステータス</label> <select
					name="status_code" class="form-select" required>
					<% for (StatusBean status : statusList) { %>
					<option value="<%=status.getStatus_code()%>"
						<% if (updateTask.getStatus_name().equals(status.getStatus_name())) { %>
						selected <%  } %>>
						<%=status.getStatus_name()%>
					</option>
					<% } %>
				</select>
			</div>


			<div class="mb-3">
				<label class="form-label fw-bold">メモ</label>
				<textarea name="memo" class="form-control" maxlength="100" rows="3"
					placeholder="100文字まで"><%=updateTask.getMemo()%></textarea>
			</div>

			<!-- ボタンエリア -->
			<div class="d-flex justify-content-end gap-2">
				<button type="submit" class="btn btn-primary">更新</button>
				<button type="reset" class="btn btn-secondary">取り消し</button>
				</div>
				
				<div class="text-center">
					<button type="button" class="btn btn-outline-dark"
					onclick="onClick()">メニューに戻る</button>
			</div>
		</form>

		<div class="mt-3 text-muted small">※[&lt;] [&gt;] [&amp;]
			[&quot;] [&#39;]は自動的に?に置換されます</div>
	</div>

</body>
</html>
