package controller.web;

import model.DangKy_hko;
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

@WebServlet("/submitRegistration")
public class DangKyKhoaHocController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String hoTen = request.getParameter("hoten");
        String soDienThoai = request.getParameter("sodienthoai");
        String banDangLa = request.getParameter("bandangla");
        String mucTieuIELTS = request.getParameter("muctieuIELTS");
        String ngayDangKy = java.time.LocalDate.now().toString();

        // Tạo đối tượng DangKy_hko
        DangKy_hko dangKy = new DangKy_hko();
        dangKy.setHoTen(hoTen);
        dangKy.setSoDienThoai(soDienThoai);
        dangKy.setTrangThai(banDangLa);
        dangKy.setKhoaHoc("Khóa 0 - 7.0 IELTS (" + mucTieuIELTS + ")");
        dangKy.setNgayDangKy(ngayDangKy);

        // Lưu vào database
        try {
            if (saveDangKy(dangKy)) {
                response.getWriter().write("<script type='text/javascript'>alert('Đăng ký khóa học thành công!'); window.location.href='home';</script>");
            } else {
                response.getWriter().write("<script type='text/javascript'>alert('Lỗi khi lưu dữ liệu!'); window.location.href='trangchu.jsp';</script>");
            }
        } catch (SQLException | NamingException e) {
            e.printStackTrace();
            response.getWriter().write("<script type='text/javascript'>alert('Lỗi kết nối cơ sở dữ liệu: " + e.getMessage() + "'); window.location.href='trangchu.jsp';</script>");
        }
    }

    private boolean saveDangKy(DangKy_hko dangKy) throws SQLException, NamingException {
        InitialContext ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/HoangKimOanh_2210900053");

        String sql = "INSERT INTO DangKy_hko (hoTen, soDienThoai, trangThai, khoaHoc, ngayDangKy) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = ds.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, dangKy.getHoTen());
            ps.setString(2, dangKy.getSoDienThoai());
            ps.setString(3, dangKy.getTrangThai());
            ps.setString(4, dangKy.getKhoaHoc());
            ps.setString(5, dangKy.getNgayDangKy());

            return ps.executeUpdate() > 0;
        }
    }
}
