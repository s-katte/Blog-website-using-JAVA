<%-- 
    Document   : blog
    Created on : 27 Oct, 2020, 9:25:36 PM
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
        <title>Blog|JSP</title>
<!-- BootStrap CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/css/bootstrap.min.css" integrity="sha384-DhY6onE6f3zzKbjUPRc2hOzGAdEf4/Dz+WJwBvEYL/lkkIsI3ihufq9hk9K4lVoK" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.bundle.min.js" integrity="sha384-BOsAfwzjNJHrJ8cZidOg56tcQWfp6y72vEJ8xQ9w6Quywb24iOsW913URv1IS4GD" crossorigin="anonymous"></script>

    <!-- Custom CSS -->
    <link rel="stylesheet" href="./css/main.css">

</head>
<body>
    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/Blog" user="root" password="" />
    <sql:query dataSource="${snapshot}" var="blogs">
        SELECT * FROM blog WHERE blog_id = '<%=request.getParameter("id")%>';
    </sql:query>
    <sql:query dataSource="${snapshot}" var="comments">
        SELECT * FROM comments WHERE comment_on = '<%=request.getParameter("id")%>' ORDER BY comment_at;
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
                        <a class="nav-link" aria-current="page" href="./manage.jsp">Manage</a>
                    </li>
                    <%
                        String name = (String)session.getAttribute("user_name");
                        if(name == null) {
                    %>
                    <li class="nav-item font-weight-bold ml-lg-4">
                        <a href="./login.jsp" class="btn btn-primary px-0 px-lg-2">
                            Login
                        </a>
                    </li>
                    <li class="nav-item font-weight-bold ml-lg-4">
                        <a href="./register.jsp" class="btn btn-primary px-0 px-lg-2">
                            Signup
                        </a>
                    </li>
                    <% } else { %>
                    <li class="nav-item font-weight-bold ml-lg-4">
                        <a href="../logoutUser" class="btn btn-primary px-0 px-lg-2">
                            Logout
                        </a>
                    </li>
                    <% } %>
                </ul>
            </div>
        </div>
    </nav>
    <c:forEach var="blog" items="${blogs.rows}" varStatus="loop">
    <div class="container">
        <div class="img-container text-center">
            <img src="./displayImg.jsp?id=${blog.blog_id}" alt="" style="width: 40rem">
        </div>
        <h1 class="font-weight-bold my-5 text-center">
            ${blog.title}
        </h1>
        <div class="d-flex justify-content-between">
            <h5 class="text-muted font-weight-bold">
                ${blog.created_at}
            </h5>
            <h5 class="text-muted font-weight-bold">
                - ${blog.created_by}
        </div>
        <div class="text-justify">
            ${blog.content}
        </div>
        <h2 class="font-weight-bold text-left my-5">
            Comments
        </h2>
        <%
            name = (String)session.getAttribute("user_name");
            if(name != null) {
        %>
        <div class="card shadow-custom-lg mb-3">
            <div class="card-body">
                <form id="commentForm" action="../addComment" class="text-left bg-light p-3 rounded">
                    <div class="input-group">
                        <textarea  name="comment" type="text" class="form-control" placeholder="Add your comments"></textarea>
                    </div>
                    <input type="hidden" name="user" value="<%=name%>">
                    <input type="hidden" name="blog_id" value="<%=request.getParameter("id")%>">
                    <div class="text-right mt-3">
                        <input class="btn bg-custom-gradient" type="submit" value="Add comment">
                    </div>
                </form>
            </div>
        </div>
        <% } %>
<!--        <div class="card shadow-custom-lg mb-3">
            <div class="card-body p-4">
                <div class="d-flex justify-content-between">
                    <h4 class="font-weight-bold">John Doe</h4>
                    <div class="text-muted">22nd Oct, 2020</div>
                </div>
                <div class="text-justify">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam iste excepturi quisquam quo autem quis, iure perferendis tenetur ut voluptatem tempore non laudantium hic aliquid obcaecati consectetur sequi. Dolorem corporis, ducimus odit non perspiciatis ipsa molestiae delectus assumenda nihil nisi excepturi repellat, deserunt ut fuga voluptatibus. Illum facilis cum saepe, iusto voluptatem ducimus, quaerat pariatur non, suscipit quas vero libero voluptas consectetur nihil hic magni eos tempore vel impedit eveniet ad deleniti. Et repellat excepturi vel harum, nostrum placeat hic mollitia praesentium laudantium nemo nobis quisquam sapiente obcaecati, repudiandae, ipsam ullam! Quae cum pariatur assumenda soluta tempore reiciendis sapiente quia.
                </div>
                <div class="reply">
                    <div class="d-flex justify-content-between">
                        <h4 class="font-weight-bold">John Doe</h4>
                        <div class="text-muted">22nd Oct, 2020</div>
                    </div>
                    <div class="text-justify">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam iste excepturi quisquam quo autem quis, iure perferendis tenetur ut voluptatem tempore non laudantium hic aliquid obcaecati consectetur sequi. Dolorem corporis, ducimus odit non perspiciatis ipsa molestiae delectus assumenda nihil nisi excepturi repellat, deserunt ut fuga voluptatibus. Illum facilis cum saepe, iusto voluptatem ducimus, quaerat pariatur non, suscipit quas vero libero voluptas consectetur nihil hic magni eos tempore vel impedit eveniet ad deleniti. Et repellat excepturi vel harum, nostrum placeat hic mollitia praesentium laudantium nemo nobis quisquam sapiente obcaecati, repudiandae, ipsam ullam! Quae cum pariatur assumenda soluta tempore reiciendis sapiente quia.
                    </div>
                    <div class="reply">
                        <div class="d-flex justify-content-between">
                            <h4 class="font-weight-bold">John Doe</h4>
                            <div class="text-muted">22nd Oct, 2020</div>
                        </div>
                        <div class="text-justify">
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam iste excepturi quisquam quo autem quis, iure perferendis tenetur ut voluptatem tempore non laudantium hic aliquid obcaecati consectetur sequi. Dolorem corporis, ducimus odit non perspiciatis ipsa molestiae delectus assumenda nihil nisi excepturi repellat, deserunt ut fuga voluptatibus. Illum facilis cum saepe, iusto voluptatem ducimus, quaerat pariatur non, suscipit quas vero libero voluptas consectetur nihil hic magni eos tempore vel impedit eveniet ad deleniti. Et repellat excepturi vel harum, nostrum placeat hic mollitia praesentium laudantium nemo nobis quisquam sapiente obcaecati, repudiandae, ipsam ullam! Quae cum pariatur assumenda soluta tempore reiciendis sapiente quia.
                        </div>
                    </div>
                </div>
            </div>
        </div>-->
        <c:forEach var="comment" items="${comments.rows}" varStatus="loop">
            <div class="card shadow-custom-lg mb-3">
                <div class="card-body p-4">
                    <div class="d-flex justify-content-between">
                        <h4 class="font-weight-bold">${comment.comment_by}</h4>
                        <div class="text-muted">${comment.comment_at}</div>
                    </div>
                    <div class="text-justify">
                        ${comment.comment}
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    </c:forEach>
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
