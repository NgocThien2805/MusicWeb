<%-- 
    Document   : register
    Created on : Feb 15, 2025, 12:14:54 AM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="./assets/css/validator.css" />
    <title>Sign up</title>
    <style>
        body {
            font-family: 'Roboto Mono', monospace;
            margin: 0;
            min-height: 100vh;
            overflow: hidden; /* Ngăn scroll thừa */
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
            margin-top: 100px; /* Đồng bộ với login */
        }
        .register-card {
            background: rgba(27, 38, 59, 0.9); /* Nền xanh đậm trong suốt */
            border: 1px solid #415a77;
            border-radius: 10px;
            box-shadow: 0 0 25px rgba(65, 90, 119, 0.5);
            padding: 2rem;
            color: #e0e1dd;
            position: relative;
            z-index: 1;
        }
        h3 {
            font-family: 'Orbitron', sans-serif;
            color: #00d4ff; /* Xanh sáng công nghệ */
            text-shadow: 0 0 10px rgba(0, 212, 255, 0.5);
            margin-bottom: 1.5rem;
        }
        .form-label h6 {
            color: #38bdf8; /* Xanh nhạt cho nhãn */
            margin-bottom: 0.5rem;
        }
        .form-control {
            background: #0d1b2a; /* Nền input tối */
            border: 1px solid #415a77;
            color: #e0e1dd;
            border-radius: 5px;
            padding: 12px; /* Đồng bộ với login */
        }
        .form-control:focus {
            border-color: #00d4ff;
            box-shadow: 0 0 10px rgba(0, 212, 255, 0.5);
        }
        .btn-primary {
            background: linear-gradient(45deg, #00d4ff, #38bdf8); /* Gradient xanh */
            border: none;
            border-radius: 25px;
            font-family: 'Orbitron', sans-serif;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            background: linear-gradient(45deg, #38bdf8, #00d4ff);
            box-shadow: 0 0 15px rgba(0, 212, 255, 0.7);
        }
        .form-message.text-danger {
            color: #ff006e !important; /* Đỏ hồng cho lỗi */
        }
        a {
            color: #60a5fa; /* Xanh nhạt cho liên kết */
            text-decoration: none;
        }
        a:hover {
            color: #00d4ff;
            text-shadow: 0 0 5px rgba(0, 212, 255, 0.5);
        }
        .alert-danger {
            background: rgba(255, 75, 75, 0.9);
            border: none;
            color: #ffffff;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <img src="assets/img/bgLogin.gif" id="bg-gif" alt="Background GIF">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="register-card">
                    <h3 class="text-center">Đăng ký</h3>
                    <form action="RegisterServlet" method="POST" id="form-1">
                        <div class="form-group mb-3">
                            <label for="username" class="form-label"><h6>Nhập tên tài khoản:</h6></label>
                            <input
                                id="username"
                                name="username"
                                rules="required"
                                type="text"
                                placeholder="VD: Anhtu1210"
                                class="form-control"
                            />
                            <span class="form-message text-danger"></span>
                        </div>

                        <div class="form-group mb-3">
                            <label for="email" class="form-label"><h6>Email</h6></label>
                            <input
                                id="email"
                                name="email"
                                rules="required|email"
                                type="text"
                                placeholder="VD: email@domain.com"
                                class="form-control"
                            />
                            <span class="form-message text-danger"></span>
                        </div>

                        <div class="form-group mb-3">
                            <label for="password" class="form-label"><h6>Mật khẩu</h6></label>
                            <input
                                id="password"
                                name="password"
                                rules="required|min:6"
                                type="password"
                                placeholder="Nhập mật khẩu"
                                class="form-control"
                            />
                            <span class="form-message text-danger"></span>
                        </div>

                        <div class="form-group mb-3">
                            <label for="password_confirmation" class="form-label"><h6>Nhập lại mật khẩu</h6></label>
                            <input
                                id="password_confirmation"
                                name="password_confirmation"
                                rules="required|confirmed"
                                placeholder="Nhập lại mật khẩu"
                                type="password"
                                class="form-control"
                            />
                            <span class="form-message text-danger"></span>
                        </div>

                        <%
                            String error = request.getParameter("error");
                            if (error != null) {
                        %>
                        <div class="alert alert-danger text-center" role="alert">
                            Tên tài khoản đã tồn tại, vui lòng chọn tên khác!
                        </div>
                        <%
                            }
                        %>

                        <button type="submit" class="btn btn-primary w-100">Đăng ký</button>
                    </form>
                    <p class="text-center mt-3">Đã có tài khoản? <a href="login.jsp">Đăng nhập</a></p>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="./js/validator.js"></script>
    <script>
        var form = new Validator("#form-1");
    </script>
</body>
</html>