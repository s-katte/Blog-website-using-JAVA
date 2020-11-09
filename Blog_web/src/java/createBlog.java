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
@WebServlet(urlPatterns = {"/createBlog"})

@MultipartConfig(maxFileSize = 16177215)
public class createBlog extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String topic = request.getParameter("topic");
        Part part = request.getPart("file");
        InputStream inputStream = part.getInputStream();
        String blogid = UUID.randomUUID().toString();
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Blog",
            "root", "");
            PreparedStatement ps = con.prepareStatement("INSERT INTO blog(blog_id, created_by, thumbnail, content, title, topic) values(?, ?, ?, ?, ?, ?)");
            ps.setString(1, blogid);
            ps.setString(2, "johndoe");
            ps.setBlob(3, inputStream);
            ps.setString(4, content);
            ps.setString(5, title);
            ps.setString(6, topic);
            
            ps.executeUpdate();
            response.sendRedirect("pages/manage.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
