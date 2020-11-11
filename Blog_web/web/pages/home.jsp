<%-- 
    Document   : home
    Created on : 27 Oct, 2020, 9:28:57 PM
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
        <title>Blog | Home</title>
    <!-- BootStrap CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/css/bootstrap.min.css" integrity="sha384-DhY6onE6f3zzKbjUPRc2hOzGAdEf4/Dz+WJwBvEYL/lkkIsI3ihufq9hk9K4lVoK" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.bundle.min.js" integrity="sha384-BOsAfwzjNJHrJ8cZidOg56tcQWfp6y72vEJ8xQ9w6Quywb24iOsW913URv1IS4GD" crossorigin="anonymous"></script>

    <!-- JQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    
    <!-- Owl Carousel -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g==" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw==" crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw==" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function() {
            $("#owl-example").owlCarousel({
                items : 3,
                margin: 50,
                loop: true,
                autoplay: true,
                autoplayTimeout: 3000,
                autoplayHoverPause: true,
                responsive : {
                    0 : { items : 1 }, // breakpoint from 0 up
                    430 : { items : 2 }, // breakpoint from 768 up
                    900 : { items : 3 } // breakpoint from 768 up
                }
            });
        });
    </script>

    <!-- Custom CSS -->
    <link rel="stylesheet" href="./css/main.css">

</head>
<body>
    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/Blog" user="root" password="" />
    <sql:query dataSource="${snapshot}" var="topics">
        SELECT * FROM topic
    </sql:query>
    <sql:query dataSource="${snapshot}" var="blogs">
        SELECT * FROM blog ORDER BY created_at DESC;
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
                        <a class="nav-link active" aria-current="page" href="./home.jsp">Home</a>
                    </li>
                    <li class="nav-item font-weight-bold ml-lg-4">
                        <a class="nav-link" aria-current="page" href="./manage.jsp">Manage</a>
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
        <h3 class="font-weight-bold mb-5">
            Trending Topics
        </h3>
        
        <div id="owl-example" class="owl-carousel">
            <c:forEach var="blog" items="${blogs.rows}" varStatus="loop">
                <div class="card shadow-custom-lg border-0 px-0 mb-5">
                    <a href="./blog.jsp?id=${blog.blog_id}">
                        <img src="./displayImg.jsp?id=${blog.blog_id}" alt="" class="card-img-top">
                    </a>
                    <div class="card-body">
                        <small class="text-muted font-weight-bold">
                            ${blog.topic}
                        </small>
                        <h4 class="font-weight-bold my-2">
                            ${blog.title}
                        </h4>
                            <small class="font-weight-bold">- <i>${blog.created_by}</i> </small>
                            
                            <span class="mr-0">${blog.created_at}</span>
                    </div>
                </div>
            </c:forEach>
        </div>
        <% if(request.getParameter("search_qry") != "" && request.getParameter("search_qry") != null){ %>
            <sql:query dataSource="${snapshot}" var="blogs">
                SELECT * FROM blog WHERE topic like '%<%= request.getParameter("search_qry") %>%' or title like '%<%= request.getParameter("search_qry") %>%' or content like '%<%= request.getParameter("search_qry") %>%' ORDER BY created_at DESC;
            </sql:query>
        <% } %>
        <h3 class="font-weight-bold mb-5">
            Recent Blog Posts
        </h3>
        
        <div class="row">
            <div class="col-md-8">
                <c:forEach var="blog" items="${blogs.rows}" varStatus="loop">
                    <div class="card border-0 shadow-custom-lg mt-3">
                        <div class="row">
                            <div class="col-md-4 img-container">
                                <img src="./displayImg.jsp?id=${blog.blog_id}" alt="">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <small class="text-muted font-weight-bold">
                                        ${blog.topic}
                                    </small>
                                    <h4 class="font-weight-bold my-2">
                                        ${blog.title}
                                    </h4>
                                    <p class="text-justify" style="width: 50ch; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
                                        ${blog.content}
                                    </p>
                                    <div class="text-right">
                                        <a href="./blog.jsp?id=${blog.blog_id}" class="btn bg-custom-gradient">Read More</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                
            </div>
            <div class="col-md-4">
                <form id="searchForm" action="" class="text-left bg-custom-light p-3 rounded">
                    <h3 class="text-custom font-weight-bold mt-1">
                        Search
                    </h3>
                    <div class="input-group">
                        <input type="text" class="form-control" name="search_qry" placeholder="Find your interests">
                        <div class="input-group-btn">
                            <button class="btn btn-default" type="submit">
                              search
                            </button>
                        </div>
                    </div>
                </form>
                <div class="bg-custom-light p-3 mt-3 rounded topic-container">
                    <!--<div class="bg-light rounded p-2 text-dark font-weight-bold">Topic 1</div>-->
                    <c:forEach var="row" items="${topics.rows}" varStatus="loop">
                        <div class="bg-light rounded p-2 text-dark font-weight-bold mt-3">${row.name}</div>
                    </c:forEach>
                </div>
            </div>
        </div>
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