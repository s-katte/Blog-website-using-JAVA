<%-- 
    Document   : register
    Created on : 27 Oct, 2020, 9:23:16 PM
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
        <title>Blog | Register</title>
    </head>
    <body>
        <div class="row h-100 mx-0">
        <div class="col-md-4 py-5 py-md-0 bg-custom-gradient d-flex flex-column justify-content-around align-items-center text-white text-center">
            <div class="logo img-container w-50">
                <img src="./assets/logo.png" alt="">
            </div>
            <h1 class="font-weight-bold">
                Hello, Blogger
            </h1>
            <div class="divider bg-white" style="width: 8rem"></div>
            <h5>
                Fill up the details and start <br> your journey with us
            </h5>
            <h6>
                - OR -
            </h6>
            <a href="#" class="btn btn-custom btn-hover btn-lg btn-custom-rounded font-weight-bold text-white">
                Log In
            </a>
        </div>
        <div class="col d-flex flex-column justify-content-around align-items-center text-custom text-center">
            <h1 class="font-weight-bold">
                Register your account
            </h1>
            <div class="divider bg-custom-solid" style="width: 8rem;"></div>
            <div class="social-login d-flex justify-content-around align-items-center w-50">
                <div class="facebook">Fb</div>
                <div class="linkedin">Li</div>
                <div class="google">G</div>
            </div>
            <h6 class="text-muted">or use your email account</h6>
            <form id="signupForm" action="./../db/registerUser.jsp" method="POST" class="w-50 text-left">
                <div class="mb-1">
                    <label for="fullname" class="form-label font-weight-bold text-dark">First Name</label>
                    <input type="text" required="" class="form-control" id="first_name" name="first_name" placeholder="John">
                </div>
                <div class="mb-1">
                    <label for="fullname" class="form-label font-weight-bold text-dark">Last Name</label>
                    <input type="text" required="" class="form-control" id="last_name" name="last_name" placeholder="Doe">
                </div>
                <div class="mb-1">
                    <label for="username" class="form-label font-weight-bold text-dark">Username</label>
                    <input type="text" required="" class="form-control" id="user_name" name="user_name" placeholder="johndoe123">
                </div>
                <div class="mb-1">
                    <label for="email" class="form-label font-weight-bold text-dark">Email</label>
                    <input type="email" required="" class="form-control" id="email" name="email" placeholder="johndoe@example.com">
                </div>
                <div class="mb-1">
                    <label for="password" class="form-label font-weight-bold text-dark">Password</label>
                    <input type="password" required="" class="form-control" id="password" name="password" placeholder="******">
                </div>
            </form>
            <button type="submit" form="signupForm" class="btn btn-custom btn-custom-rounded font-weight-bold bg-custom-gradient text-white">
                Sign Up
            </button>
        </div>
    </div>
    </body>
</html>
