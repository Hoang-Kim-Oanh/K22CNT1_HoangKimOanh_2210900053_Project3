package controller.member;

import model.HocVien_hko; // Đổi import sang HocVien_hko

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/homemember/*")
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Kiểm tra session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("hocVien") == null) {
            response.sendRedirect("dangnhaphocvien");
            return;
        }

        // Lấy thông tin học viên từ session
        HocVien_hko hocVien = (HocVien_hko) session.getAttribute("hocVien"); // Đổi sang HocVien_hko
        request.setAttribute("tenHocVien", hocVien.getTenHocVien());
        request.setAttribute("maHocVien", hocVien.getMaHocVien());
        request.setAttribute("maKhoaHoc", hocVien.getMaKhoaHoc());
        request.setAttribute("ngaySinh", hocVien.getNgaySinh());
        request.setAttribute("diaChi", hocVien.getDiaChi());
        request.setAttribute("email", hocVien.getEmail());
        request.setAttribute("gioiTinh", hocVien.getGioiTinh());

        // Điều hướng đến trang chính
        request.getRequestDispatcher("/views/member/trangchumember.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
