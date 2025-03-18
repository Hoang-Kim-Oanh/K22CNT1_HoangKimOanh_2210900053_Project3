package controller.admin;

import model.DangKy_hko;
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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/dangkytaikhoan")
public class DangKy_hkoController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            deleteDangKy(request, response);
        } else {
            getAllDangKy(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if ("add".equals(action)) {
            addDangKy(request, response);
        } else if ("update".equals(action)) {
            updateDangKy(request, response);
        }
    }

    private void getAllDangKy(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<DangKy_hko> danhSachDangKy = new ArrayList<>();
        String sql = "SELECT * FROM dangky_hko";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                try {
                    DangKy_hko dangKy = new DangKy_hko();
                    dangKy.setMaKhachDangKy(rs.getInt("MAKHACHDANGKY"));
                    dangKy.setHoTen(rs.getString("HOTEN"));
                    dangKy.setSoDienThoai(rs.getString("SODIENTHOAI"));
                    dangKy.setTrangThai(rs.getString("TRANGTHAI"));
                    dangKy.setKhoaHoc(rs.getString("KHOAHOC"));
                    dangKy.setNgayDangKy(rs.getTimestamp("NGAYDANGKY"));
                    danhSachDangKy.add(dangKy);
                } catch (IllegalArgumentException e) {
                    System.err.println("Lỗi khi xử lý bản ghi với MAKHACHDANGKY=" + rs.getInt("MAKHACHDANGKY") + ": " + e.getMessage());
                    // Optionally skip the record or set a default value
                    continue; // Skip the problematic record
                }
            }
            request.setAttribute("danhSachDangKy", danhSachDangKy);
            request.getRequestDispatcher("/views/admin/hko_quanlydangky.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi lấy danh sách đăng ký: " + e.getMessage());
            request.getRequestDispatcher("/views/admin/hko_quanlydangky.jsp").forward(request, response);
        }
    }

    private void addDangKy(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            //ket nôi đb
            Connection conn = getConnection();
            String sql = "INSERT INTO dangky_hko (HOTEN, SODIENTHOAI, TRANGTHAI, KHOAHOC, NGAYDANGKY) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, request.getParameter("hoTen"));
            pstmt.setString(2, request.getParameter("soDienThoai"));
            pstmt.setString(3, request.getParameter("trangThai"));
            pstmt.setString(4, request.getParameter("khoaHoc"));
            String ngayDangKyStr = request.getParameter("ngayDangKy");
            if (ngayDangKyStr != null && !ngayDangKyStr.isEmpty()) {
                pstmt.setTimestamp(5, Timestamp.valueOf(ngayDangKyStr.replace("T", " ")));
            } else {
                pstmt.setNull(5, java.sql.Types.TIMESTAMP);
            }

            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            response.sendRedirect("dangkytaikhoan");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi thêm đăng ký: " + e.getMessage());
            getAllDangKy(request, response);
        }
    }

    private void updateDangKy(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection conn = getConnection();
            String sql = "UPDATE dangky_hko SET HOTEN=?, SODIENTHOAI=?, TRANGTHAI=?, KHOAHOC=?, NGAYDANGKY=? WHERE MAKHACHDANGKY=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, request.getParameter("hoTen"));
            pstmt.setString(2, request.getParameter("soDienThoai"));
            pstmt.setString(3, request.getParameter("trangThai"));
            pstmt.setString(4, request.getParameter("khoaHoc"));
            String ngayDangKyStr = request.getParameter("ngayDangKy");
            if (ngayDangKyStr != null && !ngayDangKyStr.isEmpty()) {
                pstmt.setTimestamp(5, Timestamp.valueOf(ngayDangKyStr.replace("T", " ")));
            } else {
                pstmt.setNull(5, java.sql.Types.TIMESTAMP);
            }
            pstmt.setInt(6, Integer.parseInt(request.getParameter("maKhachDangKy")));

            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            response.sendRedirect("dangkytaikhoan");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi cập nhật đăng ký: " + e.getMessage());
            getAllDangKy(request, response);
        }
    }

    private void deleteDangKy(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection conn = getConnection();
            String sql = "DELETE FROM dangky_hko WHERE MAKHACHDANGKY=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(request.getParameter("maKhachDangKy")));

            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            response.sendRedirect("dangkytaikhoan");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi xóa đăng ký: " + e.getMessage());
            getAllDangKy(request, response);
        }
    }

    private Connection getConnection() throws Exception {
        InitialContext ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/HoangKimOanh_2210900053");
        return ds.getConnection();
    }
}