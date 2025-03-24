<%-- 
    Document   : playlist
    Created on : Mar 18, 2025, 8:28:23 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Hot Trend Playlist</title>
    <!-- Các link CSS đã được bao gồm trong homepage.jsp, không cần lặp lại -->
    <style>
        body {
            background: #0d1b2a; /* Đồng bộ với homepage */
            font-family: 'Roboto Mono', monospace;
        }
        .playlist {
            margin: 0;
            padding: 0;
        }
        .song {
            display: flex;
            align-items: center;
            background: #1b263b;
            border: 1px solid #415a77;
            border-radius: 8px;
            padding: 0.75rem;
            margin-bottom: 0.5rem;
            transition: all 0.3s ease;
        }
        .song:hover {
            box-shadow: 0 0 15px rgba(255, 0, 110, 0.5); /* Hiệu ứng đỏ khi hover */
            border-color: #ff006e; /* Đỏ neon */
        }
        .thumb {
            width: 50px;
            height: 50px;
            background-size: cover;
            background-position: center;
            border-radius: 5px;
            margin-right: 1rem;
        }
        .body {
            flex-grow: 1;
        }
        .title {
            font-family: 'Orbitron', sans-serif;
            font-size: 1.1rem;
            color: #ff006e; /* Đỏ neon hiện đại */
            margin: 0;
            text-shadow: 0 0 5px rgba(255, 0, 110, 0.5);
        }
        .author {
            font-size: 0.85rem;
            color: #f87171; /* Đỏ nhạt hơn cho tác giả */
            margin: 0;
        }
        .option {
            font-size: 1rem;
            color: #ff006e; /* Đỏ neon cho icon */
            cursor: pointer;
            padding: 0 1rem;
            transition: color 0.3s ease;
        }
        .option:hover {
            color: #f87171; /* Đỏ nhạt khi hover */
        }
        .btn-modern {
            background: linear-gradient(45deg, #ff006e, #f87171); /* Gradient đỏ */
            border: none;
            border-radius: 25px;
            padding: 0.5rem 1.5rem;
            color: #fff;
            font-family: 'Orbitron', sans-serif;
            font-weight: 600;
            text-transform: uppercase;
            transition: all 0.3s ease;
            display: inline-block;
            margin-top: 1rem;
        }
        .btn-modern:hover {
            background: linear-gradient(45deg, #f87171, #ff006e);
            box-shadow: 0 0 15px rgba(255, 0, 110, 0.7);
        }
    </style>
</head>
<body>
    <div class="playlist">
        <div class="song">
            <div class="thumb" style="background-image: url('https://i.ytimg.com/vi/jTLhQf5KJSc/maxresdefault.jpg');"></div>
            <div class="body">
                <h3 class="title">Song Title</h3> <!-- Thay bằng dữ liệu động nếu cần -->
                <p class="author">Author Name</p> <!-- Thay bằng dữ liệu động nếu cần -->
            </div>
            <div class="option">
                <i class="fas fa-ellipsis-h"></i>
            </div>
        </div>
    </div>
    <a href="HomepageServlet" class="btn-modern">Quay Lại</a>
</body>
</html>