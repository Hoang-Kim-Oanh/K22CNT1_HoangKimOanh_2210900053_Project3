<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Giảng Viên - IELTS Arena</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<!-- Nhúng header -->

<section class="py-5">
    <div class="container">
        <h2 class="text-center mb-4">Danh Sách Giảng Viên</h2>
        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger" role="alert">
            <%= request.getAttribute("error") %>
        </div>
        <% } %>
        <table class="table table-striped table-hover">
            <thead class="table-dark">
            <tr>
                <th>Mã Giảng Viên</th>
                <th>Tên Giảng Viên</th>
                <th>Email</th>
                <th>Số Điện Thoại</th>
                <th>Chuyên Môn</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="giangVien" items="${danhSachGiangVien}">
                <tr>
                    <td>${giangVien.maGiangVien}</td>
                    <td>${giangVien.tenGiangVien}</td>
                    <td>${giangVien.email}</td>
                    <td>${giangVien.soDienThoai}</td>
                    <td>${giangVien.chuyenMon}</td>
                </tr>
            </c:forEach>
            <!-- Nếu danh sách rỗng -->
            <c:if test="${empty danhSachGiangVien}">
                <tr>
                    <td colspan="5" class="text-center">Không có giảng viên nào trong hệ thống.</td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>
</section>

<!-- Nhúng footer -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>