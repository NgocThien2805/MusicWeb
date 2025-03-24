<%-- 
    Document   : dashboard
    Created on : Mar 18, 2025, 8:26:53 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
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
            background: #0d1b2a; /* Màu nền dự phòng xanh đậm công nghệ */
            overflow-y: auto;
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
        .dashboard.player {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            background: rgba(27, 38, 59, 0.9); /* Trong suốt để lộ GIF */
            border-top: 1px solid #415a77;
            box-shadow: 0 -5px 15px rgba(65, 90, 119, 0.3);
            padding: 1rem;
            z-index: 1000; /* Đảm bảo dashboard ở trên cùng */
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: #e0e1dd;
        }
        .dashboard__left {
            flex: 1;
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        .dashboard__left header h2 {
            font-family: 'Orbitron', sans-serif;
            color: #00d4ff; /* Xanh công nghệ cho tiêu đề */
            text-shadow: 0 0 10px rgba(0, 212, 255, 0.5);
            margin: 0;
            font-size: 1.5rem;
        }
        .dashboard__left header h4 {
            font-family: 'Roboto Mono', monospace;
            color: #38bdf8; /* Xanh nhạt hơn */
            margin: 0;
            font-size: 1rem;
        }
        .cd-thumb {
            width: 60px;
            height: 60px;
            background-size: cover;
            background-position: center;
            border-radius: 50%;
            border: 2px solid #00d4ff; /* Viền xanh công nghệ */
            box-shadow: 0 0 10px rgba(0, 212, 255, 0.5);
        }
        .dashboard__center {
            flex: 2;
            text-align: center;
        }
        .control {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-bottom: 0.5rem;
        }
        .btn {
            background: none;
            border: none;
            color: #00d4ff; /* Xanh công nghệ cho nút */
            font-size: 1.2rem;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .btn:hover {
            color: #38bdf8; /* Xanh nhạt khi hover */
            text-shadow: 0 0 10px rgba(0, 212, 255, 0.7);
        }
        .btn-toggle-play .icon-pause,
        .btn-toggle-play .icon-play {
            font-size: 1.5rem;
        }
        #adTime {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }
        .time {
            color: #60a5fa; /* Xanh nhạt cho thời gian */
            font-size: 0.9rem;
        }
        .progress {
            width: 50%;
            height: 5px;
            background: #415a77;
            border-radius: 5px;
            accent-color: #00d4ff; /* Xanh công nghệ cho thanh tiến trình */
        }
        .dashboard_right {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: flex-end;
            gap: 1rem;
        }
        .btn-tym i {
            color: #ff006e; /* Màu hồng cho nút tym */
            font-size: 1.2rem;
            transition: all 0.3s ease;
        }
        .btn-tym:hover i {
            color: #ff4d94;
            text-shadow: 0 0 10px rgba(255, 0, 110, 0.7);
        }
        #adVolume {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        #mute {
            color: #00d4ff; /* Xanh công nghệ cho biểu tượng âm lượng */
            font-size: 1.2rem;
            cursor: pointer;
        }
        #mute:hover {
            color: #38bdf8;
            text-shadow: 0 0 10px rgba(0, 212, 255, 0.7);
        }
        #volume {
            width: 100px;
            height: 5px;
            background: #415a77;
            border-radius: 5px;
            accent-color: #00d4ff; /* Xanh công nghệ cho thanh âm lượng */
        }
    </style>
</head>
<body>
    <!-- Thêm GIF nền nếu chạy độc lập -->
    <img src="assets/img/bgLogin.gif" id="bg-gif" alt="Background GIF">

    <div class="dashboard player">
        <!-- Header -->
        <div class="dashboard__left">
            <header>
                <h2>Now playing:</h2>
                <h4>String 57th & 9th</h4>
            </header>
            <!-- CD -->
            <div class="cd">
                <div class="cd-thumb" style="background-image: url('https://i.ytimg.com/vi/jTLhQf5KJSc/maxresdefault.jpg');"></div>
            </div>
        </div>

        <div class="dashboard__center">
            <!-- Control -->
            <div class="control">
                <div class="btn btn-repeat">
                    <i class="fas fa-redo"></i>
                </div>
                <div class="btn btn-prev">
                    <i class="fas fa-step-backward"></i>
                </div>
                <div class="btn btn-toggle-play">
                    <i class="fa-solid fa-pause icon-pause"></i>
                    <i class="fa-solid fa-play icon-play"></i>
                </div>
                <div class="btn btn-next">
                    <i class="fas fa-step-forward"></i>
                </div>
                <div class="btn btn-random">
                    <i class="fas fa-random"></i>
                </div>
            </div>
            <!-- Song progress -->
            <form id="adTime">
                <span id="current-time" class="time">0:00</span>
                <input id="progress" class="progress" type="range" value="0" step="1" min="0" max="100" />
                <span id="duration" class="time">0:00</span>
            </form>
        </div>

        <div class="dashboard_right">
            <div class="btn btn-tym">
                <i class="fa-solid fa-heart"></i>
            </div>
            <form id="adVolume" action="">
                <i id="mute" class="fa-solid fa-volume-high"></i>
                <input id="volume" class="progress" type="range" value="100" step="1" min="0" max="100" />
            </form>
        </div>

        <audio id="audio" src=""></audio>
    </div>
</body>
</html>