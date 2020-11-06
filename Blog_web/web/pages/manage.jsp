<%-- 
    Document   : manage
    Created on : 27 Oct, 2020, 9:30:04 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.io.*, java.util.*, java.sql.*" %>
<%@page import="javax.servlet.http.*, javax.servlet.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog | Manage</title>
    <!-- BootStrap CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/css/bootstrap.min.css" integrity="sha384-DhY6onE6f3zzKbjUPRc2hOzGAdEf4/Dz+WJwBvEYL/lkkIsI3ihufq9hk9K4lVoK" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.bundle.min.js" integrity="sha384-BOsAfwzjNJHrJ8cZidOg56tcQWfp6y72vEJ8xQ9w6Quywb24iOsW913URv1IS4GD" crossorigin="anonymous"></script>

    <!-- Custom CSS -->
    <link rel="stylesheet" href="./css/main.css">

    <!-- FontAwesome CDN -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">

    <!-- Jquery CDN -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <script>
        $("#publish").click(function(){
            alert("Data: ");
//            $.post("demo_test_post.asp",
//            {
//              name: "Donald Duck",
//              city: "Duckburg"
//            },
//            function(data, status){
//              alert("Data: " + data + "\nStatus: " + status);
//            });
         });
    </script>
</head>
<body>
    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/Blog" user="root" password="" />
    <sql:query dataSource="${snapshot}" var="results">
        SELECT * FROM blog
    </sql:query>
        
    <nav class="navbar navbar-expand-lg navbar-dark bg-custom-gradient shadow-sm">
        <div class="container container-fluid">
            <a class="navbar-brand img-container logo py-0" href="#">
                <img src="./assets/logo.png" alt="" style="width: 4rem;">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
                    <li class="nav-item font-weight-bold">
                        <a class="nav-link" aria-current="page" href="home.jsp">Home</a>
                    </li>
                    <li class="nav-item font-weight-bold ml-lg-4">
                        <a class="nav-link active" aria-current="page" href="manage.jsp">Manage</a>
                    </li>
                    <li class="nav-item font-weight-bold ml-lg-4">
                        <div class="btn btn-primary px-0 px-lg-2">
                            Logout
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container py-5">
        <div>
            <a href="create.jsp" class="btn bg-custom-gradient">Create new</a>
        </div>
        <br>
        <table class="table align-middle rounded table-hover table-striped">
            <thead class="bg-custom-gradient">
                <tr>
                    <th class="col">#</th>
                    <th class="col-2">Date</th>
                    <th class="col-5">Title</th>
                    <th class="col-4">Manage</th>
                </tr>
            </thead>
            <tbody>
                <% Integer c = 1; %>
                <c:forEach var="row" items="${results.rows}" varStatus="loop">                    
                    <tr class="">
                        <td><%=c %></td>
                        <td>${row.created_at}</td>
                        <td>${row.title}</td>
                        <td class="d-flex flex-row justify-content-between manage-links">
                            <div class="font-weight-bold "><i class="fas fa-edit"></i>&emsp;Edit</div>
                            <c:if test= "${row.visibility == 1}">
                                <form action="../updateVis" method="POST">
                                    <input type="hidden" name="id" value="${row.blog_id}" />
                                    <input type="hidden" name="vis" value="lock" />
                                    <button type="submit" class="font-weight-bold text-primary border-0"><i class="fas fa-lock"></i>&emsp;Lock</button>
                                </form>
                            </c:if>
                            <c:if test= "${row.visibility == 0}">
                                <form action="../updateVis" method="POST">
                                    <input type="hidden" name="id" value="${row.blog_id}" />
                                    <input type="hidden" name="vis" value="publish" />
                                    <button type="submit" id="publish" class="font-weight-bold text-success border-0"><i class="fas fa-upload"></i>&emsp;Publish</button>
                                </form>
                            </c:if>
                            <form method="POST" action="../deleteBlog">
                                <input type="hidden" value="${row.blog_id}" name="id" />
                                <button class="font-weight-bold text-danger border-0"><i class="fas fa-trash-alt"></i>&emsp;Delete</button>
                            </form>
                        </td>
                    </tr>
                    <% c = c + 1; %>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <footer class="bg-custom-gradient">
        <div class="container py-3">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3">
                <div class="col">
                    <div class="img-container">
                        <img src="./assets/logo.png" alt="" class="logo" style="width: 8rem;">
                    </div>
                    <h2 class="font-weight-bold my-3">
                        Write what you love
                    </h2>
                    <h2 class="font-weight-bold my-3">
                        . . . .
                    </h2>
                </div>
                <div class="col">
                    <h2 class="font-weight-bold">
                        Quick links
                    </h2>
                    <ul>
                        <li>Home</li>
                        <li>About</li>
                        <li>Create</li>
                        <li>Contact</li>
                    </ul>
                </div>
                <div class="col">
                    <h2 class="font-weight-bold">
                        Developed by
                    </h2>
                    <ul>
                        <li>Vaibhav Saini</li>
                        <li>Anushka Gulave</li>
                        <li>Shubham Katte</li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>