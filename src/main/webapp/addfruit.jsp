<%@ page import="com.fruitbox.models.AdminLoginModel" %>
<%
String user = (String)session.getAttribute("username");

if (user == null) {
    response.sendRedirect("adminlogin.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Add Fruit</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow">
        <div class="card-header bg-success text-white text-center">
            <h4>Add New Fruit</h4>
        </div>

        <div class="card-body">
            <form action="AddFruitServlet" method="post">

                <div class="mb-3">
                    <label>Fruit Name</label>
                    <input type="text" name="name" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label>Price</label>
                    <input type="number" name="price" step="0.01" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label>Quantity</label>
                    <input type="number" name="quantity" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label>Image File Name</label>
                    <input type="text" name="image" class="form-control" placeholder="apple.jpg">
                </div>

                <button class="btn btn-success w-100">Add Fruit</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>
