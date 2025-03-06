package controller.web;

import model.TuVanDangKy_hko;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/home")
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("views/web/trangchu.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String hoTen = request.getParameter("hoten");
        String soDienThoai = request.getParameter("sodienthoai");
        String yeuCauTuVan = request.getParameter("cauhoi");
        String bandangla = request.getParameter("bandangla");

        // Lấy thời gian đăng ký hiện tại
        String ngayDangKy = java.time.LocalDate.now().toString();  // VD: 2025-03-06

        // Tạo đối tượng TuVanDangKy_hko
        TuVanDangKy_hko tuVan = new TuVanDangKy_hko();
        tuVan.setHoTenKhach(hoTen);
        tuVan.setSoDienThoai(soDienThoai);
        tuVan.setYeuCauTuVan(yeuCauTuVan);
        tuVan.setNgayDangKy(ngayDangKy);

        // Lưu vào cơ sở dữ liệu
        try {
            if (saveTuVan(tuVan)) {
                response.getWriter().write("<script type='text/javascript'>alert('Đăng ký tư vấn thành công!'); window.location.href='home';</script>");
            } else {
                response.getWriter().write("<script type='text/javascript'>alert('Đã có lỗi xảy ra khi lưu dữ liệu!'); window.location.href='trangchu.jsp';</script>");
            }
        } catch (SQLException | NamingException e) {
            e.printStackTrace();
            response.getWriter().write("<script type='text/javascript'>alert('Lỗi kết nối cơ sở dữ liệu: " + e.getMessage() + "'); window.location.href='trangchu.jsp';</script>");
        }
    }

    private boolean saveTuVan(TuVanDangKy_hko tuVan) throws SQLException, NamingException {
        // Lấy DataSource từ JNDI
        InitialContext ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/HoangKimOanh_2210900053");

        String sql = "INSERT INTO TuVanDangKy_hko (hoTenKhach, soDienThoai, yeuCauTuVan, ngayDangKy) VALUES (?, ?, ?, ?)";

        try (Connection connection = ds.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, tuVan.getHoTenKhach());
            ps.setString(2, tuVan.getSoDienThoai());
            ps.setString(3, tuVan.getYeuCauTuVan());
            ps.setString(4, tuVan.getNgayDangKy());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;  // Trả về true nếu ít nhất 1 dòng bị ảnh hưởng
        }
    }
}
