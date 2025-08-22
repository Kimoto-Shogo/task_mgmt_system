<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.entity.TaskBean" %> <!-- ← TaskBean の実際のパッケージ名 -->
<%
TaskBean t = (TaskBean) request.getAttribute("t");
%>

<html>
<head><title>タスク削除確認</title></head>
<body>
<h2>このタスクを削除しますか？</h2>
<% if (t != null) { %>
<form action="<%= request.getContextPath() %>" method="post">

<table border="1" cellpadding="6">
  <tr><th>タスク名</th><td><%= t.getTask_name() %></td></tr>
  <tr><th>カテゴリ</th><td><%= t.getCategory_name() %></td></tr>
  <tr><th>期限</th><td><%= t.getLimit_date() %></td></tr>
  <tr><th>担当者</th><td><%= t.getUser_name() %></td></tr>
  <tr><th>ステータス</th><td><%= t.getStatus_name() %></td></tr>
  <tr><th>メモ</th><td><%= t.getMemo() %></td></tr>
</table>

  <input type="hidden" name="task_id" value="<%= t.getTask_id() %>">
  <input type="submit" value="削除する">
  <a href="<%= request.getContextPath() %>/task/list">戻る</a>
</form>
<% } %>
</body>
</html>
