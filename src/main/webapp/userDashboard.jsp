<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // If user not logged in → block access
    if (session.getAttribute("role") == null || !"user".equals(session.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
        return;
    }

    String userName = (String) session.getAttribute("name");
%>

<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f1f1f1;
            margin: 0;
            padding: 0;
        }

        .header {
            background: #4A2C91;
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 26px;
            font-weight: bold;
        }

        .container {
            max-width: 700px;
            margin: 40px auto;
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0px 0px 12px rgba(0,0,0,0.2);
            text-align: center;
        }

        h2 {
            color: #4A2C91;
            font-size: 24px;
            margin-bottom: 10px;
        }

        .menu-btn {
            display: block;
            width: 80%;
            background: #4A2C91;
            color: white;
            padding: 14px;
            margin: 20px auto;
            text-decoration: none;
            font-size: 18px;
            border-radius: 8px;
            transition: 0.3s;
        }

        .menu-btn:hover {
            background: #381f6b;
        }

        .logout {
            background: #d9534f;
        }
        .logout:hover {
            background: #c9302c;
        }
    </style>
</head>

<body>

    <div class="header">
        Temple Darshan Booking — User Dashboard
    </div>

    <div class="container">
        <h2>Welcome, <%= userName %>!</h2>

        <a href="viewTemplesUser.jsp" class="menu-btn">📍 View Temple Details</a>

        <a href="myBookings.jsp" class="menu-btn">🧾 My Bookings</a>

        <a href="logout.jsp" class="menu-btn logout">🚪 Logout</a>
        <a href="book.jsp" class="menu-btn">ticket</a>
    </div>

</body>
</html>
