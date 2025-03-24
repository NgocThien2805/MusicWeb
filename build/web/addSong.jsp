<%-- 
    Document   : addSong
    Created on : Mar 2, 2025, 10:26:34 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload New Song</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&family=Roboto+Mono:wght@400;600&display=swap" rel="stylesheet">
    <style>
        html, body {
            height: 100%;
            margin: 0;
            font-family: 'Roboto Mono', monospace;
            color: #e0e1dd;
            overflow-x: hidden;
        }
        body {
            background: url('assets/img/bgLogin.gif') no-repeat center center fixed;
            background-size: cover; /* GIF phủ kín màn hình */
        }
        .container {
            max-width: 1300px;
            padding: 2rem 1rem;
            min-height: calc(100vh - 80px); /* Trừ chiều cao header */
            display: flex;
            justify-content: center;
            align-items: center; /* Căn giữa form */
        }
        .header {
            background: rgba(27, 38, 59, 0.9); /* Trong suốt để lộ GIF */
            border-bottom: 1px solid #415a77;
            padding: 1rem 0;
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        .form-card {
            background: rgba(27, 38, 59, 0.9); /* Card trong suốt */
            border: 1px solid #415a77;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(65, 90, 119, 0.3);
            padding: 2rem;
            max-width: 500px; /* Giới hạn chiều rộng form */
            width: 100%;
            transition: all 0.3s ease;
        }
        .form-card:hover {
            box-shadow: 0 0 25px rgba(65, 90, 119, 0.7);
            border-color: #00d4ff; /* Viền xanh neon khi hover */
        }
        h2 {
            font-family: 'Orbitron', sans-serif;
            font-weight: 700;
            color: #38bdf8; /* Xanh sáng hơn */
            text-transform: uppercase;
            letter-spacing: 2px;
            text-shadow: 0 0 15px rgba(56, 189, 248, 0.8); /* Tăng bóng sáng */
            margin-bottom: 2rem;
            background: linear-gradient(45deg, #00d4ff, #7dd3fc); /* Gradient xanh sáng hơn */
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .form-label {
            color: #38bdf8; /* Xanh công nghệ */
            font-weight: 600;
        }
        .form-control {
            background: #0d1b2a;
            border: 1px solid #415a77;
            color: #e0e1dd;
            border-radius: 5px;
            transition: all 0.3s ease;
        }
        .form-control:focus {
            border-color: #00d4ff;
            box-shadow: 0 0 10px rgba(0, 212, 255, 0.5);
            background: #1b263b;
        }
        .btn-primary {
            background: linear-gradient(45deg, #00d4ff, #38bdf8);
            border: none;
            border-radius: 25px;
            font-family: 'Orbitron', sans-serif;
            font-weight: 600;
            padding: 0.75rem;
            transition: all 0.3s ease;
            color: #00d4ff; /* Chữ màu xanh công nghệ */
        }
        .btn-primary:hover {
            background: linear-gradient(45deg, #38bdf8, #00d4ff);
            box-shadow: 0 0 15px rgba(0, 212, 255, 0.7);
            color: #e0e1dd; /* Chữ sáng hơn khi hover */
        }
        .input-icon {
            position: relative;
        }
        .input-icon i {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #60a5fa;
        }
        .input-icon input {
            padding-left: 2.5rem; /* Để chỗ cho icon */
        }
    </style>
</head>
<body>
    <header class="header">
        <%@include file="/include/header.jsp"%>
    </header>

    <%@ page session="true" %>
    <%
        Boolean isVip = (Boolean) session.getAttribute("isVip");
        if (isVip != null && isVip) {
    %>
    <script>
        alert("Congratulations! You are now a VIP Member! Enjoy exclusive access to our premium services. 🎉");
    </script>
    <%
            session.removeAttribute("isVip"); // Xóa cờ để không hiển thị lại thông báo
        }
    %>

    <div class="container">
        <div class="form-card">
            <h2 class="text-center">🎶 Upload Nhạc Mới</h2>
            <form action="SongServlet" method="post" enctype="multipart/form-data">
                <div class="mb-3 input-icon">
                    <label for="song_name" class="form-label">Tên bài hát</label>
                    <i class="fas fa-music"></i>
                    <input type="text" class="form-control" id="song_name" name="song_name" placeholder="Nhập tên bài hát" required>
                </div>

                <div class="mb-3 input-icon">
                    <label for="artist" class="form-label">Ca sĩ</label>
                    <i class="fas fa-microphone"></i>
                    <input type="text" class="form-control" id="artist" name="artist" placeholder="Nhập tên ca sĩ" required>
                </div>

                <div class="mb-3 input-icon">
                    <label for="genre" class="form-label">Thể loại</label>
                    <i class="fas fa-guitar"></i>
                    <input type="text" class="form-control" id="genre" name="genre" placeholder="Nhập thể loại (tùy chọn)">
                </div>

                <div class="mb-3 input-icon">
                    <label for="file" class="form-label">Chọn file nhạc (MP3)</label>
                    <i class="fas fa-file-audio"></i>
                    <input type="file" class="form-control" id="file" name="file" accept=".mp3" required>
                </div>

                <div class="mb-3 input-icon">
                    <label for="cover" class="form-label">Chọn ảnh bìa</label>
                    <i class="fas fa-image"></i>
                    <input type="file" class="form-control" id="cover" name="cover" accept="image/*">
                </div>

                <button type="submit" name="command" value="add" class="btn btn-primary w-100">
                    <i class="fas fa-upload"></i> Tải lên
                </button>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>