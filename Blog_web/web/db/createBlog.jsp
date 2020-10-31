<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<%@page import="java.io.*, java.util.*, java.sql.*" %>
<%@page import="javax.servlet.http.*, javax.servlet.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<% String title = request.getParameter("title"); %>
<% String content = request.getParameter("content"); %>
<% String topic = request.getParameter("topic"); %>
<% String uniqueID = UUID.randomUUID().toString(); %>


<%
    
    File file ;
    int maxFileSize = 5000 * 1024;
    int maxMemSize = 5000 * 1024;
    String filePath = "/blog_thumbs/";
    String contentType = request.getContentType();
    if(contentType.indexOf("application/x-www-form-urlencoded") > -1){
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(maxMemSize);
        factory.setRepository(new File("/blog_thumbs/"));
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setSizeMax( maxFileSize );
        try{
            List fileItems = upload.parseRequest(request);
            Iterator i = fileItems.iterator();
            while ( i.hasNext () )
            {
                System.out.println(i.toString());
                FileItem fi = (FileItem)i.next();
                if ( !fi.isFormField () ) {
                    String fieldName = fi.getFieldName();
                    String fileName = fi.getName();
                    boolean isInMemory = fi.isInMemory();
                    long sizeInBytes = fi.getSize();
                    file = new File( filePath + "fname.png") ;
                    fi.write( file ) ;
                    out.println("Uploaded Filename: " + filePath + fileName + "<br>");
                }
            }
        }catch(Exception ex) {
            System.out.println(ex);
        }
    } else {
        System.out.println("ERROR");
    }
%>

'<%= uniqueID %>', 'user_name', 'fname.png', <%=content %>, <%=title %>, <%=topic %>