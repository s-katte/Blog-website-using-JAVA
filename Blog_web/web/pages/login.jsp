<%-- 
    Document   : login
    Created on : 27 Oct, 2020, 9:11:40 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <!-- BootStrap CDN -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/css/bootstrap.min.css" integrity="sha384-DhY6onE6f3zzKbjUPRc2hOzGAdEf4/Dz+WJwBvEYL/lkkIsI3ihufq9hk9K4lVoK" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.bundle.min.js" integrity="sha384-BOsAfwzjNJHrJ8cZidOg56tcQWfp6y72vEJ8xQ9w6Quywb24iOsW913URv1IS4GD" crossorigin="anonymous"></script>

        <!-- Custom CSS -->
        <link rel="stylesheet" href="./css/main.css">
        <title>Blog | Login</title>
    </head>
    <body>
        <%
            String name = (String)session.getAttribute("user_name");
            if(name != null) {
                response.sendRedirect("./home.jsp");
            }
        %>
        <div class="row h-100 mx-0">
        <div class="col d-flex flex-column justify-content-around align-items-center text-custom text-center">
            <h1 class="font-weight-bold">
                Login to your account
            </h1>
            <div class="divider bg-custom-solid" style="width: 8rem;"></div>
            <div class="social-login d-flex justify-content-around align-items-center w-50">
                <div class="facebook">Fb</div>
                <div class="linkedin">Li</div>
                <div class="google">G</div>
            </div>
            <h6 class="text-muted">or use your email account</h6>
            <form id="loginForm" action="../loginUser" method="POST" class="w-50 text-left">
                <div class="mb-1">
                    <label for="user_name" class="form-label font-weight-bold text-dark">Username</label>
                    <input name="user_name" type="text" class="form-control" id="username" placeholder="johndoe123">
                </div>
                <div class="mb-1">
                    <label for="password" class="form-label font-weight-bold text-dark">Password</label>
                    <input name="password" type="password" class="form-control" id="password" placeholder="******">
                </div>
            </form>
            <button type="submit" form="loginForm" class="btn btn-custom btn-custom-rounded font-weight-bold bg-custom-gradient text-white">
                Log In
            </button>
        </div>
        <div class="col-md-4 py-5 py-md-0 bg-custom-gradient d-flex flex-column justify-content-around align-items-center text-white text-center">
            <div class="logo img-container w-50">
                <img src="./assets/logo.png" alt="">
            </div>
            <h1 class="font-weight-bold">
                Welcome back,
            </h1>
            <div class="divider bg-white" style="width: 8rem"></div>
            <h5>
                To keep blogging, login <br> with your account
            </h5>
            <h6>
                - OR -
            </h6>
            <a href="./register.jsp" class="btn btn-custom btn-hover btn-lg btn-custom-rounded font-weight-bold text-white">
                Sign Up
            </a>
        </div>
    </div>
    </body>
</html>
