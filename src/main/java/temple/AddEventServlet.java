package temple;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

public class AddEventServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String title = request.getParameter("title");
        String date = request.getParameter("date");
        String time = request.getParameter("time");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/templedb", "root", "root");

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO events (title, edate, etime) VALUES (?, ?, ?)");

            ps.setString(1, title);
            ps.setString(2, date);
            ps.setString(3, time);

            ps.executeUpdate();

            out.println("<h2>Event Added Successfully!</h2>");
            out.println("<a href='admin_add_event.html'>Add Another Event</a>");
            
            con.close();
        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}
