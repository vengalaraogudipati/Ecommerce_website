<%@ page import="com.fruitbox.models.AdminLoginModel" %>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    String user = (String) session.getAttribute("username");

    if(user == null){
        response.sendRedirect("adminlogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard | FruitBox</title>

<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- FontAwesome Icons -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

<style>
body {
    background-color: #f4f6f9;
}

/* Navbar */
.navbar {
    background: linear-gradient(45deg, #28a745, #1e7e34);
}

/* Sidebar */
.sidebar {
    height: 100vh;
    background-color: #212529;
    padding-top: 20px;
}

.sidebar a {
    color: white;
    display: block;
    padding: 12px 20px;
    text-decoration: none;
    transition: 0.3s;
}

.sidebar a:hover {
    background-color: #28a745;
}

/* Dashboard Cards */
.card {
    border-radius: 15px;
    transition: 0.3s;
}

.card:hover {
    transform: translateY(-8px);
    box-shadow: 0 8px 25px rgba(0,0,0,0.2);
}

.icon {
    font-size: 40px;
    margin-bottom: 15px;
}
</style>

</head>

<body>

<!-- TOP NAVBAR -->
<nav class="navbar navbar-dark">
    <div class="container-fluid">
        <span class="navbar-brand fw-bold">FruitBox Admin Panel</span>
        <a href="<%= request.getContextPath() %>/adminlogout.jsp"
           class="btn btn-danger">Logout</a>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">

        <!-- SIDEBAR -->
        <div class="col-md-2 sidebar">
            <a href="#"> Dashboard</a>
            <a href="<%= request.getContextPath() %>/adminviewfruits.jsp"> Manage Fruits</a>
            <a href="<%= request.getContextPath() %>/addfruit.jsp"> Add Fruit</a>
            <a href="#">Manage Orders</a>
            <a href="#">Users</a>
        </div>

        <!-- MAIN CONTENT -->
        <div class="col-md-10 p-5">

            <h3 class="mb-4">Welcome Admin 👑</h3>

            <div class="row text-center">

                <div class="col-md-4 mb-4">
                    <div class="card shadow p-4">
                        <i class="fas fa-apple-alt text-success icon"></i>
                        <h5>Manage Fruits</h5>
                        <p>Update or delete fruits</p>
                        <a href="<%= request.getContextPath() %>/adminviewfruits.jsp"
                           class="btn btn-success">Open</a>
                    </div>
                </div>

                <div class="col-md-4 mb-4">
                    <div class="card shadow p-4">
                        <i class="fas fa-plus-circle text-warning icon"></i>
                        <h5>Add New Fruit</h5>
                        <p>Add fresh stock</p>
                        <a href="<%= request.getContextPath() %>/addfruit.jsp"
                           class="btn btn-warning">Add Fruit</a>
                    </div>
                </div>

                <div class="col-md-4 mb-4">
                    <div class="card shadow p-4">
                        <i class="fas fa-box text-primary icon"></i>
                        <h5>Manage Orders</h5>
                        <p>Track & control orders</p>
                        <a href="#" class="btn btn-primary">View Orders</a>
                    </div>
                </div>

            </div>

        </div>

    </div>
</div>

</body>
</html>