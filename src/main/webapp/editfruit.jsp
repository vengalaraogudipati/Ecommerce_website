<%@ page import="com.fruitbox.models.FruitModel" %>

<%
FruitModel f = (FruitModel) request.getAttribute("fruit");
%>

<!DOCTYPE html>
<html>
<head>
<title>Edit Fruit</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-5">
<div class="card shadow">

<div class="card-header bg-warning text-center">
<h4>Edit Fruit</h4>
</div>

<div class="card-body">

<form action="UpdateFruitServlet" method="post">

<input type="hidden" name="id" value="<%= f.getId() %>">

<div class="mb-3">
<label>Name</label>
<input type="text" name="name"
       value="<%= f.getName() %>"
       class="form-control" required>
</div>

<div class="mb-3">
<label>Price</label>
<input type="number" step="0.01"
       name="price"
       value="<%= f.getPrice() %>"
       class="form-control" required>
</div>

<div class="mb-3">
<label>Quantity</label>
<input type="number"
       name="quantity"
       value="<%= f.getQuantity() %>"
       class="form-control" required>
</div>

<div class="mb-3">
<label>Image</label>
<input type="text"
       name="image"
       value="<%= f.getImage() %>"
       class="form-control">
</div>

<button class="btn btn-success w-100">
Update Fruit
</button>

</form>

</div>
</div>
</div>

</body>
</html>
