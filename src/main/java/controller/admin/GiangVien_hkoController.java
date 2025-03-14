package controller.admin;

import model.GiangVien_hko;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/giangvien")
public class GiangVien_hkoController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            deleteGiangVien(request, response);
        } else {
            getAllGiangVien(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if ("add".equals(action)) {
            addGiangVien(request, response);
        } else if ("update".equals(action)) {
            updateGiangVien(request, response);
        }
    }

    private void getAllGiangVien(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<GiangVien_hko> danhSachGiangVien = new ArrayList<>();
        try {
            Connection conn = getConnection();
            String sql = "SELECT * FROM GiangVien_hko";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                GiangVien_hko giangVien = new GiangVien_hko();
                giangVien.setMaGiangVien(rs.getInt("MaGiangVien"));
                giangVien.setTenGiangVien(rs.getString("TenGiangVien"));
                giangVien.setEmail(rs.getString("Email"));
                giangVien.setSoDienThoai(rs.getString("SoDienThoai"));
                giangVien.setChuyenMon(rs.getString("ChuyenMon"));
                danhSachGiangVien.add(giangVien);
            }

            rs.close();
            pstmt.close();
            conn.close();

            request.setAttribute("danhSachGiangVien", danhSachGiangVien);
            request.getRequestDispatcher("/views/admin/hko_quanlygiangvien.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Lỗi khi lấy danh sách giảng viên", e);
        }
    }

    private void addGiangVien(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection conn = getConnection();
            String sql = "INSERT INTO GiangVien_hko (TenGiangVien, Email, SoDienThoai, ChuyenMon) VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, request.getParameter("tenGiangVien"));
            pstmt.setString(2, request.getParameter("email"));
            pstmt.setString(3, request.getParameter("soDienThoai"));
            pstmt.setString(4, request.getParameter("chuyenMon"));

            pstmt.executeUpdate();
            pstmt.close();
            conn.close();

            response.sendRedirect("giangvien");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi thêm giảng viên.");
            getAllGiangVien(request, response);
        }
    }

    private void updateGiangVien(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection conn = getConnection();
            String sql = "UPDATE GiangVien_hko SET TenGiangVien=?, Email=?, SoDienThoai=?, ChuyenMon=? WHERE MaGiangVien=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, request.getParameter("tenGiangVien"));
            pstmt.setString(2, request.getParameter("email"));
            pstmt.setString(3, request.getParameter("soDienThoai"));
            pstmt.setString(4, request.getParameter("chuyenMon"));
            pstmt.setInt(5, Integer.parseInt(request.getParameter("maGiangVien")));

            pstmt.executeUpdate();
            pstmt.close();
            conn.close();

            response.sendRedirect("giangvien");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi cập nhật giảng viên.");
            getAllGiangVien(request, response);
        }
    }

    private void deleteGiangVien(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection conn = getConnection();
            String sql = "DELETE FROM GiangVien_hko WHERE MaGiangVien=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(request.getParameter("maGiangVien")));

            pstmt.executeUpdate();
            pstmt.close();
            conn.close();

            response.sendRedirect("giangvien");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi xóa giảng viên.");
            getAllGiangVien(request, response);
        }
    }

    private Connection getConnection() throws Exception {
        InitialContext ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/HoangKimOanh_2210900053");
        return ds.getConnection();
    }
}
