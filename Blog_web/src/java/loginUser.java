
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/loginUser"})
public class loginUser extends HttpServlet {




    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user_name = request.getParameter("user_name");
        String password = request.getParameter("password");
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Blog",
            "root", "");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM user where user_name = ? and password = ?");
            ps.setString(1, user_name);
            ps.setString(2, password);
            PrintWriter out=response.getWriter();  
            
            ResultSet rs=ps.executeQuery();  
            boolean status=rs.next();
            if(status) {
                HttpSession session=request.getSession();  
                session.setAttribute("user_name",user_name);  
                response.sendRedirect("pages/home.jsp");
            } else {
                response.sendRedirect("pages/login.jsp");
            }
        } catch (Exception e) {
            response.sendRedirect("pages/login.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
