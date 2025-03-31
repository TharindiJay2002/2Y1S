<!-- Header Section -->
<%@ page import="java.util.*, com.mstore.user.*, com.mstore.artist.*" %>
    <link rel="stylesheet" href="css/styles.css">
<div class="header">
    <div class="navbar">
        <div class="navbar-brand">
        	<img src="res/logo.png" width="64" height="64">
        	<h1>BeatBox</h1>        
       	</div>
        <div class="navbar-links">
        	<button class="nav" onclick="location.href='index.jsp'">Home</button>
            <%
            if (request.getSession().getAttribute("artist") == null) {
            %>
                <button class="nav" onclick="location.href='artistlogin.jsp'">Artist Login</button>
                <button class="nav" onclick="location.href='artistregister.jsp'">Artist Registration</button>
            <%
            } else {
            %>
                <button class="nav" onclick="location.href='artistprofile.jsp'">Artist Profile</button>
            <%
            }
            %>

            <%
            if (request.getSession().getAttribute("user") == null) {
            %>
                <button class="nav" onclick="location.href='userlogin.jsp'">User Login</button>
                <button class="nav" onclick="location.href='userregister.jsp'">User Registration</button>
            <%
            } else {
                User user = (User) (request.getSession().getAttribute("user"));
            %>
                <button class="nav" onclick="location.href='user.jsp'"><%= user.getfName() %></button>
            <%
            }
            %>

            <%
            if ("True".equals(request.getSession().getAttribute("Admin"))) {
            %>
                <button class="nav" onclick="location.href='admin.jsp'">Admin Panel</button>
            <%
            }
            %>

            <%
            if (request.getSession().getAttribute("artist") != null || request.getSession().getAttribute("user") != null) {
            %>
                <button class="nav" onclick="location.href='logoutservlet'" onclick="return confirm('Are you sure you want to log out?')">LogOut</button>
            <%
            }
            %>
        </div>
    </div>
</div>
