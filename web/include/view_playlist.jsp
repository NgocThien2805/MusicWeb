<%-- 
    Document   : view_playlist
    Created on : Mar 20, 2025, 1:51:27 AM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Các link CSS đã được bao gồm trong homepage.jsp, không cần lặp lại -->
    <style>
        body {
            font-family: 'Roboto Mono', monospace;
            margin: 0;
            min-height: 100vh;
            background: #0d1b2a; /* Màu nền dự phòng xanh đậm công nghệ */
            overflow-y: auto;
            padding-bottom: 120px; /* Khoảng trống dưới cùng để tránh đè dashboard */
        }
        #bg-gif {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: -1; /* GIF nằm dưới mọi thứ */
            opacity: 60; /* Đậm màu vừa phải, đồng bộ với các trang khác */
        }
        .row {
            position: relative;
            z-index: 1; /* Nội dung trên GIF */
        }
        .playlist-item {
            position: relative;
            overflow: hidden;
            border-radius: 10px;
            background: rgba(27, 38, 59, 0.9); /* Trong suốt để lộ GIF */
            border: 1px solid #415a77;
            box-shadow: 0 0 15px rgba(65, 90, 119, 0.3);
            transition: all 0.3s ease;
        }
        .playlist-item:hover {
            box-shadow: 0 0 25px rgba(65, 90, 119, 0.7);
            border-color: #00d4ff;
        }
        .playlist-img {
            width: 100%;
            height: 200px; /* Chiều cao cố định cho đồng bộ */
            object-fit: cover;
            transition: transform 0.3s ease;
        }
        .playlist-item:hover .playlist-img {
            transform: scale(1.05); /* Zoom nhẹ khi hover */
        }
        .play-button {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 2rem;
            color: #00d4ff; /* Giữ màu xanh công nghệ cho nút play */
            opacity: 0;
            transition: opacity 0.3s ease;
        }
        .playlist-item:hover .play-button {
            opacity: 1; /* Hiện nút play khi hover */
        }
        .title-overplay {
            position: absolute;
            bottom: 10px;
            left: 10px;
            font-family: 'Orbitron', sans-serif;
            font-weight: 700;
            color: #e0e1dd; /* Đổi thành màu sáng để nổi trên GIF */
            text-shadow: 0 0 10px rgba(0, 212, 255, 0.5);
            margin: 0;
        }
        .playlist_content {
            padding: 1rem;
            color: #38bdf8; /* Màu xanh công nghệ cho nội dung dưới ảnh */
            text-align: center; /* Căn giữa chữ dưới ảnh */
        }
        .card-title {
            font-family: 'Roboto Mono', monospace;
            font-size: 1.25rem;
            color: #00d4ff; /* Xanh neon đậm cho tiêu đề dưới ảnh */
            margin-bottom: 0.5rem;
        }
        .playlist_content p {
            font-size: 0.9rem;
            margin: 0;
            color: #60a5fa; /* Xanh nhạt hơn cho chữ phụ dưới ảnh */
        }
        .playlist_content strong {
            color: #38bdf8; /* Xanh công nghệ đồng bộ với nội dung dưới ảnh */
        }
    </style>
</head>
<body>
    <!-- Thêm GIF nền nếu hoạt động độc lập -->
    <img src="assets/img/bgLogin.gif" id="bg-gif" alt="Background GIF">
    
    <div class="row g-4"> <!-- Thêm g-4 để đồng bộ với homepage -->
        <c:forEach var="playlistItem" items="${playlistList}">
            <div class="col-md-4">
                <div class="playlist-item">
                    <a href="PlaylistServlet?playlist_id=${playlistItem.playlistId}">
                        <img src="${playlistItem.playlistImg != null && !playlistItem.playlistImg.isEmpty() ? playlistItem.playlistImg : './playlist_img/anhst1.jpg'}" class="playlist-img" alt="${playlistItem.playlistName}">
                    </a>
                    <div class="play-button">
                        <i class="fa fa-play"></i>
                    </div>
                    <h5 class="title-overplay">${playlistItem.playlistName}</h5>
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html>