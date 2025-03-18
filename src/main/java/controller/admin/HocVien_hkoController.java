package controller.admin;

import model.HocVien_hko;
import model.HocVien_hko.GioiTinh;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/hocvien")
public class HocVien_hkoController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            deleteHocVien(request, response);
        } else {
            getAllHocVien(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if ("add".equals(action)) {
            addHocVien(request, response);
        } else if ("update".equals(action)) {
            updateHocVien(request, response);
        }
    }

    private void getAllHocVien(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<HocVien_hko> danhSachHocVien = new ArrayList<>();
        String sql = "SELECT * FROM HocVien_hko";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                HocVien_hko hocVien = new HocVien_hko();
                hocVien.setMaHocVien(rs.getInt("MaHocVien"));
                hocVien.setTenHocVien(rs.getString("TenHocVien"));
                hocVien.setNgaySinh(rs.getDate("NgaySinh"));
                hocVien.setGioiTinh(GioiTinh.valueOf(rs.getString("GioiTinh")));
                hocVien.setDiaChi(rs.getString("DiaChi"));
                hocVien.setEmail(rs.getString("Email"));
                hocVien.setLichHoc(rs.getString("LichHoc"));
                hocVien.setDiemSo(rs.getBigDecimal("DiemSo"));
                hocVien.setMatKhau(rs.getString("MatKhau"));
                hocVien.setMaKhoaHoc(rs.getInt("MaKhoaHoc"));
                danhSachHocVien.add(hocVien);
            }
            request.setAttribute("danhSachHocVien", danhSachHocVien);
            request.getRequestDispatcher("/views/admin/hko_quanlyhocvien.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Lỗi khi lấy danh sách học viên", e);
        }
    }

    private void addHocVien(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection conn = getConnection();
            String sql = "INSERT INTO HocVien_hko (TenHocVien, NgaySinh, GioiTinh, DiaChi, Email, LichHoc, DiemSo, MatKhau, MaKhoaHoc) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, request.getParameter("tenHocVien"));
            pstmt.setDate(2, Date.valueOf(request.getParameter("ngaySinh")));
            pstmt.setString(3, request.getParameter("gioiTinh"));
            pstmt.setString(4, request.getParameter("diaChi"));
            pstmt.setString(5, request.getParameter("email"));
            pstmt.setString(6, request.getParameter("lichHoc"));
            pstmt.setBigDecimal(7, new BigDecimal(request.getParameter("diemSo")));
            pstmt.setString(8, request.getParameter("matKhau"));
            pstmt.setInt(9, Integer.parseInt(request.getParameter("maKhoaHoc")));

            pstmt.executeUpdate();
            conn.close();
            response.sendRedirect("hocvien");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi thêm học viên: " + e.getMessage());
            getAllHocVien(request, response);
        }
    }

    private void updateHocVien(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection conn = getConnection();
            String sql = "UPDATE HocVien_hko SET TenHocVien=?, NgaySinh=?, GioiTinh=?, DiaChi=?, Email=?, LichHoc=?, DiemSo=?, MatKhau=?, MaKhoaHoc=? WHERE MaHocVien=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, request.getParameter("tenHocVien"));
            pstmt.setDate(2, Date.valueOf(request.getParameter("ngaySinh")));
            pstmt.setString(3, request.getParameter("gioiTinh"));
            pstmt.setString(4, request.getParameter("diaChi"));
            pstmt.setString(5, request.getParameter("email"));
            pstmt.setString(6, request.getParameter("lichHoc"));
            pstmt.setBigDecimal(7, new BigDecimal(request.getParameter("diemSo")));
            pstmt.setString(8, request.getParameter("matKhau"));
            pstmt.setInt(9, Integer.parseInt(request.getParameter("maKhoaHoc")));
            pstmt.setInt(10, Integer.parseInt(request.getParameter("maHocVien")));

            pstmt.executeUpdate();
            conn.close();
            response.sendRedirect("hocvien");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi cập nhật học viên: " + e.getMessage());
            getAllHocVien(request, response);
        }
    }

    private void deleteHocVien(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection conn = getConnection();
            String sql = "DELETE FROM HocVien_hko WHERE MaHocVien=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(request.getParameter("maHocVien")));

            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            response.sendRedirect("hocvien");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi xóa học viên: " + e.getMessage());
            getAllHocVien(request, response);
        }
    }

    private Connection getConnection() throws Exception {
        InitialContext ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/HoangKimOanh_2210900053");
        return ds.getConnection();
    }
}