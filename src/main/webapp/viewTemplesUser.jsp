<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Temple List</title>
    <style>
        body { font-family: Arial; background: #f2f2f2; }
        table {
            width: 80%; margin: 40px auto; border-collapse: collapse;
            background: white; box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }
        th, td {
            padding: 12px; border: 1px solid #ccc; text-align: center;
        }
        th {
            background: #4A2C91; color: white;
        }
        a {
            background: #4A2C91; color: white; padding: 8px 12px;
            border-radius: 6px; text-decoration: none;
        }
        a:hover { background: #331b6b; }
        h2 { text-align: center; }
    </style>
</head>

<body>

<h2>Available Temples</h2>

<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/templedb", "root", "root"
    );
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM temples");
%>

<table>
    <tr>
        <th>ID</th>
        <th>Temple Name</th>
        <th>Location</th>
        <th>Timing</th>
        <th>Action</th>
    </tr>

<%
while (rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("temple_name") %></td>
        <td><%= rs.getString("location") %></td>
        <td><%= rs.getString("timing") %></td>
        <td>
            <a href="book.jsp?id=<%= rs.getInt("id") %>">Book Now</a>
        </td>
    </tr>
<%
}
%>

</table>

</body>
</html>
