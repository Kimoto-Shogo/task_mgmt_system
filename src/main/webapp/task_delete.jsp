<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.entity.TaskBean" %>
<%
    TaskBean t = (TaskBean) request.getAttribute("t");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>タスク削除確認</title>
</head>
<body>
    <h2 class="title">タスク削除確認画面</h2>
<hr>

	<form action="<%= request.getContextPath() %>/TaskDeleteServlet" method="post" style="display:inline;">
  
    <% if (t != null) { %>
    <p class="lead">以下のタスクを削除します。よろしいですか？</p>

    <table border="1">
        <tr><th>タスクID</th><td><%= t.getTask_id() %></td></tr>
        <tr><th>カテゴリ名</th><td><%= t.getCategory_name() %></td></tr>
        <tr><th>タスク名</th><td><%= t.getTask_name() %></td></tr>
        <tr><th>期限</th><td><%= t.getLimit_date() %></td></tr>
        <tr><th>担当者</th><td><%= t.getUser_name() %></td></tr>
        <tr><th>ステータス</th><td><%= t.getStatus_name() %></td></tr>
        <tr><th>メモ</th><td><%= t.getMemo() %></td></tr>
    </table>
    <br>

   	<form action="<%= request.getContextPath() %>/TaskDeleteServlet" method="get" style="display:inline;">
  	<input type="hidden" name="task_id" value="<%= t.getTask_id() %>">
  	<input type="hidden" name="confirm" value="1"><!-- ★最終確認へ -->
  	<input type="submit" value="削除する">
	</form>


	<form action="<%= request.getContextPath() %>/TaskListServlet" method="get" style="display:inline;">
  	<input type="submit" value="一覧へ戻る">
	</form>
    
    

    <% } else { %>
        <p>対象のタスクが見つかりませんでした。</p>
        <a href="<%= request.getContextPath() %>/TaskListServlet">一覧へ戻る</a>
    <% } %>

</body>
</html>
