<h2>Make Payment</h2>

<p>Scan QR Code to Pay</p>

<img src="images/phonepe_qr.png" width="230">

<p>Amount: ₹<%= Integer.parseInt((String)session.getAttribute("count")) * 20 %></p>
<%
    String bookingId = (String) session.getAttribute("bookingId");
%>

<form action="ConfirmBookingServlet" method="post">
    <button type="submit">I Have Paid</button>
</form>
