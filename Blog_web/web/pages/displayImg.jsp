<%-- 
    Document   : displayImg
    Created on : 8 Nov, 2020, 2:48:05 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import = "java.sql.*" %>
<%@ page import="java.io.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
                    Blob image = null;
                    Connection con = null;
                    byte[] imgData = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Blog", "root", "");
                        stmt = con.createStatement();
                        rs = stmt.executeQuery("SELECT thumbnail from blog where blog_id = '"+ id+"'");
                        if(rs.next()){
                            image = rs.getBlob(1);
                            imgData = image.getBytes(1, (int)image.length());
                        }else {
                            out.println("not found");
                            return;
                        }
                        
                        response.setContentType("image/gif");
                        OutputStream o = response.getOutputStream();
                        o.write(imgData);
                        o.flush();
                        o.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                        return;
                    } 
                    
                %>
    </body>
</html>
