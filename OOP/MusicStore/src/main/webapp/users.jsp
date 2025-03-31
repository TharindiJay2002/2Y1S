<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mstore.user.*,java.util.List, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User CRUD</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        form {
            margin-bottom: 20px;
        }
        fieldset {
            border: 1px solid #ccc;
            padding: 10px;
        }
    </style>
</head>
<body>
   <%@ include file="components/header.jsp" %>
    <h1>Users CRUD</h1>
    <div>
        <form action="UserServlet" method="post">
            <input type="hidden" name="action" value="create">
            <fieldset>
                <legend>Create User</legend>
                <label>Email</label>
                <input type="email" name="email" required>
                <label>Password</label>
                <input type="password" name="password" required>
                <label>First Name</label>
                <input type="text" name="fName" required>
                <label>Last Name</label>
                <input type="text" name="lName" required>
                <label>Role</label>
                <select name="role" required>
                    <option value="Admin">Admin</option>
                    <option value="User">User</option>
                </select>
                <label>DOB</label>
                <input type="date" name="dob" required>
                <label>Mobile</label>
                <input type="text" name="phone" required>
                <label>Address</label>
                <input type="text" name="address" required>
                <input type="submit" value="Create">
            </fieldset>
        </form>
    </div>

    <h2>Users List</h2>
    <table>
        <thead>
            <tr>
                <th>Email</th>
                <th>Full Name</th>
                <th>Role</th>
                <th>DOB</th>
                <th>Mobile</th>
                <th>Address</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<User> users = UserServlet.getAll();
                for (User user : users) {
            %>
            <tr>
                <td><%= user.getEmail() %></td>
                <td><%= user.getfName() + " " + user.getlName() %></td>
                <td><%= user.getRole() %></td>
                <td><%= user.getDOB() %></td>
                <td><%= user.getPhone() %></td>
                <td><%= user.getAddress() %></td>
                <td>
                    <form action="UserServlet" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="email" value="<%= user.getEmail() %>">
                        <input type="submit" value="Edit">
                    </form>
                    <form action="UserServlet" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="email" value="<%= user.getEmail() %>">
                        <input type="submit" value="Delete" onclick="return confirm('Are you sure you want to delete this user?');">
                    </form>
                </td>
            </tr>
            <%
                }	
            %>
        </tbody>
    </table>
       <%@ include file="components/footer.jsp" %>
</body>
</html>
