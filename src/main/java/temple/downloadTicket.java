package temple;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

public class downloadTicket extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String bookingId = request.getParameter("id");

        HttpSession s = request.getSession();
        String templeId = (String) s.getAttribute("temple_id");
        String date = (String) s.getAttribute("date");
        String time = (String) s.getAttribute("time_slot");
        String phone = (String) s.getAttribute("phone");
        String aadhaar = (String) s.getAttribute("aadhaar");
        String count = (String) s.getAttribute("count");

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=ticket_" + bookingId + ".pdf");

        try {
            Document doc = new Document();
            PdfWriter.getInstance(doc, response.getOutputStream());
            doc.open();

            doc.add(new Paragraph("TEMPLE BOOKING TICKET"));
            doc.add(new Paragraph("---------------------------"));
            doc.add(new Paragraph("Booking ID: " + bookingId));
            doc.add(new Paragraph("Temple ID: " + templeId));
            doc.add(new Paragraph("Date: " + date));
            doc.add(new Paragraph("Time Slot: " + time));
            doc.add(new Paragraph("Total Persons: " + count));
            doc.add(new Paragraph("Phone: " + phone));
            doc.add(new Paragraph("Aadhaar: " + aadhaar));
            doc.add(new Paragraph("---------------------------"));

            doc.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
