<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    if(id == null){
        out.println("Invalid Ticket");
        return;
    }

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/templedb", "root", "root"
    );

    PreparedStatement ps = con.prepareStatement(
        "SELECT b.*, t.temple_name FROM bookings b JOIN temples t ON b.temple_id = t.id WHERE b.id=?"
    );
    ps.setString(1, id);
    ResultSet rs = ps.executeQuery();

    if(!rs.next()) {
        out.println("Booking Not Found");
        return;
    }
%>

<h2>Ticket Download</h2>
<p><b>Booking ID:</b> <%= id %></p>
<p><b>Temple:</b> <%= rs.getString("temple_name") %></p>
<p><b>Date:</b> <%= rs.getString("date") %></p>
<p><b>Tickets:</b> <%= rs.getString("count") %></p>

<button onclick="window.print()">Download Ticket (PDF)</button>
