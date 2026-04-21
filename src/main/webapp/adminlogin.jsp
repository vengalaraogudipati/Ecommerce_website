<%
    String user = (String) session.getAttribute("username");
    if(user != null){
        response.sendRedirect("admindashboard.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Login | FruitBox</title>

<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- FontAwesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

<style>
body {
    height: 100vh;
    background: linear-gradient(135deg, #28a745, #155724);
    display: flex;
    justify-content: center;
    align-items: center;
    font-family: Arial, sans-serif;
}

/* Glass Card */
.login-card {
    background: rgba(255, 255, 255, 0.15);
    backdrop-filter: blur(10px);
    border-radius: 20px;
    padding: 40px;
    width: 350px;
    color: white;
    box-shadow: 0 8px 30px rgba(0,0,0,0.3);
    transition: 0.3s;
}

.login-card:hover {
    transform: translateY(-5px);
}

/* Inputs */
.form-control {
    border-radius: 30px;
    padding-left: 40px;
}

.input-icon {
    position: relative;
}

.input-icon i {
    position: absolute;
    top: 10px;
    left: 15px;
    color: gray;
}

/* Button */
.btn-custom {
    border-radius: 30px;
    font-weight: bold;
}
</style>

</head>
<body>

<div class="login-card text-center">

    <h3 class="mb-4">FruitBox Admin</h3>

    <form action="AdminLoginServlet" method="post">

        <div class="mb-3 input-icon">
            <i class="fas fa-user"></i>
            <input type="text" name="username" class="form-control" placeholder="Username" required>
        </div>

        <div class="mb-3 input-icon">
            <i class="fas fa-lock"></i>
            <input type="password" name="password" class="form-control" placeholder="Password" required>
        </div>

        <button type="submit" class="btn btn-warning w-100 btn-custom">
            Login
        </button>
    </form>

    <p class="text-danger mt-3">
        <%= request.getAttribute("msg") == null ? "" : request.getAttribute("msg") %>
    </p>

</div>

</body>
</html>