<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,com.fruitbox.dao.*,com.fruitbox.models.*" %>

<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String username = (String) session.getAttribute("username");
    CartDAOImpl dao = new CartDAOImpl();
    List<CartModel> list = dao.getCartByUser(username);

    double total = 0;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Cart</title>

<style>
body { font-family: Arial; }
table { border-collapse: collapse; width: 80%; }
th, td { padding: 10px; text-align: center; }
th { background-color: #4CAF50; color: white; }
img { border-radius: 8px; }
button {
    padding: 8px 15px;
    background-color: green;
    color: white;
    border: none;
    cursor: pointer;
}
</style>
</head>

<body>

<h2>My Cart</h2>

<%
if (list != null && !list.isEmpty()) {
%>

<table border="1">
<tr>
    <th>Image</th>
    <th>Fruit</th>
    <th>Price</th>
    <th>Qty</th>
    <th>Sub Total</th>
    <th>Action</th>
</tr>

<%
    for (CartModel c : list) {
        double sub = c.getPrice() * c.getQuantity();
        total += sub;
%>

<tr>
    <td>
        <img src="<%= request.getContextPath() %>/images/<%= c.getImage() %>" width="70" height="70">
    </td>
    <td><%= c.getFruitName() %></td>
    <td>₹ <%= c.getPrice() %></td>
    <td><%= c.getQuantity() %></td>
    <td>₹ <%= sub %></td>
    <td>
        <a href="RemoveFromCartServlet?id=<%= c.getId() %>">Remove</a>
    </td>
</tr>

<%
    }
%>

<tr>
    <td colspan="4"><b>Total</b></td>
    <td colspan="2"><b>₹ <%= total %></b></td>
</tr>

</table>

<br>

<form action="PlaceOrderServlet" method="post">
    <button type="submit">Place Order</button>
</form>

<%
} else {
%>

<h3>Your Cart is Empty 🛒</h3>

<%
}
%>

<br>
<a href="viewfruits.jsp">Continue Shopping</a>

</body>
</html>