package controller.admin;

import model.GiangVien_hko;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/admin/teachers")
public class GiangVien_hkoController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        try {
            InitialContext ctx = new InitialContext();
            dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/HoangKimOanh_2210900053");
        } catch (NamingException e) {
            throw new ServletException("Cannot initialize DataSource", e);
        }
    }

    protected Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            int maGiangVien = Integer.parseInt(request.getParameter("maGiangVien"));
            deleteGiangVien(maGiangVien);
            response.sendRedirect(request.getContextPath() + "/admin/teachers");
        } else if ("edit".equals(action)) {
            int maGiangVien = Integer.parseInt(request.getParameter("maGiangVien"));
            GiangVien_hko gv = selectGiangVienByMa(maGiangVien);
            request.setAttribute("giangVien", gv);
            request.getRequestDispatcher("/views/admin/hko_editTeacher.jsp").forward(request, response);
        } else {
            List<GiangVien_hko> danhSachGiangVien = selectAllGiangVien();
            request.setAttribute("danhSachGiangVien", danhSachGiangVien);
            request.getRequestDispatcher("/views/admin/hko_quanlygiangvien.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            int maGiangVien = Integer.parseInt(request.getParameter("maGiangVien"));
            String tenGiangVien = request.getParameter("tenGiangVien");
            String email = request.getParameter("email");
            String soDienThoai = request.getParameter("soDienThoai");
            String chuyenMon = request.getParameter("chuyenMon");

            insertGiangVien(new GiangVien_hko(maGiangVien, tenGiangVien, email, soDienThoai, chuyenMon));
            response.sendRedirect(request.getContextPath() + "/admin/teachers");
        } else if ("edit".equals(action)) {
            int maGiangVien = Integer.parseInt(request.getParameter("maGiangVien"));
            String tenGiangVien = request.getParameter("tenGiangVien");
            String email = request.getParameter("email");
            String soDienThoai = request.getParameter("soDienThoai");
            String chuyenMon = request.getParameter("chuyenMon");

            updateGiangVien(maGiangVien, tenGiangVien, email, soDienThoai, chuyenMon);
            response.sendRedirect(request.getContextPath() + "/admin/teachers");
        }
    }

    private List<GiangVien_hko> selectAllGiangVien() {
        List<GiangVien_hko> giangVienList = new ArrayList<>();
        String SELECT_ALL_SQL = "SELECT * FROM giangvien_hko";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SQL);
             ResultSet rs = preparedStatement.executeQuery()) {
            while (rs.next()) {
                GiangVien_hko gv = new GiangVien_hko(
                        rs.getInt("maGiangVien"),
                        rs.getString("tenGiangVien"),
                        rs.getString("email"),
                        rs.getString("soDienThoai"),
                        rs.getString("chuyenMon")
                );
                giangVienList.add(gv);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return giangVienList;
    }

    private GiangVien_hko selectGiangVienByMa(int maGiangVien) {
        String SELECT_SQL = "SELECT * FROM giangvien_hko WHERE maGiangVien = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_SQL)) {
            preparedStatement.setInt(1, maGiangVien);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return new GiangVien_hko(
                        rs.getInt("maGiangVien"),
                        rs.getString("tenGiangVien"),
                        rs.getString("email"),
                        rs.getString("soDienThoai"),
                        rs.getString("chuyenMon")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private void insertGiangVien(GiangVien_hko gv) {
        String INSERT_SQL = "INSERT INTO giangvien_hko (maGiangVien, tenGiangVien, email, soDienThoai, chuyenMon) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SQL)) {
            preparedStatement.setInt(1, gv.getMaGiangVien());
            preparedStatement.setString(2, gv.getTenGiangVien());
            preparedStatement.setString(3, gv.getEmail());
            preparedStatement.setString(4, gv.getSoDienThoai());
            preparedStatement.setString(5, gv.getChuyenMon());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void updateGiangVien(int maGiangVien, String tenGiangVien, String email, String soDienThoai, String chuyenMon) {
        String UPDATE_SQL = "UPDATE giangvien_hko SET tenGiangVien = ?, email = ?, soDienThoai = ?, chuyenMon = ? WHERE maGiangVien = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_SQL)) {
            preparedStatement.setString(1, tenGiangVien);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, soDienThoai);
            preparedStatement.setString(4, chuyenMon);
            preparedStatement.setInt(5, maGiangVien);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void deleteGiangVien(int maGiangVien) {
        String DELETE_SQL = "DELETE FROM giangvien_hko WHERE maGiangVien = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_SQL)) {
            preparedStatement.setInt(1, maGiangVien);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}