<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,com.fruitbox.dao.*,com.fruitbox.models.*" %>

<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    FruitDAOImpl dao = new FruitDAOImpl();
    List<FruitModel> list = dao.getAllFruits();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FruitBox - Shop Fruits</title>

<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    background-color: #f8f9fa;
}

/* Navbar */
.navbar {
    background-color: #28a745;
}

.navbar-brand, .nav-link {
    color: white !important;
    font-weight: 500;
}

/* Product Card */
.card {
    border-radius: 15px;
    transition: 0.3s;
}

.card:hover {
    transform: translateY(-8px);
    box-shadow: 0 8px 25px rgba(0,0,0,0.2);
}

.card img {
    height: 180px;
    object-fit: contain;
    padding: 10px;
}

.price {
    font-size: 18px;
    font-weight: bold;
    color: #28a745;
}

.stock {
    font-size: 14px;
    color: gray;
}

.quantity-input {
    width: 70px;
}

.footer {
    background-color: #212529;
    color: white;
    padding: 15px;
    text-align: center;
    margin-top: 50px;
}
</style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg">
  <div class="container-fluid">
    <a class="navbar-brand" href="userdashboard.jsp">FruitBox 🍎</a>
    <div class="d-flex">
      <a class="nav-link" href="cart.jsp">Cart 🛒</a>
      <a class="nav-link" href="orders.jsp">Orders 📦</a>
      <a class="nav-link" href="LogoutServlet">Logout</a>
    </div>
  </div>
</nav>

<!-- PAGE TITLE -->
<div class="container mt-4">
    <h2 class="text-center mb-4">Fresh Fruits Available 🍓🍊🍌</h2>

    <div class="row g-4">

    <%
        if (list != null && !list.isEmpty()) {
            for(FruitModel f : list) {
    %>

        <div class="col-md-3">
            <div class="card p-3 text-center">

                <img src="<%= request.getContextPath() %>/images/<%= f.getImage() %>" class="card-img-top">

                <h5 class="mt-2"><%= f.getName() %></h5>

                <p class="price">₹ <%= f.getPrice() %></p>

                <p class="stock">Stock: <%= f.getQuantity() %></p>

                <form action="AddToCartServlet" method="post">
                    <input type="hidden" name="fruitId" value="<%= f.getId() %>">
                    <input type="hidden" name="fruitName" value="<%= f.getName() %>">
                    <input type="hidden" name="price" value="<%= f.getPrice() %>">
                    <input type="hidden" name="image" value="<%= f.getImage() %>">

                    <div class="d-flex justify-content-center mb-2">
                        <input type="number" 
                               name="quantity" 
                               value="1" 
                               min="1" 
                               max="<%= f.getQuantity() %>" 
                               class="form-control quantity-input">
                    </div>

                    <button type="submit" class="btn btn-success w-100">
                        Add to Cart 🛒
                    </button>
                </form>

            </div>
        </div>

    <%
            }
        } else {
    %>

        <div class="col-12 text-center">
            <h4>No Fruits Available</h4>
        </div>

    <%
        }
    %>

    </div>
</div>

<!-- FOOTER -->
<div class="footer">
    © 2026 FruitBox | Fresh & Organic 🍉
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>