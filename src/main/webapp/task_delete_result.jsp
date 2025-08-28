<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.entity.TaskBean" %>
<%
    Integer deletedCount = (Integer) request.getAttribute("deletedCount");
    TaskBean t = (TaskBean) request.getAttribute("deletedTask"); // ← 受け取る
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>削除完了</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/bootstrap.min.css">
  <!-- Bootstrap JS -->
  <script src="<%= request.getContextPath() %>/js/bootstrap.bundle.min.js"></script>

  <style>
    thead tr.bg-success th {
      background-color: #198754 !important; /* Bootstrapのsuccess色 */
      color: white !important;
    }
  </style>
</head>
<body>
<div class="container mt-5">
  <h2 class="mb-4 text-success">削除結果画面</h2>
  <hr><br>

  <% if (deletedCount != null && deletedCount > 0) { %>
    <p class="lead text-success">次のデータを削除しました（<%= deletedCount %> 件）。</p>

    <% if (t != null) { %>
      <table class="table table-bordered">
        <thead>
          <tr class="bg-success text-white">
            <th>項目</th>
            <th>内容</th>
          </tr>
        </thead>
        <tbody>
          <tr><th>タスクID</th>     <td><%= t.getTask_id() %></td></tr>
          <tr><th>カテゴリ名</th>   <td><%= t.getCategory_name() %></td></tr>
          <tr><th>タスク名</th>     <td><%= t.getTask_name() %></td></tr>
          <tr><th>期限</th>         <td><%= t.getLimit_date() %></td></tr>
          <tr><th>担当者</th>       <td><%= t.getUser_name() %></td></tr>
          <tr><th>ステータス</th>   <td><%= t.getStatus_name() %></td></tr>
          <tr><th>メモ</th>         <td><%= t.getMemo() %></td></tr>
        </tbody>
      </table>
    <% } %>
  <% } else { %>
    <p class="text-danger">削除できませんでした。</p>
  <% } %>

  <!--  一覧へ戻るボタン  -->
  <form action="<%= request.getContextPath() %>/TaskListServlet" method="get" style="display:inline;">
    <input type="submit" class="btn btn-secondary mt-3"
           value="一覧へ戻る"
           onmousedown="this.style.transform='translateY(2px)'"
           onmouseup="this.style.transform='translateY(0)'">
  </form>
</div>
</body>
</html>
