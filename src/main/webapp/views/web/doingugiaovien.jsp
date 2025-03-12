<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Giáo Viên</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<!-- Nhúng header chung -->
<jsp:include page="header.jsp" />

<section class="py-5">
    <div class="container">
        <div class="row g-4 justify-content-center">
            <c:forEach var="giangVien" items="${danhSachGiangVien}">
                <div class="col-12 col-md-6 col-lg-3">
                    <div class="card border-light shadow-sm" style="max-width: 300px; margin: 0 auto; background-color: white; border-radius: 15px; padding: 20px;">
                        <!-- Hình ảnh giáo viên -->
                        <img src="${pageContext.request.contextPath}/images/doingugiangvien1.png" class="img-fluid mb-3" alt="${giangVien.tenGiangVien}" style="max-width: 150px; border-radius: 5px; display: block; margin-left: auto; margin-right: auto;">

                        <!-- Thông tin giáo viên -->
                        <div class="mb-2" style="color: #333;">
                            <strong>Tên:</strong> ${giangVien.tenGiangVien}
                        </div>
                        <div class="mb-2" style="color: #333;">
                            <strong>Email:</strong> ${giangVien.email}
                        </div>
                        <div style="color: #333;">
                            <strong>Chuyên môn:</strong> ${giangVien.chuyenMon}
                        </div>
                    </div>
                </div>
            </c:forEach>
            <!-- Nếu danh sách rỗng -->
            <c:if test="${empty danhSachGiangVien}">
                <div class="col-12 text-center">
                    <p class="text-danger">Không có giáo viên nào trong hệ thống.</p>
                </div>
            </c:if>
        </div>
    </div>
</section>

<!-- Nhúng footer chung -->
<jsp:include page="footer.jsp" />

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
