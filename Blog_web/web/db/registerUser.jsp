<%-- 
    Document   : registerUser
    Created on : 28 Oct, 2020, 3:13:48 PM
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
        <title>Register user</title>
    </head>
    <body>
        
        <% String first_name = request.getParameter("first_name"); %>
        <% String last_name = request.getParameter("last_name"); %>
        <% String user_name = request.getParameter("user_name"); %>
        <% String password = request.getParameter("password"); %>
        <% String email = request.getParameter("email"); %>
        <% System.out.println(request.getParameterNames()); %>
        
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/Blog" user="root" password="" />
        
        <sql:update dataSource="${snapshot}" var="result">
            INSERT INTO user (user_name, email, password, first_name, last_name) values ('<%=user_name%>', '<%=email%>', '<%=password%>', '<%=first_name%>', '<%=last_name%>');
        </sql:update>
           
            <p>Inserted Successfully</p>
            Return to <a href="./../pages/register.jsp" class="btn btn-primary font-weight-bold">Home Page </a>
    </body>
</html>
