package controller.member;

import model.HocVien_hko;
import model.HocVien_hko.GioiTinh;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.math.BigDecimal;
import java.sql.Date;

@WebServlet("/dangnhaphocvien")
public class Dangnhaphocvien_hkoController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("views/member/dangnhaphocvien_hko.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String studentId = request.getParameter("studentId");
        String password = request.getParameter("password");

        int maHocVien;
        try {
            maHocVien = Integer.parseInt(studentId);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Mã học viên phải là số!");
            request.getRequestDispatcher("views/member/dangnhaphocvien_hko.jsp").forward(request, response);
            return;
        }

        try {
            HocVien_hko hocVien = checkLogin(maHocVien, password);
            if (hocVien != null) {
                HttpSession session = request.getSession();
                session.setAttribute("hocVien", hocVien);
                response.sendRedirect("homemember");
            } else {
                request.setAttribute("errorMessage", "Thông tin đăng nhập không chính xác!");
                request.getRequestDispatcher("views/member/dangnhaphocvien_hko.jsp").forward(request, response);
            }
        } catch (SQLException | NamingException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Lỗi kết nối cơ sở dữ liệu: " + e.getMessage());
            request.getRequestDispatcher("views/member/dangnhaphocvien_hko.jsp").forward(request, response);
        }
    }

    private HocVien_hko checkLogin(int maHocVien, String password) throws SQLException, NamingException {
        InitialContext ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/HoangKimOanh_2210900053");

        String sql = "SELECT * FROM HocVien_hko WHERE MaHocVien = ? AND matKhau = ?";
        try (Connection connection = ds.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, maHocVien);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // Convert String to java.sql.Date
                    String ngaySinhStr = rs.getString("NgaySinh");
                    Date ngaySinh = ngaySinhStr != null ? Date.valueOf(ngaySinhStr) : null;

                    // Convert String to GioiTinh enum
                    String gioiTinhStr = rs.getString("GioiTinh");
                    GioiTinh gioiTinh = gioiTinhStr != null ? GioiTinh.valueOf(gioiTinhStr) : null;

                    // Convert to BigDecimal
                    BigDecimal diemSo = rs.getBigDecimal("DiemSo");

                    return new HocVien_hko(
                            rs.getInt("MaHocVien"),
                            rs.getString("TenHocVien"),
                            ngaySinh,
                            gioiTinh,
                            rs.getString("DiaChi"),
                            rs.getString("Email"),
                            rs.getString("LichHoc"),
                            diemSo,
                            rs.getString("matKhau")
                    );
                }
            }
        }
        return null;
    }
}