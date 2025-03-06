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
            <h1 class="text-danger">Khóa học tại IELTS Arena - Đảm bảo đưa ra bảng vàng</h1>
            <p class="lead">Luyện thi đạt nguyện vọng với thiết kế sáng, sán sàng chinh phục AimIELTS, đạt điểm số từ 4.5 đến 7.0+ trong thời gian ngắn nhất. Chương trình học được thiết kế bài bản, bài test đánh giá đầu vào và cuối khóa, đảm bảo kết quả học tập tốt nhất.</p>
        </div>

        <div class="row g-4">
            <c:forEach var="khoaHoc" items="${danhSachKhoaHoc}">
                <div class="col-12 col-md-4">
                    <div class="card h-100 border shadow-sm">
                        <div class="card-body text-center p-3">
                            <h4 class="card-title">${khoaHoc.tenKhoaHoc} <br><small>(${khoaHoc.trinhDo})</small></h4>
                            <p class="card-text">Mô tả: ${khoaHoc.moTa}</p>
                            <p class="card-text">Trình độ: ${khoaHoc.trinhDo}</p>
                            <p class="card-text">Học phí: ${khoaHoc.hocPhi} VNĐ</p>
                            <p class="card-text">Thời gian học: ${khoaHoc.thoiGianHoc}</p>
                            <button class="btn btn-danger mt-3" data-bs-toggle="modal" data-bs-target="#registrationModal">Khóa học</button>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <!-- Nếu danh sách rỗng -->
            <c:if test="${empty danhSachKhoaHoc}">
                <div class="col-12 text-center">
                    <p class="text-danger">Không có khóa học nào trong hệ thống.</p>
                </div>
            </c:if>
        </div>

        <div class="card border shadow-sm mt-4 p-4">
            <h3 class="card-title">Khóa học</h3>
            <ul class="list-unstyled">
                <li class="mb-2"><span class="text-success">▶</span> Đánh cho bạn căn cứ để bạn tự tin học.</li>
                <li class="mb-2"><span class="text-success">▶</span> Cốc bạn sờ ra đường, căn bản IELTS để đạt tuyền Đai học.</li>
                <li><span class="text-success">▶</span> Ngắn chuỗi để bạn tự hào thi đậu đai IELTS nhận thưởng.</li>
            </ul>

            <h3 class="card-title mt-4">Mục tiêu ra</h3>
            <ul class="list-unstyled">
                <li class="mb-2"><span class="text-success">▶</span> Tăng ít nhất 0.5 Overall IELTS trong thời gian ngắn.</li>
                <li class="mb-2"><span class="text-success">▶</span> Tập trung vào các chiến lược luyện thi cấp tốc, tư vấn chuyên sâu.</li>
                <li><span class="text-success">▶</span> Hỗ trợ nâng ngạch lên cao hơn trong thời gian ngắn.</li>
            </ul>
        </div>
    </div>
</section>

<!-- Nhúng modal đăng ký từ Dangkyweb_hko.jsp -->
<jsp:include page="Dangkyweb_hko.jsp" />

<!-- Nhúng footer chung -->
<jsp:include page="footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>