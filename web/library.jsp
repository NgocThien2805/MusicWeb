<%-- 
    Document   : library
    Created on : Mar 17, 2025, 8:28:25 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Music Library</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&family=Roboto+Mono:wght@400;600&display=swap" rel="stylesheet">
    <style>
        html, body {
            height: 100%;
            margin: 0;
            font-family: 'Roboto Mono', monospace;
            color: #e0e1dd;
            overflow-x: hidden;
            background: #0d1b2a; /* Màu nền dự phòng xanh đậm công nghệ */
            overflow-y: auto;
            padding-bottom: 120px; /* Khoảng trống dưới để tránh đè dashboard */
        }
        #bg-gif {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: -1; /* GIF nằm dưới mọi thứ */
            opacity: 0.6; /* Đậm màu vừa phải */
        }
        .container {
            max-width: 1300px;
            padding: 2rem 1rem;
            min-height: calc(100vh - 80px); /* Trừ chiều cao header */
            position: relative;
            z-index: 1; /* Nội dung trên GIF */
        }
        .header {
            background: rgba(27, 38, 59, 0.9); /* Trong suốt để lộ GIF */
            border-bottom: 1px solid #415a77;
            padding: 1rem 0;
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        .card {
            background: rgba(27, 38, 59, 0.9); /* Card trong suốt nhẹ */
            border: 1px solid #415a77;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(65, 90, 119, 0.3);
            transition: all 0.3s ease;
            padding: 1.5rem;
        }
        .card:hover {
            box-shadow: 0 0 25px rgba(65, 90, 119, 0.7);
            border-color: #00d4ff; /* Viền xanh neon khi hover */
        }
        h2 {
            font-family: 'Orbitron', sans-serif;
            font-weight: 700;
            color: #38bdf8; /* Xanh sáng hơi cho "Thư Viện Âm Nhạc" */
            text-transform: uppercase;
            letter-spacing: 2px;
            text-shadow: 0 0 15px rgba(56, 189, 248, 0.7); /* Tăng bóng mờ để sáng hơn */
            margin-bottom: 2rem;
            text-align: center;
            background: linear-gradient(45deg, #00d4ff, #60a5fa); /* Gradient xanh sáng */
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent; /* Chữ gradient */
        }
        .btn-tech {
            background: linear-gradient(45deg, #00d4ff, #38bdf8);
            border: none;
            border-radius: 25px;
            padding: 0.5rem 1.5rem;
            color: #fff;
            font-family: 'Orbitron', sans-serif;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-tech:hover {
            background: linear-gradient(45deg, #38bdf8, #00d4ff);
            box-shadow: 0 0 15px rgba(0, 212, 255, 0.7);
        }
        /* Scrollbar Styling */
        ::-webkit-scrollbar {
            width: 8px;
        }
        ::-webkit-scrollbar-track {
            background: #1b263b;
        }
        ::-webkit-scrollbar-thumb {
            background: #00d4ff;
            border-radius: 4px;
        }
        ::-webkit-scrollbar-thumb:hover {
            background: #ff006e;
        }
        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }
        }
    </style>
</head>
<body data-fetch-page="${fetchPage}">
    <!-- Thêm GIF nền -->
    <img src="assets/img/bgLogin.gif" id="bg-gif" alt="Background GIF">

    <header class="header">
        <%@include file="/include/header.jsp"%>
    </header>
    
    <div class="container">
        <h2>Thư Viện Âm Nhạc</h2>
        <div class="row g-4">
            <div class="col-lg-12">
                <div class="">
                    <%@include file="/include/nav_libary.jsp"%>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="">
                    <%@include file="/include/playlist.jsp"%>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="">
                    <%@include file="/include/dashboard.jsp"%>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="">
                    <%@include file="/include/updatePlaylist.jsp"%>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="">
                    <%@include file="/include/addPlaylist.jsp"%>
                </div>
            </div>
        </div>
    </div>

    <script src="./js/feature.js?v=1.0"></script>
    <script src="./js/playlist_detail.js?v=1.0"></script>
</body>
</html>