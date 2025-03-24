<%-- 
    Document   : nav_libary
    Created on : Mar 17, 2025, 8:58:27 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="./assets/css/library.css" />
    <title>JSP Page</title>
    <style>
        body {
            font-family: 'Roboto Mono', monospace;
            margin: 0;
            background: #0d1b2a; /* Màu nền dự phòng xanh đậm công nghệ */
        }
        .navbar {
            background: rgba(27, 38, 59, 0.9); /* Trong suốt để lộ GIF từ library.jsp */
            border-bottom: 1px solid #415a77;
            padding: 0.5rem 1rem;
        }
        .navbar-nav nav-item{
            width: 100%;
            justify-content: space-around; /* Phân bố đều các mục */
        }
        .nav-link {
            font-family: 'Orbitron', sans-serif;
            font-weight: 600;
            color: #38bdf8; /* Xanh sáng công nghệ */
            text-shadow: 0 0 10px rgba(56, 189, 248, 0.7); /* Hiệu ứng sáng */
            transition: all 0.3s ease;
        }
        .nav-link:hover, .nav-link.active {
            color: #60a5fa; /* Xanh sáng hơn khi hover hoặc active */
            text-shadow: 0 0 15px rgba(96, 165, 250, 0.9); /* Tăng bóng sáng */
            background: linear-gradient(45deg, #00d4ff, #60a5fa); /* Gradient xanh sáng */
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" 
                           href="${pageContext.request.contextPath}/LibraryServlet?data-fetch-page=GetMySongServlet">My Songs</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/LibraryServlet">My Playlist</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/LibraryServlet?data-fetch-page=GetHistoryServlet">History</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/LibraryServlet?data-fetch-page=GetTymServlet">My Liked Songs</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="./js/navbar.js?v=1.0"></script>
</body>
</html>