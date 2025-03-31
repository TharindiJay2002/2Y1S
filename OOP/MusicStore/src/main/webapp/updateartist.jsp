<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mstore.dbutill.*, com.mstore.artist.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Artist - Online Music Store</title>
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
        textarea,
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

        .form-group input,
        .form-group textarea {
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
        <h1>Update Artist Details</h1>
        <%
            String ArtistId_Update = request.getParameter("email");
            String redirect = request.getParameter("redirect");
            redirect += "#artist";
            Artist artist = ArtistServlet.getOne(ArtistId_Update);
        %>
        <form action="ArtistServlet" method="post" onsubmit="return confirm('Do you want to update this artist?');">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="redirect" value="<%=redirect %>">
            <input type="hidden" name="email" value="<%= artist.getEmail() %>">

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" disabled id="email" name="email" value="<%= artist.getEmail() %>" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="text" id="password" name="password" value="<%= artist.getPassword() %>" required>
            </div>

            <div class="form-group">
                <label for="fname">First Name</label>
                <input type="text" id="fname" name="fname" value="<%= artist.getfName() %>" required>
            </div>

            <div class="form-group">
                <label for="lname">Last Name</label>
                <input type="text" id="lname" name="lname" value="<%= artist.getlName() %>" required>
            </div>

            <div class="form-group">
                <label for="artistbio">Artist Bio</label>
                <textarea id="artistbio" name="artistbio" rows="4" required><%= artist.getArtistBio() %></textarea>
            </div>

            <div class="form-group">
                <button type="submit">Update Artist</button>
            </div>
        </form>
    </div>
       <%@ include file="components/footer.jsp" %>
</body>
</html>
