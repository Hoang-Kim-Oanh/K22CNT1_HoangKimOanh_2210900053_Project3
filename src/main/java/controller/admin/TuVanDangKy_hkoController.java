package controller.admin;

import model.TuVanDangKy_hko;
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

@WebServlet("/tuvandangky")
public class TuVanDangKy_hkoController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            deleteTuVanDangKy(request, response);
        } else {
            getAllTuVanDangKy(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if ("add".equals(action)) {
            addTuVanDangKy(request, response);
        } else if ("update".equals(action)) {
            updateTuVanDangKy(request, response);
        }
    }

    private void getAllTuVanDangKy(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<TuVanDangKy_hko> danhSachTuVan = new ArrayList<>();
        String sql = "SELECT * FROM tuvandangky_hko";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                TuVanDangKy_hko tuVan = new TuVanDangKy_hko();
                tuVan.setMaKhachVangLai(rs.getInt("MAKHACHVANGLAI"));
                tuVan.setHoTenKhach(rs.getString("HOTENKHACH"));
                tuVan.setSoDienThoai(rs.getString("SODIENTHOAI"));
                tuVan.setYeuCauTuVan(rs.getString("YEUCAUTUVAN"));
                tuVan.setNgayDangKy(rs.getString("NGAYDANGKY"));
                danhSachTuVan.add(tuVan);
            }
            request.setAttribute("danhSachTuVan", danhSachTuVan);
            request.getRequestDispatcher("/views/admin/hko_quanlytuvandangky.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi lấy danh sách tư vấn đăng ký: " + e.getMessage());
            request.getRequestDispatcher("/views/admin/hko_quanlytuvandangky.jsp").forward(request, response);
        }
    }

    private void addTuVanDangKy(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection conn = getConnection();
            String sql = "INSERT INTO tuvandangky_hko (HOTENKHACH, SODIENTHOAI, YEUCAUTUVAN, NGAYDANGKY) VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, request.getParameter("hoTenKhach"));
            pstmt.setString(2, request.getParameter("soDienThoai"));
            pstmt.setString(3, request.getParameter("yeuCauTuVan"));
            String ngayDangKyStr = request.getParameter("ngayDangKy");
            if (ngayDangKyStr != null && !ngayDangKyStr.isEmpty()) {
                pstmt.setString(4, ngayDangKyStr); // Assuming NGAYDANGKY is a VARCHAR/TEXT in DB
            } else {
                pstmt.setNull(4, java.sql.Types.VARCHAR);
            }

            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            response.sendRedirect("tuvandangky");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi thêm tư vấn đăng ký: " + e.getMessage());
            getAllTuVanDangKy(request, response);
        }
    }

    private void updateTuVanDangKy(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection conn = getConnection();
            String sql = "UPDATE tuvandangky_hko SET HOTENKHACH=?, SODIENTHOAI=?, YEUCAUTUVAN=?, NGAYDANGKY=? WHERE MAKHACHVANGLAI=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, request.getParameter("hoTenKhach"));
            pstmt.setString(2, request.getParameter("soDienThoai"));
            pstmt.setString(3, request.getParameter("yeuCauTuVan"));
            String ngayDangKyStr = request.getParameter("ngayDangKy");
            if (ngayDangKyStr != null && !ngayDangKyStr.isEmpty()) {
                pstmt.setString(4, ngayDangKyStr);
            } else {
                pstmt.setNull(4, java.sql.Types.VARCHAR);
            }
            pstmt.setInt(5, Integer.parseInt(request.getParameter("maKhachVangLai")));

            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            response.sendRedirect("tuvandangky");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi cập nhật tư vấn đăng ký: " + e.getMessage());
            getAllTuVanDangKy(request, response);
        }
    }

    private void deleteTuVanDangKy(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection conn = getConnection();
            String sql = "DELETE FROM tuvandangky_hko WHERE MAKHACHVANGLAI=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(request.getParameter("maKhachVangLai")));

            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            response.sendRedirect("tuvandangky");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi xóa tư vấn đăng ký: " + e.getMessage());
            getAllTuVanDangKy(request, response);
        }
    }

    private Connection getConnection() throws Exception {
        InitialContext ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/HoangKimOanh_2210900053");
        return ds.getConnection();
    }
}