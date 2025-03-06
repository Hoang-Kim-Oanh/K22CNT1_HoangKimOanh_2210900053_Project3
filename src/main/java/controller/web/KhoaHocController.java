package controller.web;

import model.KhoaHoc_hko; // Import model
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

@WebServlet("/khoahoc")
public class KhoaHocController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        List<KhoaHoc_hko> danhSachKhoaHoc = new ArrayList<>();

        try {
            // Kết nối cơ sở dữ liệu
            InitialContext ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/HoangKimOanh_2210900053");
            Connection conn = ds.getConnection();

            // Truy vấn danh sách khóa học
            String sql = "SELECT * FROM KhoaHoc_hko";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                KhoaHoc_hko khoaHoc = new KhoaHoc_hko();
                khoaHoc.setMaKhoaHoc(rs.getInt("MaKhoaHoc"));
                khoaHoc.setTenKhoaHoc(rs.getString("TenKhoaHoc"));
                khoaHoc.setMoTa(rs.getString("MoTa"));
                khoaHoc.setTrinhDo(rs.getString("TrinhDo"));
                khoaHoc.setHocPhi(rs.getDouble("HocPhi"));
                khoaHoc.setThoiGianHoc(rs.getString("ThoiGianHoc"));
                danhSachKhoaHoc.add(khoaHoc);
            }

            rs.close();
            pstmt.close();
            conn.close();

            // Đưa danh sách vào request
            request.setAttribute("danhSachKhoaHoc", danhSachKhoaHoc);
            request.getRequestDispatcher("/views/web/khoahocc_hko.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Lỗi khi lấy danh sách khóa học", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}