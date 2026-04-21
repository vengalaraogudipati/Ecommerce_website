<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User Login | FruitBox</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    margin: 0;
    padding: 0;
}

.carousel img {
    height: 100vh;
    object-fit: cover;
}

.login-box {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 380px;
    padding: 25px;
    background: rgba(255, 255, 255, 0.95);
    border-radius: 10px;
    box-shadow: 0 0 20px rgba(0,0,0,0.4);
    z-index: 10;
}
</style>
</head>

<body>

<!-- 🌿 Navbar -->
<nav class="navbar navbar-dark bg-success fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#">FruitBox</a>
    </div>
</nav>

<div style="position: relative;">

    <!-- 🍎 Carousel -->
    <div id="fruitCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="images/fruitpic8.webp" class="d-block w-100" alt="Fruits">
            </div>
            <div class="carousel-item">
                <img src="images/fruitpic7.jpg" class="d-block w-100" alt="Fruits">
            </div>
            <div class="carousel-item">
                <img src="images/fruitpic6.webp" class="d-block w-100" alt="Fruits">
            </div>
        </div>
    </div>

    <!-- 🔐 Login Box -->
    <div class="login-box">
        <h3 class="text-center mb-3 text-success">User Login</h3>

        <form action="UserLoginServlet" method="post">
            <div class="mb-3">
                <label class="form-label">Username</label>
                <input type="text" name="username" class="form-control" placeholder="Enter username" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="password" name="password" class="form-control" placeholder="Enter password" required>
            </div>

            <button class="btn btn-success w-100">Login</button>
        </form>

        <div class="text-center mt-3">
            Don't have an account?
            <a href="register.jsp">Register here</a>
        </div>
    </div>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
