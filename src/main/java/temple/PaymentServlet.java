package temple;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

public class PaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession s = request.getSession();
        s.setAttribute("temple_id", request.getParameter("temple_id"));
        s.setAttribute("date", request.getParameter("date"));
        s.setAttribute("time_slot", request.getParameter("time_slot"));
        s.setAttribute("phone", request.getParameter("phone"));
        s.setAttribute("aadhaar", request.getParameter("aadhaar"));
        s.setAttribute("count", request.getParameter("count"));
        System.out.println("COUNT FROM USER = " + request.getParameter("count"));

        // Generate booking ID
        String bookingId = "T" + System.currentTimeMillis();
        s.setAttribute("bookingId", bookingId);

        response.sendRedirect("payment.jsp");
    }
}
