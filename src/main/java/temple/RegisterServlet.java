package temple;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");

        Connection con = null;
        PreparedStatement pst = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/templedb?useSSL=false&allowPublicKeyRetrieval=true",
                "root",
                "root"
            );

            String sql = "INSERT INTO users (name, email, mobile, password) VALUES (?, ?, ?, ?)";
            pst = con.prepareStatement(sql);

            pst.setString(1, name);
            pst.setString(2, email);
            pst.setString(3, mobile);
            pst.setString(4, password);

            int rows = pst.executeUpdate();

            response.setContentType("text/html");

            if (rows > 0) {
                response.getWriter().println("<h2>Registration Successful!</h2>");
            } else {
                response.getWriter().println("<h2>Failed to Register!</h2>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html");
            response.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}
