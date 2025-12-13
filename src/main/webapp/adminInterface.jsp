<%
    if (!"admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<h2>Add Temple Details</h2>

<form action="AddTempleServlet" method="post">
    Temple Name: <input type="text" name="temple_name" required><br><br>
    Location: <input type="text" name="location" required><br><br>
    Timing: <input type="text" name="timing" required><br><br>
    Ticket Price: <input type="number" name="ticket_price" required><br><br>
    Description:<br>
    <textarea name="description" rows="4" cols="40"></textarea><br><br>

    <button type="submit">Save Temple</button>
</form>

<%
    if (request.getParameter("success") != null) {
%>
    <p style="color:green;">Temple details added successfully!</p>
<%
    }
%>
