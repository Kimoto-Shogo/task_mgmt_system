package Servlet; // ← 本来は小文字の "servlet" が一般的だけど、今回は現状に合わせます

import java.io.IOException;
import java.sql.SQLException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.TaskDeleteDAO;
import model.entity.TaskBean;

@WebServlet("/TaskDeleteServlet")
public class TaskDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /** 削除確認の表示（GET） */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // 1) パラメータを取り出す
        String idStr = request.getParameter("task_id");
        if (idStr == null || idStr.isEmpty()) {
            // エラーとしてエラーページへ
            request.setAttribute("errorMessage", "タスクIDが指定されていません。");
            request.getRequestDispatcher("task_delete_error.jsp").forward(request, response);
            return;
        }

        try {
            // 2) 数字に変換（数字じゃないと例外）
            int taskId = Integer.parseInt(idStr);

            // 3) DB から1件取得
            TaskDeleteDAO dao = new TaskDeleteDAO();
            TaskBean t = dao.findDetailById(taskId);

            if (t == null) {
                // 指定IDのデータがない
                request.setAttribute("errorMessage", "対象のタスクが見つかりません。");
                request.getRequestDispatcher("task_delete_error.jsp").forward(request, response);
                return;
            }

            // 4) CSRFトークンを発行して、画面→POST で送り返してもらう
            String token = UUID.randomUUID().toString();
            request.getSession().setAttribute("csrf_token", token);
            request.setAttribute("csrf_token", token);

            // 5) JSP に渡して確認画面を表示
            request.setAttribute("t", t);
            request.getRequestDispatcher("task_delete.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            // 文字→数字にできなかった場合
            response.sendError(400, "task_id must be number");
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException(e);
        }
    }

    /** 削除実行（POST） */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");


        // 1) パラメータ確認
        String idStr = request.getParameter("task_id");
        if (idStr == null || idStr.isEmpty()) {
            request.setAttribute("errorMessage", "タスクIDが指定されていません。");
            request.getRequestDispatcher("task_delete_error.jsp").forward(request, response);
            return;
        }

        try {
            int taskId = Integer.parseInt(idStr);
            TaskDeleteDAO dao = new TaskDeleteDAO();

            // 2) ★削除前に表示用の詳細を確保（削除後はDBから取れないため）
            TaskBean deletedTask = dao.findDetailById(taskId);

            // 3) 実際に削除
            int n = dao.deleteItem(taskId);

            // 4) 結果に応じて画面へ（相対パスのまま）
            if (n > 0) {
                request.setAttribute("deletedCount", n);
                request.setAttribute("deletedTask", deletedTask); // 完了画面で表表示に使う
                request.getRequestDispatcher("task_delete_result.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "削除できませんでした。");
                request.getRequestDispatcher("task_delete_error.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            response.sendError(400, "task_id must be number");
        } catch (Exception e) {
            request.setAttribute("errorMessage", "システムエラーが発生しました。");
            request.getRequestDispatcher("task_delete_error.jsp").forward(request, response);
        }
    }
}
