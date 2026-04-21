<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,com.fruitbox.dao.*,com.fruitbox.models.*" %>

<%
    String username = (String) session.getAttribute("username");

    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    OrderDAOInterface dao = new OrderDAOImpl();
    List<OrderModel> list = dao.getOrdersByUsername(username);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders</title>

<style>
body {
    font-family: Arial;
}

table {
    border-collapse: collapse;
    width: 90%;
}

th, td {
    padding: 10px;
    text-align: center;
}

th {
    background-color: #4CAF50;
    color: white;
}

img {
    border-radius: 10px;
}

h2 {
    color: #333;
}
</style>

</head>
<body>

<h2>My Orders 🛒</h2>

<table border="1">

<tr>
    <th>Image</th>
    <th>Fruit Name</th>
    <th>Price (₹)</th>
    <th>Quantity</th>
    <th>Total (₹)</th>
    <th>Status</th>
    <th>Order Date</th>
</tr>

<%
    if (list != null && !list.isEmpty()) {

        for (OrderModel o : list) {
%>

<tr>
    <td>
        <img src="<%= request.getContextPath() %>/images/<%= o.getImage() %>" 
             width="80" height="80">
    </td>

    <td><%= o.getFruitName() %></td>
    <td>₹ <%= o.getPrice() %></td>
    <td><%= o.getQuantity() %></td>
    <td>₹ <%= o.getTotal() %></td>
    <td><%= o.getStatus() %></td>
    <td><%= o.getOrderDate() %></td>
    <td>
    <a href="CancelOrderServlet?id=<%= o.getId() %>" 
       onclick="return confirm('Are you sure to cancel?')">
       Cancel
    </a>
</td>
</tr>

<%
        }

    } else {
%>

<tr>
    <td colspan="7">No Orders Found</td>
</tr>

<%
    }
%>

</table>

<br>
<a href="viewfruits.jsp">Back to Fruits</a>

</body>
</html>