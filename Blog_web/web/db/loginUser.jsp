<%-- 
    Document   : loginUser
    Created on : 31 Oct, 2020, 2:33:49 PM
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
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String user_name = request.getParameter("user_name");
            String password = request.getParameter("password");
            String username = "";
            Integer count = 0;
        %>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/Blog" user="root" password="" />
        
        <sql:query dataSource="${snapshot}" var="result">
            SELECT user_name from user WHERE user_name = '<%= user_name %>' and password = '<%= password %>';
        </sql:query>
        <% username = result.getString(); %>
        
        <c:forEach var="row" items="${result.rows}" varStatus="loop">
            
        </c:forEach>
        <% if(count == 1) {
            username = "";
                
            session.setAttribute("username", username);
        }%>
    </body>
</html>
