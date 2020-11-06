

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet(urlPatterns = {"/deleteBlog"})
public class deleteBlog extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            Class.forName("com.mysql.jdbc.Driver");
            // load driver
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Blog",
            "root", "");         // establish connection
            String id = request.getParameter("id");
            PreparedStatement ps = con.prepareStatement("DELETE FROM `blog` WHERE `blog`.`blog_id` = '"+id+"'");
            ps.executeUpdate();
            response.sendRedirect("pages/manage.jsp");    
            con.close();

        }catch (Exception e){
            e.printStackTrace();
            e.getMessage();
            response.sendRedirect("pages/manage.jsp");    

        }
    }

}
