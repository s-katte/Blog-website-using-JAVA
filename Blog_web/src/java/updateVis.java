
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet(urlPatterns = {"/updateVis"})
public class updateVis extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        out.print(request.getParameter("id"));
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            // load driver
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Blog",
            "root", "");         // establish connection
            String id = request.getParameter("id");
            String vis = request.getParameter("vis");
            String qry = "";
            if (vis.equals("publish")){
                qry = "UPDATE `blog` SET `visibility` = '1' WHERE `blog`.`blog_id` = '"+id+"';";
            } else {
                qry = "UPDATE `blog` SET `visibility` = '0' WHERE `blog`.`blog_id` = '"+id+"';";
            }
            PreparedStatement ps = con.prepareStatement(qry);
            ps.executeUpdate();
            response.sendRedirect("pages/manage.jsp");    
            con.close();

        }catch (Exception e){
            e.printStackTrace();
            e.getMessage();
            response.sendRedirect("pages/manage.jsp");    

        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
