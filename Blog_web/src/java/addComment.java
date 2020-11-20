

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.UUID;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/addComment"})
public class addComment extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String user = request.getParameter("user");
        String blog_id = request.getParameter("blog_id");
        String comment = request.getParameter("comment");
        String comment_id = UUID.randomUUID().toString();
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Blog",
            "root", "");
            PreparedStatement ps = con.prepareStatement("INSERT INTO comments(comment_id, comment_by, comment_on, comment) values(?, ?, ?, ?)");
            ps.setString(1, comment_id);
            ps.setString(2, user);
            ps.setString(3, blog_id);
            ps.setString(4, comment);
            PrintWriter out=response.getWriter();  
            
            ps.executeUpdate();
            response.sendRedirect("pages/blog.jsp?id="+blog_id);
        } catch (Exception e) {
            response.sendRedirect("pages/login.jsp");
        }
    }

}
