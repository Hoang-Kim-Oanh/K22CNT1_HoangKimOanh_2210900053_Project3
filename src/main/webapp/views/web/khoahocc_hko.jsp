<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Khóa Học IELTS Arena</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<!-- Nhúng header chung -->
<jsp:include page="header.jsp" />

<section class="py-5">
    <div class="container">
        <div class="text-center mb-4">
            <h1 class="text-danger">Khóa học tại IELTS Arena</h1>
            <p class="lead">Luyện thi đạt nguyện vọng với thiết kế bài bản, cam kết đầu ra từ 4.5 đến 7.0+.</p>
        </div>

        <div class="row g-4">
            <c:forEach var="khoaHoc" items="${danhSachKhoaHoc}">
                <div class="col-12 col-md-4">
                    <div class="card h-100 border shadow-sm">
                        <div class="card-body text-center p-3">
                            <h4 class="card-title">${khoaHoc.tenKhoaHoc}</h4>
                            <p class="card-text">Mô tả: ${khoaHoc.moTa}</p>
                            <p class="card-text">Trình độ: ${khoaHoc.trinhDo}</p>
                            <p class="card-text">Học phí: ${khoaHoc.hocPhi} VNĐ</p>
                            <p class="card-text">Thời gian học: ${khoaHoc.thoiGianHoc}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <c:if test="${empty danhSachKhoaHoc}">
                <div class="col-12 text-center">
                    <p class="text-danger">Không có khóa học nào trong hệ thống.</p>
                </div>
            </c:if>
        </div>
    </div>
</section>

<!-- Nhúng footer chung -->
<jsp:include page="footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
