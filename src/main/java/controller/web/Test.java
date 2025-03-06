package controller.web;

import model.GiangVien_hko;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.naming.InitialContext;
import javax.sql.DataSource;

// Annotation để ánh xạ URL
@WebServlet("/giangvien")
public class Test extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        List<GiangVien_hko> danhSachGiangVien = new ArrayList<>();

        try {
            // Kết nối cơ sở dữ liệu
            InitialContext ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/HoangKimOanh_2210900053");
            Connection conn = ds.getConnection();

            // Truy vấn danh sách giảng viên
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

            // Đưa danh sách vào request
            request.setAttribute("danhSachGiangVien", danhSachGiangVien);
            request.getRequestDispatcher("/views/test.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Lỗi khi lấy danh sách giảng viên", e);
        }
    }


}