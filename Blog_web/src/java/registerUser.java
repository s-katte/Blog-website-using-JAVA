
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet(urlPatterns = {"/registerUser"})
public class registerUser extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        out.println("<!DOCTYPE html>\n" +
                    "<html>\n" +
                    "    <head>\n" +
                    "        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">"+
                    "        <title>"+ request.getParameter("user_name") + "</title>"
                +   "   </head>"
                +   "<body>");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            // load driver
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Blog",
            "root", "");         // establish connection
            String user_name = request.getParameter("user_name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String first_name = request.getParameter("first_name");
            String last_name = request.getParameter("last_name");

            PreparedStatement ps = con.prepareStatement("insert into user(user_name, email, password, first_name, last_name) values ('"+user_name+"', '"+email+"', '"+password+"', '"+first_name+"', '"+last_name+"')");
            ps.executeUpdate();
            System.out.println("INSERTED");
            response.sendRedirect("pages/login.jsp");    

            
        }catch (Exception e){
            e.printStackTrace();
            e.getMessage();
            response.sendRedirect("pages/register.jsp");    

        }
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
