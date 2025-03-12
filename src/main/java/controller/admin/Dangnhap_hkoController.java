package controller.admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/dangnhapadmin")
public class Dangnhap_hkoController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session != null && session.getAttribute("adminUser") != null) {
            response.sendRedirect(request.getContextPath() + "/homeadmin");
            return;
        }
        request.getRequestDispatcher("views/admin/dangnhapadmin_hko.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        if (isValidLogin(username, phone, password)) {
            HttpSession session = request.getSession(true);
            session.setAttribute("adminUser", username);

            response.sendRedirect(request.getContextPath() + "/homeadmin");
        } else {
            request.setAttribute("errorMessage", "Sai tài khoản hoặc mật khẩu!");
            request.getRequestDispatcher("views/admin/dangnhapadmin_hko.jsp").forward(request, response);
        }
    }

    private boolean isValidLogin(String username, String phone, String password) {
        return "oanh".equals(username) && "0327293429".equals(phone) && "oanh".equals(password);
    }
}
