<%
    String bookingId = request.getParameter("id");
%>

<h2>Payment Confirmed!</h2>
<p>Your ticket is being generated...</p>

<script>
    setTimeout(() => {
        window.location.href = "downloadTicket?id=<%= bookingId %>";
    }, 2000);
</script>
