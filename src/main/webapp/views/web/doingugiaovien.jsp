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

<section class="position-relative">
    <div class="w-100">
        <div class="w-100">
            <div class="w-100">
                <img src="${pageContext.request.contextPath}/images/anhbiacuagiangvien1.png" class="d-block w-100" alt="Giáo viên" style="height: auto; object-fit: contain; width: 100vw;">
            </div>
        </div>
    </div>
</section>

<section class="py-5">
    <div class="container">
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <!-- Cột 1: Chuyên môn giỏi -->
            <div class="col">
                <div class="card h-100 border-0 shadow-sm rounded-3">
                    <div class="card-body text-center p-3">
                        <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="currentColor" class="bi bi-file-earmark-text-fill text-danger mb-3" viewBox="0 0 16 16">
                            <path d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0M9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1M4.5 9a.5.5 0 0 1 0-1h7a.5.5 0 0 1 0 1zM4 10.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5m.5 2.5a.5.5 0 0 1 0-1h4a.5.5 0 0 1 0 1z"/>
                        </svg>
                        <h2 class="card-title fw-bold mb-2">CHUYÊN MÔN GIỎI</h2>
                    </div>
                    <div class="card p-3 rounded-bottom bg-white border-top-0">
                        <p class="card-text mb-0">Đội ngũ giáo viên chuyên môn giỏi, xuất thân từ các trường học uy tín hàng đầu quốc tế hoặc trường ngoại ngữ có tiếng tại Việt Nam, đồng thời sở hữu chứng chỉ IELTS/TESOL với phương pháp và kỹ năng giảng dạy chuyên sâu.</p>
                    </div>
                </div>
            </div>

            <!-- Cột 2: Nhiệt tình -->
            <div class="col">
                <div class="card h-100 border-0 shadow-sm rounded-3">
                    <div class="card-body text-center p-3">
                        <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="currentColor" class="bi bi-people-fill text-danger mb-3" viewBox="0 0 16 16">
                            <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6m-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216zM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z"/>
                        </svg>
                        <h2 class="card-title fw-bold mb-2">NHỊET TÌNH</h2>
                    </div>
                    <div class="card p-3 rounded-bottom bg-white border-top-0">
                        <p class="card-text mb-0">Đội ngũ IELTS Fighter luôn sẵn lòng hỗ trợ học viên 24/7 với thái độ tích cực, tận tâm và nhiệt huyết. Giáo viên luôn sẵn sàng giải đáp mọi thắc mắc.</p>
                    </div>
                </div>
            </div>

            <!-- Cột 3: Sáng tạo -->
            <div class="col">
                <div class="card h-100 border-0 shadow-sm rounded-3">
                    <div class="card-body text-center p-3">
                        <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="currentColor" class="bi bi-lightbulb-fill text-danger mb-3" viewBox="0 0 16 16">
                            <path d="M2 6a6 6 0 1 1 10.174 4.31c-.203.196-.359.4-.578.617l-1.2 1.2a2.002 2.002 0 0 1-2.83 0l-1.2-1.2A1.998 1.998 0 0 1 4.174 6.5 6 6 0 0 1 2 6m1 5.5v1a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1v-1a4 4 0 0 0-4-4 4 4 0 0 0-4 4"/>
                        </svg>
                        <h2 class="card-title fw-bold mb-2">SÁNG TẠO</h2>
                    </div>
                    <div class="card p-3 rounded-bottom bg-white border-top-0">
                        <p class="card-text mb-0">Giáo viên IELTS Fighter luôn chủ động tìm kiếm những phương pháp giảng dạy mới, sáng kiến đổi mới để phù hợp với từng học viên.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="py-5">
    <div class="container">
        <div class="row g-4 justify-content-center">
            <c:forEach var="giangVien" items="${danhSachGiangVien}">
                <div class="col-12 col-md-6 col-lg-3">
                    <div class="card border-light shadow-sm" style="max-width: 300px; margin: 0 auto; background-color: white; border-radius: 15px; padding: 20px;">
                        <!-- Hình ảnh giáo viên (dùng ảnh mặc định, bạn có thể thay bằng ảnh động sau) -->
                        <img src="${pageContext.request.contextPath}/images/doingugiangvien1.png" class="img-fluid mb-3" alt="${giangVien.tenGiangVien}" style="max-width: 150px; border-radius: 5px; display: block; margin-left: auto; margin-right: auto;">

                        <!-- Thông tin giáo viên (text với dấu chấm) -->
                        <div class="mb-2" style="position: relative; padding-left: 20px; color: #333;">
                            <span style="position: absolute; left: 0; color: #dc3545; font-size: 1.2rem;">•</span>
                            <c:set var="tenChucVu" value="${giangVien.chuyenMon.contains('8.5') ? 'Trưởng phòng đào tạo vận hành, cố vấn học thuật cấp cao' : 'Giáo viên'}"/>
                                ${tenChucVu} IELTS Fighter khu vực HCM
                        </div>
                        <div class="mb-2" style="position: relative; padding-left: 20px; color: #333;">
                            <span style="position: absolute; left: 0; color: #dc3545; font-size: 1.2rem;">•</span>
                                ${giangVien.chuyenMon}
                        </div>
                        <div class="mb-2" style="position: relative; padding-left: 20px; color: #333;">
                            <span style="position: absolute; left: 0; color: #dc3545; font-size: 1.2rem;">•</span>
                            11 năm kinh nghiệm dạy tiếng Anh
                        </div>
                        <div style="position: relative; padding-left: 20px; color: #333;">
                            <span style="position: absolute; left: 0; color: #dc3545; font-size: 1.2rem;">•</span>
                            5 năm kinh nghiệm giảng dạy, luyện thi IELTS
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