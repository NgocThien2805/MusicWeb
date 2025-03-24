    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Music Tech Hub</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&family=Roboto+Mono:wght@400;600&display=swap" rel="stylesheet">
        <style>
 


            html, body {
                height: 100%;
                margin: 0;
                font-family: 'Roboto Mono', monospace;
                background: #0d1b2a;
                color: #e0e1dd;
                overflow-x: hidden;
            }
            .container {
                max-width: 1300px;
                padding: 2rem 1rem;
                min-height: calc(100vh - 80px); /* Trừ header */
            }
            .header {
                background: #1b263b;
                border-bottom: 1px solid #415a77;
                padding: 1rem 0;
                position: sticky;
                top: 0;
                z-index: 1000;
            }
            .card {
                background: #1b263b;
                border: 1px solid #415a77;
                border-radius: 10px;
                box-shadow: 0 0 15px rgba(65, 90, 119, 0.3);
                transition: all 0.3s ease;
                max-height: 500px; /* Giới hạn chiều cao */
                overflow-y: auto;
            }
            .card:hover {
                box-shadow: 0 0 25px rgba(65, 90, 119, 0.7);
                border-color: #00d4ff;
            }
            .playlist-section h2 {
                font-family: 'Orbitron', sans-serif;
                font-weight: 700;
                color: #00d4ff;
                text-transform: uppercase;
                letter-spacing: 2px;
                text-shadow: 0 0 10px rgba(0, 212, 255, 0.5);
                margin-bottom: 2rem;
            }
            .hot-trend h4 {
                font-family: 'Orbitron', sans-serif;
                font-weight: 700;
                color: #ff006e;
                text-transform: uppercase;
                letter-spacing: 1.5px;
                text-shadow: 0 0 10px rgba(255, 0, 110, 0.5);
                margin-bottom: 1.5rem;
            }
            .btn-tech {
                background: linear-gradient(45deg, #00d4ff, #ff006e);
                border: none;
                border-radius: 25px;
                padding: 0.5rem 1.5rem;
                color: #fff;
                font-weight: 600;
                transition: all 0.3s ease;
            }
            .btn-tech:hover {
                background: linear-gradient(45deg, #ff006e, #00d4ff);
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
    <body>
     

        <header class="header">
            <%@include file="/include/header.jsp"%>
        </header>
        <div class="container">
            <div class="row g-4">
                <div class="col-lg-8 playlist-section">
                    <h2 class="text-center">Danh sách Playlist</h2>
                    <div class="card p-4">
                        <%@include file="/include/view_playlist.jsp"%>
                    </div>
                </div>
                <div class="col-lg-4 hot-trend" data-fetch-page="GetTrendSongServlet">
                    <h4>Hot Trend</h4>
                    <div class="card p-3">
                        <%@include file="/include/playlist.jsp"%>
                    </div>
                </div>
            </div>
            <div class="card p-8 mt-4">
                <%@include file="/include/dashboard.jsp"%>
            </div>
            <%
                if (session.getAttribute("user_id") != null) {
            %>
                <div class="row g-4 mt-4">
                    <div class="col-md-6">
                        <div class="">
                            <%@include file="/include/updatePlaylist.jsp"%>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="">
                            <%@include file="/include/addPlaylist.jsp"%>
                        </div>
                    </div>
                </div>
                <script src="./js/feature.js?v=1.0"></script>
            <%
                }
            %>
        </div>

        <script src="./js/playlist_detail.js?v=1.0"></script>
        <script src="./js/playlist.js?v=1.0"></script>
    </body>
    </html>