import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.sql.*;
import javax.servlet.http.HttpSession;
import java.util.UUID; 

/**
 *
 * @author root
 */
@MultipartConfig(maxFileSize = 16177215)
@WebServlet(urlPatterns = {"/editBlog"})
public class editBlog extends HttpServlet 
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                PrintWriter out = response.getWriter();
                out.print("ID:"+request.getParameter("id"));
                out.println("TITLE: "+request.getParameter("title"));
                out.println("CONTENT: "+request.getParameter("content"));
                out.println("TOPIC: "+request.getParameter("topic"));
                out.println("FILE: "+request.getPart("nfile").getSize());
                
                String qry = "";
                InputStream inputStream = null;
                
                if(request.getParameter("title") != null) {
                    qry += "`title` = '"+request.getParameter("title")+"',";
                }
                if(request.getParameter("content") != null) {
                    qry += "`content` = '"+request.getParameter("content")+"'";
                }
                if(request.getParameter("topic") != null) {
                    qry += ", `topic` = '"+request.getParameter("topic")+"'";
                }
                if(request.getPart("nfile").getSize() > 0){
                    Part part = request.getPart("nfile");
                    inputStream = part.getInputStream();
                } 
                String blogid = UUID.randomUUID().toString();
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Blog",
                    "root", "");
                    PreparedStatement ps = con.prepareStatement("UPDATE");
                    if(request.getPart("nfile").getSize() > 0){
                        out.println("F"+request.getPart("nfile"));
                        ps = con.prepareStatement("UPDATE `blog` SET "+qry+", `thumbnail` = ? WHERE blog.blog_id = '"+request.getParameter("id")+"';");     
                        ps.setBlob(1, inputStream);
                    }else {
                        out.println("UPDATE `blog` SET "+qry+" WHERE blog.blog_id = '"+request.getParameter("id")+"';");
                        ps = con.prepareStatement("UPDATE `blog` SET "+qry+" WHERE blog.blog_id = '"+request.getParameter("id")+"';");
                    }
                    ps.executeUpdate();
                    out.println("DONE");
                    response.sendRedirect("pages/manage.jsp");
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("nn");
                    out.println(e);
                }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
