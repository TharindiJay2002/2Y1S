<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mstore.dbutill.*, com.mstore.user.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile - Online Music Store</title>
    <style>
        /* Add your existing styles here */
        /* Popup Styles */
        .popup {
            display: none;
            position: fixed;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            background: white;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
            border-radius: 8px;
            z-index: 1000;
        }
        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }
    </style>
</head>
<body>
   <%@ include file="components/header.jsp" %>

   <div class="divbox">
        <%
            User user = (User) request.getSession().getAttribute("user"); // Get user details from session
            if (user == null) {
                out.println("<p>User not found. Please log in.</p>");
                return; // Stop further processing if user is null
            }
        %>
        <h1 style="color:black">Profile Information</h1>
        <form action="UserServlet" method="post">
            <input type="hidden" name="redirect" value="info.jsp">
            <input type="hidden" name="action" value="deleteandlogout">
            <input type="hidden" name="email" value="<%= user.getEmail() %>">
            <button type="submit">Delete Profile</button>
        </form>

        <form action="UserServlet" method="post">
            <button type="submit">Update Profile</button>
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="redirect" value="user.jsp">
            <input type="hidden" name="email" value="<%= user.getEmail() %>">

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" disabled id="email" name="email" value="<%= user.getEmail() %>" required>
            </div>

            <div class="form-group">
                <label for="password">Password:</label>
                <input type="text" id="password" name="password" value="<%= user.getPassword() %>" required>
            </div>

            <div class="form-group">
                <label for="fname">First Name:</label>
                <input type="text" id="fname" name="fname" value="<%= user.getfName() %>" required>
            </div>

            <div class="form-group">
                <label for="lname">Last Name:</label>
                <input type="text" id="lname" name="lname" value="<%= user.getlName() %>" required>
            </div>

            <div class="form-group">
                <label for="userBio">Address:</label>
                <textarea id="userBio" name="address" required><%= user.getAddress() %></textarea>
            </div>

            <div class="form-group">
                <label for="phone">Phone:</label>
                <input type="text" id="phone" name="phone" value="<%= user.getPhone() %>" required>
            </div>
            
            <div class="form-group">
                <label for="role">Role:</label>
                <input type="text" id="role" name="role" value="<%= user.getRole() %>" required>
            </div>
            
            <div class="form-group">
                <label for="dob">Date of Birth:</label>
                <input type="date" id="dob" name="dob" value="<%= user.getDOB() %>" required>
            </div>
        </form>
    </div>

    <!-- Popup Notification -->
    <div class="overlay" id="overlay"></div>
    <div class="popup" id="popup">
        <p>Profile updated successfully!</p>
        <button onclick="closePopup()">Close</button>
    </div>

    <% 
        // Check if update was successful
        if (request.getSession().getAttribute("updateSuccess") != null) {
            request.getSession().removeAttribute("updateSuccess"); // Clear attribute after use
    %>
        <script>
            document.getElementById('overlay').style.display = 'block';
            document.getElementById('popup').style.display = 'block';
        </script>
    <%
        }
    %>

    <script>
        function closePopup() {
            document.getElementById('overlay').style.display = 'none';
            document.getElementById('popup').style.display = 'none';
        }
    </script>

   <%@ include file="components/footer.jsp" %>
</body>
</html>
