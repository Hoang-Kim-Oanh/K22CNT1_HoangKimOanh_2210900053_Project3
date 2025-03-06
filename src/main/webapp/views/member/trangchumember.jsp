<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Trung tâm Đào tạo Tiếng Anh</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>

<!-- Hero Section với Carousel cao hơn -->
<section class="py-0 bg-light" style="margin-top: -1px;">
    <div class="container-fluid p-0">
        <div id="heroCarousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="${pageContext.request.contextPath}/images/anhwweb1.jpg" class="d-block w-100" alt="Trung tâm Tiếng Anh" style="height: 80vh; object-fit: cover;">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
</section>

<!-- Tiêu đề lớn bên dưới carousel -->
<section class="py-4 bg-light">
    <div class="container text-center">
        <h1 class="text-dark">TẠI SAO NÊN HỌC IELTS TẠI ORIOLD?</h1>
    </div>
    <br>
    <div class="container text-center">
        <h5 class="text-dark">Bạn đang muốn tìm một nơi học IELTS chất lượng, không nhàm chán với giá cả phải chăng?</h5>
    </div>
    <br>
    <div class="container text-center">
        <h5 class="text-dark fw-bold">Các khóa học IELTS tại ORIOLD sẽ giúp bạn.</h5>
    </div>
</section>
<section class="py-4 bg-light">
    <div class="container">
        <div id="featureCarousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="row row-cols-1 row-cols-md-3 g-5"> <!-- Giữ khoảng cách 1.5cm (30px) với g-5 -->
                        <!-- Card 1: Đội ngũ giảng viên -->
                        <div class="col">
                            <div class="card h-100 border-0 shadow-sm">
                                <div class="card-body text-center text-dark">
                                    <h5 class="card-title fw-bold">Đội ngũ giảng viên</h5>
                                    <p class="card-text">Đội ngũ với 8.0+ luôn sẵn sàng, ngày ngày trau dồi, phát huy.</p>
                                </div>
                                <img src="${pageContext.request.contextPath}/images/doingugiangvienweb2.1.jpg" class="card-img-bottom" alt="Đội ngũ giảng viên" style="object-fit: cover; height: 100%; width: 100%;">
                            </div>
                        </div>
                        <!-- Card 2: Nhiều hoạt động thú vị -->
                        <div class="col">
                            <div class="card h-100 border-0 shadow-sm">
                                <div class="card-body text-center text-dark">
                                    <h5 class="card-title fw-bold">Nhiều hoạt động thú vị</h5>
                                    <p class="card-text">Teamwork, outdoor, groupmind, chương trình “năng khiếu”.</p>
                                </div>
                                <img src="${pageContext.request.contextPath}/images/nhieuhoatdongthuviweb2.2.png" class="card-img-bottom" alt="Nhiều hoạt động thú vị" style="object-fit: cover; height: 100%; width: 100%;">
                            </div>
                        </div>
                        <!-- Card 3: Pattiness & Element of SUCCESS -->
                        <div class="col">
                            <div class="card h-100 border-0 shadow-sm">
                                <div class="card-body text-center text-dark">
                                    <h5 class="card-title fw-bold">Pattiness & Element of SUCCESS</h5>
                                    <p class="card-text"></p> <!-- Không có mô tả, để trống -->
                                </div>
                                <img src="${pageContext.request.contextPath}/images/anhweb.2.33.png" class="card-img-bottom" alt="Pattiness & Element of SUCCESS" style="object-fit: cover; height: 100%; width: 100%;">
                            </div>
                        </div>
                        <!-- Card 4: Online/Offline -->
                        <div class="col">
                            <div class="card h-100 border-0 shadow-sm bg-primary">
                                <div class="card-body text-center text-white">
                                    <h5 class="card-title fw-bold">Online/Offline</h5>
                                    <p class="card-text">Học offline trực tiếp tại trung tâm, học online qua nền tảng.</p>
                                </div>
                                <img src="${pageContext.request.contextPath}/images/onlineofflineweb2.4.jpg" class="card-img-bottom" alt="Online/Offline" style="object-fit: cover; height: 100%; width: 100%;">
                            </div>
                        </div>
                        <!-- Card 5: Cam kết rõ ràng -->
                        <div class="col">
                            <div class="card h-100 border-0 shadow-sm">
                                <div class="card-body text-center text-dark">
                                    <h5 class="card-title fw-bold">Cam kết rõ ràng</h5>
                                    <p class="card-text">100% hoàn phí nếu không đạt mục tiêu học.</p>
                                </div>
                                <img src="${pageContext.request.contextPath}/images/camketdauraweb2.5.jpg" class="card-img-bottom" alt="Cam kết rõ ràng" style="object-fit: cover; height: 100%; width: 100%;">
                            </div>
                        </div>
                        <!-- Card 6: Hơn 98% học viên -->
                        <div class="col">
                            <div class="card h-100 border-0 shadow-sm">
                                <div class="card-body text-center text-dark">
                                    <h5 class="card-title fw-bold">Hơn 98% học viên</h5>
                                    <p class="card-text">Thỏa mãn đánh giá của học viên IELTS chất lượng.</p>
                                </div>
                                <img src="${pageContext.request.contextPath}/images/89hweb2.6.jpg" class="card-img-bottom" alt="Hơn 98% học viên" style="object-fit: cover; height: 100%; width: 100%;">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Nút điều hướng của carousel -->
            <button class="carousel-control-prev" type="button" data-bs-target="#featureCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#featureCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
