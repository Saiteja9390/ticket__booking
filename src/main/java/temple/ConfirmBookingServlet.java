package temple;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

public class ConfirmBookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession s = req.getSession();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/templedb","root","root"
            );

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO bookings (user_email, temple_id, date, count) VALUES (?, ?, ?, ?)",
                 Statement.RETURN_GENERATED_KEYS
            );
            ps.setString(1, (String)s.getAttribute("email"));
            ps.setString(2, (String)s.getAttribute("temple_id"));
            ps.setString(3, (String)s.getAttribute("date"));
            ps.setString(4, (String)s.getAttribute("count"));

            ps.executeUpdate();
            ResultSet keys = ps.getGeneratedKeys();
            keys.next();
            int bookingId = keys.getInt(1);

            resp.sendRedirect("generateTicket.jsp?id=" + bookingId);

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}
