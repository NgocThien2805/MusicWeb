<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="DAO.UserDAO, model.User" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Profile</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="./assets/css/profile.css">
    </head>
    <body>
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

        <div class="container ">
            <div class="row justify-content-center">
                <div class="col-md-12 ">
                    <div class="card p-4 shadow-lg text-white " style=";background: linear-gradient(135deg, #667eea, #764ba2);">
                        <div class="card-body d-flex align-items-center">
                            <div class="col-2 text-center me-3 position-relative">
                                <img src="<%= img %>" alt="Avatar" class="rounded-circle avatar-img">
                                <div class="upload-container mt-2 position-relative">
                                    <!-- Nếu là ảnh mặc định thì chỉ có nút chọn ảnh -->
                                    <% if (img.equals("song_img/avatar.jpg")) { %>
                                    <form action="UploadAvatarServlet" method="post" enctype="multipart/form-data" class="d-flex justify-content-center">
                                        <input type="file" name="avatar" class="form-control d-none" id="fileInput" onchange="this.form.submit();">
                                        <button type="button" class="btn btn-light btn-sm d-flex align-items-center gap-1" onclick="document.getElementById('fileInput').click();">
                                            <img src="song_img/camera.jpg" alt="Camera Icon" class="img-fluid" style="width: 20px; height: 20px;">
                                            Upload Image
                                        </button>
                                    </form>

                                    <% } else { %>
                                    <!-- Nếu có ảnh thì hiển thị menu -->
                                    <button type="button" id="uploadButton" class="btn btn-light btn-sm  gap-1 mt-2" onclick="toggleMenu()">
                                        <img src="song_img/camera.jpg" alt="Camera Icon" class="img-fluid" style="width: 20px; height: 20px;">
                                        Upload Image
                                    </button>

                                    <!-- Menu tùy chọn -->
                                    <div id="uploadMenu" class="upload-menu">
                                        <form action="UploadAvatarServlet" method="post" enctype="multipart/form-data">
                                            <input type="file" name="avatar" class="form-control d-none" id="fileInput">
                                            <button type="button" class="btn btn-primary btn-sm w-100" onclick="document.getElementById('fileInput').click();">
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

                                <script>
                                    function toggleMenu() {
                                        let menu = document.getElementById('uploadMenu');
                                        let button = document.getElementById('uploadButton');

                                        if (menu.style.display === 'block') {
                                            menu.style.display = 'none';
                                        } else {
                                            menu.style.display = 'block';
                                        }
                                    }

                                    document.addEventListener("click", function (event) {
                                        let menu = document.getElementById('uploadMenu');
                                        let button = document.getElementById('uploadButton');

                                        // Nếu click ngoài menu và ngoài button thì ẩn menu
                                        if (menu && !menu.contains(event.target) && !button.contains(event.target)) {
                                            menu.style.display = 'none';
                                        }
                                    });

                                </script>   



                            </div>







                            <div class="col-8 ">
                                <h4>UserName: <strong><%= user.getUsername() %></strong> </h4>
                                <h4>Email: <strong><%= user.getEmail() %></strong> </h4>
                                <h4>VIP: <strong><%= user.isVip() ? "Yes" : "No" %></strong> </h4>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
