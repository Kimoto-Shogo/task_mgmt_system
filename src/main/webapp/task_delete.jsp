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

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/bootstrap.min.css">
  <!-- Bootstrap JS -->
  <script src="<%= request.getContextPath() %>/js/bootstrap.bundle.min.js"></script>

  <style>
    thead tr.bg-danger th {
      background-color: #dc3545 !important;
      color: white !important;
    }
  </style>
</head>
<body>
<div class="container mt-5">
  <h2 class="mb-4 text-danger">タスク削除確認画面</h2>
  <hr><br>

  <% if (t != null) { %>
    <p class="lead">以下のタスクを削除します。よろしいですか？</p>

    <table class="table table-bordered">
      <thead>
        <tr class="bg-danger text-white">
          <th>項目</th>
          <th>内容</th>
        </tr>
      </thead>
      <tbody>
        <tr><th>タスクID</th><td><%= t.getTask_id() %></td></tr>
        <tr><th>カテゴリ名</th><td><%= t.getCategory_name() %></td></tr>
        <tr><th>タスク名</th><td><%= t.getTask_name() %></td></tr>
        <tr><th>期限</th><td><%= t.getLimit_date() %></td></tr>
        <tr><th>担当者</th><td><%= t.getUser_name() %></td></tr>
        <tr><th>ステータス</th><td><%= t.getStatus_name() %></td></tr>
        <tr><th>メモ</th><td><%= t.getMemo() %></td></tr>
      </tbody>
    </table>

    <!-- 削除するボタン -->
    <form action="<%= request.getContextPath() %>/TaskDeleteServlet" method="post" style="display:inline;">
      <input type="hidden" name="task_id" value="<%= t.getTask_id() %>">
      <input type="submit" class="btn btn-danger"
             value="削除する"
             onmousedown="this.style.transform='translateY(2px)'"
             onmouseup="this.style.transform='translateY(0)'">
    </form>

    <!-- 一覧へ戻るボタン -->
    <form action="<%= request.getContextPath() %>/TaskListServlet" method="get" style="display:inline;">
      <input type="submit" class="btn btn-secondary"
             value="一覧へ戻る"
             onmousedown="this.style.transform='translateY(2px)'"
             onmouseup="this.style.transform='translateY(0)'">
    </form>

  <% } else { %>
    <p class="text-danger">対象のタスクが見つかりませんでした。</p>
    <a href="<%= request.getContextPath() %>/TaskListServlet" class="btn btn-secondary">一覧へ戻る</a>
  <% } %>
</div>
</body>
</html> 
