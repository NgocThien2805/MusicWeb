<%-- 
    Document   : profile
    Created on : Mar 11, 2025, 2:08:58 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="DAO.UserDAO, model.User" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Profile</title>
    <!-- Các link CSS/JS đã được bao gồm trong homepage.jsp, không lặp lại -->
    <style>
        body {
            background: #0d1b2a; /* Nền tối đồng bộ */
            font-family: 'Roboto Mono', monospace;
            color: #e0e1dd;
        }
        #bg-gif {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover; /* Đảm bảo GIF phủ kín màn hình */
            z-index: -1; /* Đặt GIF dưới nội dung */
        }
        .container {
            max-width: 1300px;
            padding: 2rem 1rem;
        }
        .card {
            background: #1b263b; /* Card nền tối */
            border: 1px solid #415a77;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(65, 90, 119, 0.3);
            transition: all 0.3s ease;
        }
        .card:hover {
            box-shadow: 0 0 25px rgba(65, 90, 119, 0.7);
            border-color: #00d4ff; /* Viền xanh neon khi hover */
        }
        .avatar-img {
            width: 120px;
            height: 120px;
            object-fit: cover;
            border: 2px solid #00d4ff; /* Viền xanh công nghệ */
            border-radius: 50%;
        }
        .upload-container {
            margin-top: 1rem;
        }
        .btn-tech {
            background: linear-gradient(45deg, #00d4ff, #38bdf8); /* Gradient xanh */
            border: none;
            border-radius: 25px;
            padding: 0.5rem 1rem;
            color: #fff;
            font-family: 'Orbitron', sans-serif;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-tech:hover {
            background: linear-gradient(45deg, #38bdf8, #00d4ff);
            box-shadow: 0 0 15px rgba(0, 212, 255, 0.7);
        }
        .btn-danger {
            background: linear-gradient(45deg, #ff006e, #f87171); /* Gradient đỏ cho nút xóa */
            border: none;
            border-radius: 25px;
            padding: 0.5rem 1rem;
            color: #fff;
            font-family: 'Orbitron', sans-serif;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-danger:hover {
            background: linear-gradient(45deg, #f87171, #ff006e);
            box-shadow: 0 0 15px rgba(255, 0, 110, 0.7);
        }
        .upload-menu {
            display: none;
            position: absolute;
            background: #1b263b;
            border: 1px solid #415a77;
            border-radius: 5px;
            padding: 0.5rem;
            box-shadow: 0 0 10px rgba(65, 90, 119, 0.5);
            z-index: 1000;
            width: 150px;
            left: 50%;
            transform: translateX(-50%);
            bottom: -110px; /* Đặt dưới avatar */
        }
        .profile-info h4 {
            font-family: 'Orbitron', sans-serif;
            font-size: 1.25rem;
            color: #00d4ff; /* Xanh neon cho tiêu đề */
            margin-bottom: 0.75rem;
        }
        .profile-info strong {
            color: #38bdf8; /* Xanh công nghệ cho giá trị */
        }
    </style>
</head>
<body>
        <img src="assets/img/bgProfile.gif" id="bg-gif" alt="Background GIF">

    <%@include file="/include/header.jsp"%>
    <%
        String userID = (String) session.getAttribute("user_id"); 
        if (userID == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        UserDAO userDao = new UserDAO();
        User user = userDao.getUserById(userID);
        String img = (user.getAvatarUrl() != null) ? user.getAvatarUrl() : "song_img/avatar.jpg"; 
    %>     

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card p-4">
                    <div class="card-body d-flex align-items-center">
                        <div class="col-2 text-center me-3 position-relative">
                            <img src="<%= img %>" alt="Avatar" class="avatar-img">

                            <div class="upload-container position-relative d-flex justify-content-center">
                                <% if (img.equals("song_img/avatar.jpg")) { %>
                                <!-- Trường hợp ảnh mặc định: Tự động upload khi chọn file -->
                                <form action="UploadAvatarServlet" method="post" enctype="multipart/form-data">
                                    <input type="file" name="avatar" class="form-control d-none" id="fileInput" onchange="this.form.submit();">
                                    <button type="button" class="btn btn-tech btn-sm d-flex align-items-center gap-1" onclick="document.getElementById('fileInput').click();">
                                        <i class="fas fa-camera"></i> Upload
                                    </button>
                                </form>
                                <% } else { %>
                                <!-- Trường hợp đã có ảnh: Hiển thị menu chọn hành động -->
                                <button type="button" class="btn btn-tech btn-sm d-flex align-items-center gap-1 mt-2" onclick="toggleMenu()">
                                    <i class="fas fa-camera"></i> Upload
                                </button>

                                <!-- Menu upload cố định dưới avatar -->
                                <div id="uploadMenu" class="upload-menu">
                                    <form action="UploadAvatarServlet" method="post" enctype="multipart/form-data">
                                        <input type="file" name="avatar" class="form-control d-none" id="fileInput" >
                                        <button type="button" class="btn btn-tech btn-sm w-100" onclick="document.getElementById('fileInput').click();">
                                            Chọn ảnh mới
                                        </button>
                                    </form>
                                    <form action="UploadAvatarServlet" method="post" class="mt-2">
                                        <input type="hidden" name="action" value="delete">
                                        <button type="submit" class="btn btn-danger btn-sm w-100">Xóa ảnh</button>
                                    </form>
                                </div>
                                <% } %>
                            </div>
                        </div>

                        <div class="col-8 profile-info">
                            <h4>UserName: <strong><%= user.getUsername() %></strong></h4>
                            <h4>Email: <strong><%= user.getEmail() %></strong></h4>
                            <h4>VIP: <strong><%= user.isVip() ? "Yes" : "No" %></strong></h4>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function toggleMenu() {
            let menu = document.getElementById('uploadMenu');
            menu.style.display = (menu.style.display === 'none' || menu.style.display === '') ? 'block' : 'none';
        }
    </script>
</body>
</html>