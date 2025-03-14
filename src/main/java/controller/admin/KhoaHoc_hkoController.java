package controller.admin;

import model.KhoaHoc_hko;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/qlykhoahoc")
public class KhoaHoc_hkoController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            deleteKhoaHoc(request, response);
        } else {
            getAllKhoaHoc(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if ("add".equals(action)) {
            addKhoaHoc(request, response);
        } else if ("update".equals(action)) {
            updateKhoaHoc(request, response);
        }
    }

    private void getAllKhoaHoc(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<KhoaHoc_hko> danhSachKhoaHoc = new ArrayList<>();
        String sql = "SELECT * FROM khoahoc_hko";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                try {
                    KhoaHoc_hko khoaHoc = new KhoaHoc_hko();
                    khoaHoc.setMaKhoaHoc(rs.getInt("MAKHOAHOC"));
                    khoaHoc.setTenKhoaHoc(rs.getString("TENKHOAHOC"));
                    khoaHoc.setMoTa(rs.getString("MOTA"));
                    khoaHoc.setTrinhDo(rs.getString("TRINHDO"));
                    khoaHoc.setHocPhi(rs.getBigDecimal("HOCPHI"));
                    khoaHoc.setThoiGianHoc(rs.getString("THOIGIANHOC"));
                    danhSachKhoaHoc.add(khoaHoc);
                } catch (IllegalArgumentException e) {
                    System.err.println("Lỗi khi xử lý bản ghi với MAKHOAHOC=" + rs.getInt("MAKHOAHOC") + ": " + e.getMessage());
                    continue; // Skip the problematic record
                }
            }
            request.setAttribute("danhSachKhoaHoc", danhSachKhoaHoc);
            request.getRequestDispatcher("/views/admin/hko_quanlykhoahoc.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi lấy danh sách khóa học: " + e.getMessage());
            request.getRequestDispatcher("/views/admin/hko_quanlykhoahoc.jsp").forward(request, response);
        }
    }

    private void addKhoaHoc(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection conn = getConnection();
            String sql = "INSERT INTO khoahoc_hko (TENKHOAHOC, MOTA, TRINHDO, HOCPHI, THOIGIANHOC) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, request.getParameter("tenKhoaHoc"));
            pstmt.setString(2, request.getParameter("moTa"));
            pstmt.setString(3, request.getParameter("trinhDo"));
            String hocPhiStr = request.getParameter("hocPhi");
            if (hocPhiStr != null && !hocPhiStr.isEmpty()) {
                pstmt.setBigDecimal(4, new BigDecimal(hocPhiStr));
            } else {
                pstmt.setNull(4, java.sql.Types.DECIMAL);
            }
            pstmt.setString(5, request.getParameter("thoiGianHoc"));

            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            response.sendRedirect("qlykhoahoc");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi thêm khóa học: " + e.getMessage());
            getAllKhoaHoc(request, response);
        }
    }

    private void updateKhoaHoc(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection conn = getConnection();
            String sql = "UPDATE khoahoc_hko SET TENKHOAHOC=?, MOTA=?, TRINHDO=?, HOCPHI=?, THOIGIANHOC=? WHERE MAKHOAHOC=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, request.getParameter("tenKhoaHoc"));
            pstmt.setString(2, request.getParameter("moTa"));
            pstmt.setString(3, request.getParameter("trinhDo"));
            String hocPhiStr = request.getParameter("hocPhi");
            if (hocPhiStr != null && !hocPhiStr.isEmpty()) {
                pstmt.setBigDecimal(4, new BigDecimal(hocPhiStr));
            } else {
                pstmt.setNull(4, java.sql.Types.DECIMAL);
            }
            pstmt.setString(5, request.getParameter("thoiGianHoc"));
            pstmt.setInt(6, Integer.parseInt(request.getParameter("maKhoaHoc")));

            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            response.sendRedirect("qlykhoahoc");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi cập nhật khóa học: " + e.getMessage());
            getAllKhoaHoc(request, response);
        }
    }

    private void deleteKhoaHoc(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection conn = getConnection();
            String sql = "DELETE FROM khoahoc_hko WHERE MAKHOAHOC=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(request.getParameter("maKhoaHoc")));

            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            response.sendRedirect("qlykhoahoc");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi xóa khóa học: " + e.getMessage());
            getAllKhoaHoc(request, response);
        }
    }

    private Connection getConnection() throws Exception {
        InitialContext ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/HoangKimOanh_2210900053");
        return ds.getConnection();
    }
}