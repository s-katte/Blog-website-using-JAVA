<%-- 
    Document   : createBlog
    Created on : 29 Oct, 2020, 1:00:12 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String title = request.getParameter("title");%>
        <% String content = request.getParameter("content");%>
        
        <%= title %>, <%=content %>

    </body>
</html>