</section>
<section class="py-3 bg-light">
    <div class="container text-center">
        <div class="card border-0" style="background-color: #8B0000; border-radius: 10px;">
            <div class="card-body d-flex flex-column justify-content-center align-items-center text-white" style="height: 200px;">
                <h2 class="fw-bold text-white">LỘ TRÌNH HỌC TIẾNG GỌN TỪ 0 - 7.0+</h2>
                <h3>Giáo trình biên soạn độc quyền, nội dung bám sát các dạng đề thi IELTS</h3>
            </div>
        </div>
    </div>
</section>
<section class="py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-md-11 text-center mb-4">
                <img src="${pageContext.request.contextPath}/images/lotrinhwebbb.png" class="img-fluid" alt="lotrinh1" style="max-width: 100%;">
            </div>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-12 col-md-8 text-center mb-4">
            <h5 class="text-dark fw-bold">BẬT MÍ NÈ...</h5>
            <br>
            <h5 class="text-dark fw-bold">ĐÂY CHÍNH LÀ LỘ TRÌNH MÀ IELTS FIGHTER ĐÃ ÁP DỤNG ĐỂ GIÚP HÀNG NGHÌN BẠN HỌC VIÊN XUẤT SẮC VƯỢT VŨ MÔN THÀNH CÔNG TRONG SUỐT 7 NĂM QUA.</h5>
        </div>
    </div>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-md-11 text-center mb-4">
                <img src="${pageContext.request.contextPath}/images/tatcahocvien.png" class="img-fluid" alt="lotrinh1" style="max-width: 100%;">
            </div>
        </div>
    </div>
</section>
<section class="py-5">
    <div class="container">
        <!-- Tiêu đề và mô tả -->
        <div class="row justify-content-center">
            <div class="col-12 text-center">
                <h2 class="text-danger fw-bold mb-3">300+ GIẢNG VIÊN XUẤT SẮC</h2>
                <h5 class="text-dark">Giàu nhiệt huyết và kinh nghiệm sẵn sàng cùng bạn chinh phục đỉnh IELTS</h5>
            </div>
        </div>

        <!-- Hình ảnh và thông tin giảng viên -->
        <div class="row justify-content-center gy-4 mt-4">
            <div class="col-12 col-md-6 col-lg-3 text-center">
                <div class="d-flex flex-column align-items-center">
                    <img src="${pageContext.request.contextPath}/images/giangviennu1web.jpg" class="rounded-circle img-fluid" alt="Ms. Nhi" style="width: 150px; height: 150px; object-fit: cover;">
                    <h5 class="mt-3 text-dark fw-bold">Ms. Nhi - 8.5 IELTS</h5>
                    <p class="text-dark mb-0">
                        - IELTS 8.5 overall<br>
                        - Tốt nghiệp lóa: The University of Melbourne/Master Of Financial Management<br>
                        - Kinh nghiệm giảng dạy 5 năm tại IELTS Fighter
                    </p>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-3 text-center">
                <div class="d-flex flex-column align-items-center">
                    <img src="${pageContext.request.contextPath}/images/giảngviennam1web.jpg" class="rounded-circle img-fluid" alt="Mr. Nam" style="width: 150px; height: 150px; object-fit: cover;">
                    <h5 class="mt-3 text-dark fw-bold">Mr. Nam - 8.0 IELTS</h5>
                    <p class="text-dark mb-0">
                        - Tốt nghiệp: Lòai giỏi Học viện Ngoại giao<br>
                        - IELTS 8.0 Speaking<br>
                        - Nguyễn Phước Chủ tịch Hội Sinh viên Học viện Ngoại giao
                    </p>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-3 text-center">
                <div class="d-flex flex-column align-items-center">
                    <img src="${pageContext.request.contextPath}/images/giangviennu2web.jpg" class="rounded-circle img-fluid" alt="Ms. Thuong" style="width: 150px; height: 150px; object-fit: cover;">
                    <h5 class="mt-3 text-dark fw-bold">Ms. Thuong - 8.0 IELTS</h5>
                    <p class="text-dark mb-0">
                        - IELTS 8.0 overall<br>
                        - Tốt nghiệp 70% học bổng THPT<br>
                        - Hoa khôi IDC, Giải Đấu cuộc thi Hùng biện Tiếng Anh TP Hà Nội<br>
                        - Tham gia các chương trình: AIESEC, IM Venture, VietAbroader, VYMUN
                    </p>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-3 text-center">
                <div class="d-flex flex-column align-items-center">
                    <img src="${pageContext.request.contextPath}/images/giangviennu3wweb.jpg" class="rounded-circle img-fluid" alt="Ms. Trang" style="width: 150px; height: 150px; object-fit: cover;">
                    <h5 class="mt-3 text-dark fw-bold">Ms. Trang - 8.0 IELTS</h5>
                    <p class="text-dark mb-0">
                        - Cố vấn giáo trình Anh - Anh ngớt ngào, có giọng điệu Nhất, TBN<br>
                        - Kinh nghiệm 5 năm huấn luyện, “lày”, lòon biên nâng giáo dục hoc vui và nâng khơi dậy hoc tập tại hát
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-md-8 text-center">
                <h5 class="text-dark mb-3">Nhờ học cùng tôi mà bạn không còn đau đầu??</h5>
                <p class="text-dark mb-4">Rủi ro bạn không hài lòng với tài liệu IELTS Fighter 0%.</p>
                <p class="text-dark mb-4">IELTS Fighter cam kết hoàn “Học phí nếu bạn không đạt” những bạn không hài lòng với giáo trình học tại trung tâm.</p>
                <p class="text-dark mb-4">Nên bạn hoàn toàn có thể yên tâm.</p>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-12 col-md-6 text-center">
                <img src="${pageContext.request.contextPath}/images/camketdauraweb2.5.jpg" class="img-fluid" alt="Testimonial" style="max-width: 100%;">
            </div>
        </div>
    </div>
</section>



<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>