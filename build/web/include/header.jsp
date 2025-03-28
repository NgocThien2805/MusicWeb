<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.User, DAO.UserDAO" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="./assets/css/homepage.css"/>
        <link rel="stylesheet" href="./assets/css/search.css"/>
        <title>JSP Page</title>
    </head>
    <body>

        <%@ page session="true" %>
        <%
            String username = (String) session.getAttribute("username");
            String userId = (String) session.getAttribute("user_id");
     
        %>

        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"><img class="logo" src="./assets/img/logo.png" alt="alt"/></a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="HomepageServlet">Home</a>
                        </li>

                        <li class="nav-item">
                            <%
                                if (username != null) { // Nếu đã đăng nhập
                            %>
                            <a class="nav-link" href="./mysong.jsp">Library</a>
                            <%
                                } else { // Nếu chưa đăng nhập
                            %>
                            <a class="nav-link" href="login.jsp" onclick="return confirm('Bạn cần đăng nhập để có thư viện riêng!');">Library</a>
                            <%
                                }
                            %>
                        </li>
                        <li class="nav-item">
                            <%
                                if (username != null) { // Nếu đã đăng nhập
                            %>
                            <a class="nav-link" href="./SongServlet">Up songs</a>
                            <%
                                } else { // Nếu chưa đăng nhập
                            %>
                            <a class="nav-link" href="login.jsp" onclick="return confirm('Bạn cần đăng nhập để đăng bài hát!');">Up songs</a>
                            <%
                                }
                            %>
                        </li>
                        <li class="nav-item">
                            <%
                                if (username != null) { // Nếu đã đăng nhập
                            %>
                            <a class="nav-link" href="./history.jsp">History</a>
                            <%
                                } else { // Nếu chưa đăng nhập
                            %>
                            <a class="nav-link" href="login.jsp" onclick="return confirm('Bạn cần đăng nhập để xem lịch sủ bài hát!');">History</a>
                            <%
                                }
                            %>
                        </li>
                    </ul>

                    <!-- Search bar căn giữa -->
                    <div class="mx-auto w-50">
                        <form action="SongServlet" method="post" class="d-flex" role="search">
                            <input class="form-control me-2" id="searchBox"
                                   type="search" placeholder="Search" 
                                   aria-label="Search" name="search"
                                   onkeyup="searchSong()">
                            <button class="btn btn-outline-success" type="submit" name="command" value="search">Search</button>
                        </form>
                        <div id="suggestionList"></div>
                    </div>

                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <%
                            if (username != null) {  // Nếu đã đăng nhập
                        %>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <%
                                    UserDAO userDao = new UserDAO();
                                    User user = userDao.getUserById(userId);
                                    String avatar = user.getAvatarUrl();
                                    if (avatar != null && !avatar.isEmpty()) { // Kiểm tra nếu có ảnh đại diện
                                %>
                                <img src="<%= avatar %>" alt="Avatar" class="rounded-circle me-2" style="width: 30px; height: 30px; object-fit: cover;">
                                <%
                                    } else { // Nếu không có ảnh, hiển thị ảnh mặc định
                                %>
                                <img src="./assets/song_img/avatar.png" alt="Default Avatar" class="rounded-circle me-2" style="width: 30px; height: 30px; object-fit: cover;">
                                <%
                                    }
                                %>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="profile.jsp">Profile</a></li>
                                <li><a class="dropdown-item" href="settings.jsp">Settings</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="LogoutServlet">Logout</a></li>
                            </ul>
                        </li>
                        <%
                            } else {  // Nếu chưa đăng nhập, hiển thị nút Login và Register
                        %>
                        <li class="nav-item">
                            <a class="btn btn-primary me-2" href="login.jsp">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-success" href="register.jsp">Register</a>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                </div>
            </div>
        </nav>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="./js/search.js?v=1.0"></script>
    </body>
</html>