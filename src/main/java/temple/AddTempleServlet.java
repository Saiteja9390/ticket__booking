package temple;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

public class AddTempleServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("temple_name");
        String location = request.getParameter("location");
        String timing = request.getParameter("timing");
        String price = request.getParameter("ticket_price");
        String description = request.getParameter("description");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/templedb", "root", "root"
            );

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO temples (temple_name, location, timing, ticket_price, description) VALUES (?, ?, ?, ?, ?)"
            );

            ps.setString(1, name);
            ps.setString(2, location);
            ps.setString(3, timing);
            ps.setString(4, price);
            ps.setString(5, description);

            ps.executeUpdate();
            response.sendRedirect("adminInterface.jsp?success=1");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
