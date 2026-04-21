<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard - FruitBox</title>

<!-- Bootstrap 5 CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    background-color: #f5f5f5;
}

.navbar {
    background-color: #28a745;
}

.navbar-brand, .nav-link {
    color: white !important;
    font-weight: 500;
}

.card {
    border-radius: 15px;
    transition: 0.3s;
}

.card:hover {
    transform: scale(1.05);
    box-shadow: 0 5px 20px rgba(0,0,0,0.2);
}

.dashboard-title {
    margin-top: 30px;
    margin-bottom: 30px;
    font-weight: bold;
}
</style>

</head>
<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">FruitBox </a>
    <div class="d-flex">
      <span class="nav-link">Welcome, <%= session.getAttribute("username") %></span>
      <a class="nav-link" href="LogoutServlet">Logout</a>
    </div>
  </div>
</nav>

<!-- BODY -->
<div class="container text-center">

    <h2 class="dashboard-title">User Dashboard</h2>

    <div class="row justify-content-center g-4">

        <div class="col-md-3">
            <div class="card p-4">
                <h4>🍓 View Fruits</h4>
                <p>Browse all fresh fruits</p>
                <a href="viewfruits.jsp" class="btn btn-success">Explore</a>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card p-4">
                <h4>🛒 My Cart</h4>
                <p>Check your cart items</p>
                <a href="cart.jsp" class="btn btn-warning">View Cart</a>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card p-4">
                <h4>📦 My Orders</h4>
                <p>Track your orders</p>
                <a href="orders.jsp" class="btn btn-primary">View Orders</a>
            </div>
        </div>

    </div>

</div>

<!-- FOOTER -->
<footer class="text-center mt-5 p-3 bg-dark text-white">
    © 2026 FruitBox | Fresh & Organic 
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>