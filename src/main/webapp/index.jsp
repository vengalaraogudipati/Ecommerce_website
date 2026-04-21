<%@ page import="java.util.*,com.fruitbox.dao.*,com.fruitbox.models.*" %>
<%
    FruitDAOInterface dao = new FruitDAOImpl();
    List<FruitModel> fruits = dao.getAllFruits();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FruitBox - Home</title>

<style>
body {
    margin: 0;
    font-family: Arial;
}

/* NAVBAR */
.navbar {
    background: #2ecc71;
    padding: 15px;
    display: flex;
    justify-content: space-between;
}

.navbar a {
    color: white;
    text-decoration: none;
    margin: 0 15px;
    font-weight: bold;
}

.navbar a:hover {
    color: yellow;
}

/* FRUITS GRID */
.container {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
    padding: 30px;
}

.card {
    border: 1px solid #ddd;
    border-radius: 10px;
    padding: 15px;
    text-align: center;
}

.card img {
    width: 150px;
    height: 150px;
}

.card button {
    background: #2ecc71;
    color: white;
    border: none;
    padding: 8px 15px;
    border-radius: 5px;
    cursor: pointer;
}

.card button:hover {
    background: #27ae60;
}

/* FOOTER */
.footer {
    background: #333;
    color: white;
    padding: 15px;
    text-align: center;
}

.footer a {
    color: white;
    margin: 0 10px;
    text-decoration: none;
}
</style>

</head>
<body>

<!-- NAVBAR -->
<div class="navbar">
    <div>
        <a href="index.jsp">FruitBox </a>
    </div>
    <div>
        <a href="adminlogin.jsp">Admin Login</a>
        <a href="login.jsp">User Login</a>
        <a href="register.jsp">Register</a>
    </div>
</div>

<!-- BODY -->
<h2 style="text-align:center;">Fresh Fruits Available</h2>

<div class="container">

<%
    if (fruits != null) {
        for (FruitModel f : fruits) {
%>

    <div class="card">
        <img src="images/<%= f.getImage() %>">
        <h3><%= f.getName() %></h3>
        <p> <%= f.getPrice() %></p>
        <a href="login.jsp">
            <button>Add to Cart</button>
        </a>
    </div>

<%
        }
    }
%>

</div>

<!-- FOOTER -->
<div class="footer">
    <a href="index.jsp">Home</a>
    <a href="login.jsp">Cart</a>
    <a href="login.jsp">Orders</a>
    <a href="login.jsp">Profile</a>
</div>

</body>
</html>