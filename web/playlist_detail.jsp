<%-- 
    Document   : songsplaylist
    Created on : Feb 28, 2025, 3:15:12 AM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết Playlist</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/css/playlist_detail.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@400;600&family=Orbitron:wght@600&display=swap" rel="stylesheet" />
    <style>
        body {
            font-family: 'Roboto Mono', monospace;
            margin: 0;
            min-height: 100vh;
            background: #0d1b2a;
            overflow-y: auto;
            padding-bottom: 120px; /* Khoảng trống dưới cùng để tránh đè lên dashboard */
        }
        #bg-gif {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: -1;
            opacity: 1; /* Sửa lại từ 10 về 1 (giá trị hợp lệ) */
        }
        .container {
            max-width: 1300px;
            padding: 2rem 1rem;
            position: relative;
            z-index: 1;
            margin-top: 80px;
        }
        .playlist-header {
            background: rgba(27, 38, 59, 0.9);
            border: 1px solid #415a77;
            border-radius: 10px;
            box-shadow: 0 0 25px rgba(65, 90, 119, 0.5);
            padding: 2rem;
            color: #e0e1dd;
            margin-bottom: 2rem;
        }
        .playlist-header h2 {
            font-family: 'Orbitron', sans-serif;
            color: #00d4ff;
            text-shadow: 0 0 10px rgba(0, 212, 255, 0.5);
            margin-bottom: 1.5rem;
        }
        .playlist-actions {
            display: flex;
            gap: 1rem;
        }
        .edit-btn, .delete-btn {
            background: linear-gradient(45deg, #00d4ff, #38bdf8);
            border: none;
            border-radius: 25px;
            font-family: 'Orbitron', sans-serif;
            font-weight: 600;
            padding: 0.5rem 1.5rem;
            color: #1b263b;
            transition: all 0.3s ease;
        }
        .edit-btn:hover, .delete-btn:hover {
            background: linear-gradient(45deg, #38bdf8, #00d4ff);
            box-shadow: 0 0 15px rgba(0, 212, 255, 0.7);
        }
        .delete-btn {
            background: linear-gradient(45deg, #ff006e, #ff4d94);
        }
        .delete-btn:hover {
            background: linear-gradient(45deg, #ff4d94, #ff006e);
            box-shadow: 0 0 15px rgba(255, 0, 110, 0.7);
        }
        .playlist-header__img img {
            max-width: 200px;
            border-radius: 10px;
            border: 2px solid #415a77;
            box-shadow: 0 0 15px rgba(65, 90, 119, 0.5);
        }
        .form-label {
            color: #38bdf8;
            margin-bottom: 0.5rem;
        }
        .form-control {
            background: #0d1b2a;
            border: 1px solid #415a77;
            color: #e0e1dd;
            border-radius: 5px;
            padding: 0.75rem;
        }
        .form-control:focus {
            border-color: #00d4ff;
            box-shadow: 0 0 10px rgba(0, 212, 255, 0.5);
        }
        h4 {
            font-family: 'Orbitron', sans-serif;
            color: #00d4ff;
            text-shadow: 0 0 15px rgba(0, 212, 255, 0.7); /* Tăng bóng mờ cho hiệu ứng công nghệ */
            margin-bottom: 1.5rem;
            background: linear-gradient(45deg, #00d4ff, #38bdf8); /* Gradient xanh công nghệ */
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent; /* Làm chữ gradient */
        }
        /* Đảm bảo dashboard không bị đè */
        .dashboard {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
            background: rgba(27, 38, 59, 0.9);
            padding: 1rem;
            border-top: 1px solid #415a77;
        }
    </style>
</head>
<body data-fetch-page="GetPlaylistServlet">
    <img src="assets/img/bgLogin.gif" id="bg-gif" alt="Background GIF">
    <%@include file="/include/header.jsp"%>

    <div class="container mt-5">
        <div class="playlist-header">
            <h2><%= request.getAttribute("playlistName") %></h2>
            <%
                if (session.getAttribute("user_id") == request.getAttribute("p.user_id")) {
            %>
            <div class="playlist-actions">
                <button class="edit-btn" onclick="openEditForm()">Chỉnh sửa</button>
                <button class="delete-btn" onclick="deletePlaylist(<%= request.getParameter("playlist_id") %>)">Xóa</button>
            </div>
            <%
                }
            %>

            <div class="playlist-header__img">
                <img src="<%= request.getAttribute("playlist_img") %>" alt="Playlist Cover" />
                <%
                    if (session.getAttribute("user_id") == request.getAttribute("p.user_id")) {
                %>
                <form action="PlaylistServlet" method="post" enctype="multipart/form-data">
                    <input style="display: none;" type="number" class="form-control" name="playlist_id" value="<%= request.getParameter("playlist_id") %>">
                    <label for="cover" class="form-label">Chọn ảnh bìa</label>
                    <input type="file" class="form-control" id="cover" name="playlist_cover" accept="image/*">
                    <button type="submit" class="form-control" name="action" value="update">
                        Chọn ảnh mới
                    </button>
                </form>
                <%
                    }
                %>
            </div>
        </div>

        <h4>Danh sách bài hát</h4>
        <%@include file="/include/playlist.jsp"%> 
    </div>
    <%@include file="/include/dashboard.jsp"%>

    <%
        if (session.getAttribute("user_id") != null) {
    %>
    <%@include file="/include/updatePlaylist.jsp"%>
    <%@include file="/include/addPlaylist.jsp"%>
    <script src="./js/feature.js?v=1.0"></script> 
    <%
        }
    %>
    <script src="./js/playlist_detail.js?v=1.0"></script>
</body>
</html>