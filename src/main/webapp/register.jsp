<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>FruitBox | Register</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body, html {
        height: 100%;
        margin: 0;
    }

    .carousel-item img {
        height: 100vh;
        object-fit: cover;
        filter: brightness(70%);
    }

    .register-card {
        position: absolute;
        top: 55%;
        left: 50%;
        transform: translate(-50%, -50%);
        z-index: 10;
        width: 100%;
        max-width: 500px;
    }

    .brand {
        font-weight: bold;
    }
</style>
</head>

<body>

<!-- 🔝 Navbar -->
<nav class="navbar navbar-dark bg-success fixed-top">
    <div class="container">
        <a class="navbar-brand brand" href="#">FruitBox</a>
        <a href="adminlogin.jsp" class="btn btn-warning btn-sm">Admin Login</a>
    </div>
</nav>

<!-- Carousel Background -->
<div id="fruitCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
    <div class="carousel-inner">

        <div class="carousel-item active">
            <img src="images/fruitpic6.webp" class="d-block w-100" alt="Fruits">
            >
        </div>

        <div class="carousel-item">
            <img src="https://images.unsplash.com/photo-1601004890684-d8cbf643f5f2" class="d-block w-100" alt="Apples">
        </div>

        <div class="carousel-item">
            <img src="images/fruitpic9.webp" class="d-block w-100" alt="Fruit Basket">
        </div>

    </div>
</div>

<!-- Registration Card -->
<div class="register-card">
    <div class="card shadow-lg rounded-4">
        <div class="card-header bg-success text-white text-center">
            <h3> User Registration</h3>
        </div>

        <div class="card-body bg-light">
            <form action="RegisterServlet" method="post">

                <div class="mb-2">
                    <label class="form-label">Full Name</label>
                    <input type="text" class="form-control" name="name" required>
                </div>

                <div class="mb-2">
                    <label class="form-label">Username</label>
                    <input type="text" class="form-control" name="username" required>
                </div>

                <div class="mb-2">
                    <label class="form-label">Email</label>
                    <input type="email" class="form-control" name="email" required>
                </div>

                <div class="mb-2">
                    <label class="form-label">Mobile</label>
                    <input type="tel" class="form-control" name="mobile"
                           pattern="[0-9]{10}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" class="form-control" name="password" required>
                </div>

                <button type="submit" class="btn btn-success w-100 fw-bold">
                     Register
                </button>
            </form>
        </div>

        <div class="card-footer text-center">
            Already have an account?
            <a href="login.jsp" class="fw-bold text-success">Login</a>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
