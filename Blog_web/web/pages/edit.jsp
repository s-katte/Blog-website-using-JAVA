<%-- 
    Document   : uploadT
    Created on : 30 Oct, 2020, 8:47:07 AM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.io.*, java.util.*, java.sql.*" %>
<%@page import="javax.servlet.http.*, javax.servlet.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page import = "java.sql.*" %>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit | Blog</title>

    <!-- BootStrap CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/css/bootstrap.min.css" integrity="sha384-DhY6onE6f3zzKbjUPRc2hOzGAdEf4/Dz+WJwBvEYL/lkkIsI3ihufq9hk9K4lVoK" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.bundle.min.js" integrity="sha384-BOsAfwzjNJHrJ8cZidOg56tcQWfp6y72vEJ8xQ9w6Quywb24iOsW913URv1IS4GD" crossorigin="anonymous"></script>

    <!-- Custom CSS -->
    <link rel="stylesheet" href="   ./css/main.css">

    <!-- FontAwesome CDN -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">

</head>
<body>


    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/Blog" user="root" password="" />
    <sql:query dataSource="${snapshot}" var="topics">
        SELECT * FROM topic
    </sql:query>
    <sql:query dataSource="${snapshot}" var="results">
        SELECT * FROM topic
    </sql:query>
    <% String id = request.getParameter("id"); %>
    <sql:query dataSource="${snapshot}" var="blog">
        SELECT * FROM blog WHERE blog.blog_id = '<%= id %>'
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
                        <a class="nav-link" aria-current="page" href="./home.jsp">Home</a>
                    </li>
                    <li class="nav-item font-weight-bold ml-lg-4">
                        <a class="nav-link active" aria-current="page" href="./manage.jsp">Manage</a>
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
        <c:forEach var="bl" items="${blog.rows}" varStatus="loop">
            <form method="POST" id="createForm" enctype="multipart/form-data" action="../editBlog" class="w-100 text-left">
                <div class="mb-4">
                    <h5><label for="Title" class="form-label font-weight-bold text-dark">Title</label></h5>
                    <input value="${bl.title}" name="title" type="text" class="form-control" id="title" placeholder="Enter blog title here">
                </div>
                <div class="mb-4">
                    <h5><label for="content" class="form-label font-weight-bold text-dark">Content</label></h5>
                    <textarea name="content" type="text" class="form-control" rows="10" id="content" placeholder="Enter blog content here">${bl.content}</textarea>
                </div>
                <div class="form-file">
                    <input type="file" name="nfile" class="form-file-input" id="customFile">
                    <label class="form-file-label" for="customFile">
                        <span class="form-file-text">Choose file...</span>
                        <span class="form-file-button">Browse</span>
                    </label>
                </div>
                <img src="./displayImg.jsp?id=${bl.blog_id}" />
                <div class="mb-4">
                    <select name="topic" id="">
                        <option selected disabled style="display: none;">Select Topic</option>
                        <c:forEach var="row" items="${results.rows}" varStatus="loop">
                            <option value="${row.name}">${row.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <input type="hidden" value="<%= id%>" name="id" />
                <div class="mt-3">
                    <button type="submit" form="createForm" class="btn bg-custom-gradient">Save</button>
                </div>
            </form>
        </c:forEach>
    </div>
    <footer class="bg-custom-gradient">
        <div class="container py-3">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3">
                <div class="col">
                    <div class="img-container">
                        <img src="../assets/logo.png" alt="" class="logo" style="width: 8rem;">
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