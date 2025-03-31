<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mstore.dbutill.*, com.mstore.user.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update User - Online Music Store</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h1 {
            text-align: center;
            color: #333;
            font-size: 24px;
            margin-bottom: 30px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
            color: #333;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"],
        button {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #45a049;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group input {
            display: block;
            width: 100%;
        }

        .form-group button {
            width: auto;
            padding: 10px 20px;
        }

        .confirm {
            background-color: #f44336;
        }
    </style>
</head>
<body>
   <%@ include file="components/header.jsp" %>
    <div class="divbox">
        <h1>Update User Details</h1>
        <%
            String UsedId_Update = request.getParameter("email");
        	String redirect = request.getParameter("redirect");
        	redirect += "#user";
            User user = UserServlet.getOne(UsedId_Update);
        %>
        <form action="UserServlet" method="post" onsubmit="return confirm('Do you want to update this user?');">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="redirect" value="<%=redirect %>">
            <input type="hidden" name="email" value="<%= user.getEmail() %>">

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" disabled id="email" name="email" value="<%= user.getEmail() %>" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="text" id="password" name="password" value="<%= user.getPassword() %>" required>
            </div>

            <div class="form-group">
                <label for="fname">First Name</label>
                <input type="text" id="fname" name="fname" value="<%= user.getfName() %>" required>
            </div>

            <div class="form-group">
                <label for="lname">Last Name</label>
                <input type="text" id="lname" name="lname" value="<%= user.getlName() %>" required>
            </div>

            <div class="form-group">
                <label for="address"> Address</label>
                <input type=text id="address" name="address" value="<%= user.getAddress() %>" required>
            </div>

            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="text" id="phone" name="phone" value="<%= user.getPhone() %>" required>
            </div>

            <div class="form-group">
                <label for="role">User Role</label>
                <input type="text" id="role" name="role" value="<%= user.getRole() %>" required>
            </div>

            <div class="form-group">
                <label for="dob">Date of Birth</label>
                <input type="text" id="dob" name="dob" value="<%= user.getDOB() %>" required>
            </div>

            <div class="form-group">
                <button type="submit">Update User</button>
            </div>
        </form>
    </div>
            <br>
        <br>
        <br>
       <%@ include file="components/footer.jsp" %>
       
</body>
</html>
