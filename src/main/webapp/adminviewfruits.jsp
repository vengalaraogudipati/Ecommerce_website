<%@ page import="java.util.*,com.fruitbox.dao.*,com.fruitbox.models.*" %>

<%
String user = (String) session.getAttribute("username");

if (user == null) {
    response.sendRedirect("adminlogin.jsp");
    return;
}

FruitDAOImpl dao = new FruitDAOImpl();
List<FruitModel> fruitList = dao.getAllFruits();
%>

<!DOCTYPE html>
<html>
<head>
<title>Manage Fruits | FruitBox</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

</head>

<body class="bg-light">

<nav class="navbar navbar-dark bg-success">
    <div class="container">
        <a href="admindashboard.jsp"
           class="navbar-brand fw-bold">
            Back to Dashboard
        </a>

        <a href="addfruit.jsp"
           class="btn btn-light">
            Add Fruit
        </a>
    </div>
</nav>

<div class="container mt-4">

<div class="card shadow">
<div class="card-header bg-dark text-white">
<h5>All Fruits</h5>
</div>

<div class="card-body">

<table class="table table-bordered table-hover text-center">
<thead class="table-success">
<tr>
<th>ID</th>
<th>Name</th>
<th>Price</th>
<th>Quantity</th>
<th>Image</th>
<th>Action</th>
</tr>
</thead>

<tbody>

<%
for(FruitModel f : fruitList){
%>

<tr>
<td><%= f.getId() %></td>
<td><%= f.getName() %></td>
<td><i class='fas fa-rupee-sign'></i><%= f.getPrice() %></td>
<td><%= f.getQuantity() %></td>
<td>
    <img src="<%= request.getContextPath() %>/images/<%= f.getImage() %>"
         width="60" height="60">
</td>
<td>
<a href="EditFruitServlet?id=<%= f.getId() %>"
   class="btn btn-warning btn-sm">
   Edit
</a>

<a href="DeleteFruitServlet?id=<%= f.getId() %>"
   class="btn btn-danger btn-sm"
   onclick="return confirm('Delete this fruit?')">
   Delete
</a>
</td>
</tr>

<%
}
%>

</tbody>
</table>

</div>
</div>

</div>

</body>
</html>
