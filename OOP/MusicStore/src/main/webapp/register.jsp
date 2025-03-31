<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 50px;
        }
        form {
            max-width: 400px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        label {
            display: block;
            margin-bottom: 8px;
        }
        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="date"],
        input[type="tel"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
   <%@ include file="components/header.jsp" %>
    <h1>Register</h1>
    <form action="UserServlet" method="post">
        <input type="hidden" name="action" value="register">
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        
        <label for="fName">First Name:</label>
        <input type="text" id="fName" name="fName" required>
        
        <label for="lName">Last Name:</label>
        <input type="text" id="lName" name="lName" required>
        
        <label for="role">Role:</label>
        <select id="role" name="role" required>
            <option value="Admin">Admin</option>
            <option value="User">User</option>
        </select>
        
        <label for="dob">Date of Birth:</label>
        <input type="date" id="dob" name="dob" required>
        
        <label for="phone">Mobile:</label>
        <input type="tel" id="phone" name="phone" required>
        
        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required>
        
        <input type="submit" value="Register">
    </form>

    <p><a href="login.jsp">Already have an account? Login here</a></p>
</body>
</html>
