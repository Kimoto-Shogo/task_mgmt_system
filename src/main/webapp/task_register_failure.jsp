<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>タスク登録失敗画面</title>

<link href="css/bootstrap.min.css" rel="stylesheet">

</head>
<body class="bg-light">

<%-- セッション情報の削除 --%>
<%
    session.removeAttribute("category");
    session.removeAttribute("user");
    session.removeAttribute("status");
%>

<div class="container mt-5">
    <div class="alert alert-danger text-center" role="alert">
        <h2 class="mb-3">❌ タスク登録に失敗しました。</h2>
        <p>もう一度お試しください。</p>
    </div>

    <div class="d-flex justify-content-center gap-3 mt-4">
        <form action="task-register-servlet" method="get">
            <button type="submit" class="btn btn-danger">タスク登録画面へ</button>
        </form>

        <form action="menu.jsp" method="get">
            <button type="submit" class="btn btn-secondary">メニュー画面へ</button>
        </form>
    </div>
</div>

</body>
</html>
