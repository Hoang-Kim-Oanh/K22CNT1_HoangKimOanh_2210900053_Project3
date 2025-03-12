<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="consultModal" tabindex="-1" aria-labelledby="consultModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="background-color: #800000;"> <!-- Nền đỏ đô đậm cho toàn bộ modal -->
            <div class="modal-header" style="background-color: #800000; border-bottom: 1px solid rgba(255,255,255,0.2);">
                <h1 class="modal-title fs-5 text-white" id="consultModalLabel">ĐĂNG KÝ TƯ VẤN</h1> <!-- Chữ trắng -->
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button> <!-- Nút đóng màu trắng -->
            </div>
            <div class="modal-body text-white"> <!-- Chữ trắng cho body -->
                <p>Giải đáp mọi thắc mắc về lộ trình, học phí, lịch học, thời gian học...</p>
                <form action="home" method="post">
                    <div class="mb-3">
                        <label for="hoten" class="form-label text-white">Họ tên</label>
                        <input type="text" class="form-control" id="hoten" name="hoten" required>
                    </div>
                    <div class="mb-3">
                        <label for="sodienthoai" class="form-label text-white">Số điện thoại</label>
                        <input type="tel" class="form-control" id="sodienthoai" name="sodienthoai" required>
                    </div>

                    <div class="mb-3">
                        <label for="cauhoi" class="form-label text-white">Câu hỏi tư vấn</label>
                        <input type="text" class="form-control" id="cauhoi" name="cauhoi" required>
                    </div>
                    <button type="submit" class="btn w-100" style="background-color: #660000; color: white;">TƯ VẤN CHO TÔI</button> <!-- Nút đậm hơn một chút -->
                </form>
            </div>
        </div>
    </div>
</div>