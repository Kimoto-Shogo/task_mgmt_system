<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.entity.TaskBean" %>
<%
    String errorMessage = (String) request.getAttribute("errorMessage");
    TaskBean t = (TaskBean) request.getAttribute("t"); // あれば表示（nullでもOK）
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>タスク削除エラー</title>
</head>
<body>
  <h2 class="title">タスク削除エラー画面</h2>
  <hr>

  <p class="lead"><strong>削除処理中にエラーが発生しました。</strong></p>

  <!-- 確認/完了と同じ表スタイル -->
  <table border="1">
    <tr>
      <th>エラー内容</th>
      <td><%= (errorMessage != null) ? errorMessage : "不明なエラーです。" %></td>
    </tr>

    <%-- エラー時でも対象タスクが分かる場合は再表示 --%>
    <% if (t != null) { %>
      <tr><th>タスクID</th>     <td><%= t.getTask_id() %></td></tr>
      <tr><th>カテゴリ名</th>   <td><%= t.getCategory_name() %></td></tr>
      <tr><th>タスク名</th>     <td><%= t.getTask_name() %></td></tr>
      <tr><th>期限</th>         <td><%= t.getLimit_date() %></td></tr>
      <tr><th>担当者</th>       <td><%= t.getUser_name() %></td></tr>
      <tr><th>ステータス</th>   <td><%= t.getStatus_name() %></td></tr>
      <tr><th>メモ</th>         <td><%= t.getMemo() %></td></tr>
    <% } %>
  </table>
  <br>

  <!-- ボタンも他ページと同じ：横並び -->
  <div class="actions">
    <form action="<%= request.getContextPath() %>/TaskListServlet" method="get" style="display:inline;">
      <input type="submit" value="一覧へ戻る">
    </form>

    <%-- 詳細に戻れる状況なら戻るボタンも表示 --%>
    <% if (t != null) { %>
      <form action="<%= request.getContextPath() %>/TaskDeleteServlet" method="get" style="display:inline;">
        <input type="hidden" name="task_id" value="<%= t.getTask_id() %>">
        <input type="submit" value="詳細表示へ">
      </form>
    <% } %>
  </div>

</body>
</html>
