<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("username") == null) {
        response.sendRedirect("login.html");
        return;
    }
%>

<h2>Welcome, <%= sessionObj.getAttribute("username") %>!</h2>
<p>Your Mobile: <%= sessionObj.getAttribute("mobile") %></p>

<a href="login.html">Logout</a>
