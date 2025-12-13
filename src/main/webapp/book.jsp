<%@ page import="java.sql.*" %>
<%
    // Get temple ID from URL
    String templeId = request.getParameter("id");

    if (templeId == null) {
        out.println("<h2 style='color:red'>Invalid Temple Selection!</h2>");
        return;
    }

    // Fetch temple details from DB
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/templedb", "root", "root"
    );

    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM temples WHERE id=?"
    );
    ps.setString(1, templeId);
    ResultSet rs = ps.executeQuery();

    if (!rs.next()) {
        out.println("<h2 style='color:red'>Temple not found!</h2>");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Book Ticket</title>

    <style>
        body {
            background: #f4f4f4;
            font-family: Arial;
        }
        .container {
            width: 480px;
            margin: auto;
            background: white;
            padding: 20px;
            margin-top: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 12px rgba(0,0,0,0.2);
        }
        h2 { 
            text-align: center;
            color: #4A2C91;
        }
        label {
            font-weight: bold;
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border-radius: 5px;
            border: 1px solid gray;
        }
        .btn {
            width: 100%;
            padding: 12px;
            background: #4A2C91;
            color: white;
            border: none;
            font-size: 18px;
            margin-top: 15px;
            border-radius: 6px;
            cursor: pointer;
        }
        .btn:hover {
            background: #361f70;
        }
    </style>

    <script>
        function updateTotal() {
            let c = document.getElementById("count").value;
            document.getElementById("price").value = c * 20;
        }
    </script>
</head>

<body>

<div class="container">

    <h2>Book Darshan – <%= rs.getString("temple_name") %></h2>

    <form action="PaymentServlet" method="post">

        <input type="hidden" name="temple_id" value="<%= templeId %>">

        <label>User Name:</label>
        <input type="text" name="username" required>

        <label>Mobile Number:</label>
        <input type="text" name="phone" required maxlength="10">

        <label>Aadhaar Number:</label>
        <input type="text" name="aadhaar" required maxlength="12">

        <label>Select Date:</label>
        <input type="date" name="date" required>

        <label>Time Slot (10 min):</label>
        <select name="time_slot" required>
            <option>06:00 AM</option>
            <option>06:10 AM</option>
            <option>06:20 AM</option>
            <option>06:30 AM</option>
            <option>06:40 AM</option>
            <option>06:50 AM</option>
            <option>07:00 AM</option>
            <option>07:10 AM</option>
            <option>07:20 AM</option>
        </select>

        <label>Number of Tickets:</label>
        <input type="number" name="count" id="count" value="1" min="1" onchange="updateTotal()">

        <label>Total Price (₹20 per ticket):</label>
        <input type="text" id="price" value="20" readonly>

        <button type="submit" class="btn">Continue & Pay</button>

    </form>

</div>

</body>
</html>
