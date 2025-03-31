<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mstore.dbutill.*, com.mstore.artist.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Artist Profile - Online Music Store</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            background-image: url('res/a.jpg');
            background-size: cover;
            background-position: center;
        }
        .header {
            background-color: #333;
            color: white;
            padding: 20px;
            text-align: center;
            background: rgba(0, 0, 0, 0.7);
            border-radius: 10px;
            backdrop-filter: blur(10px);
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background: rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            backdrop-filter: blur(10px);
        }
        .content {
            background-color: white;
            padding: 20px;
            background: rgba(255, 255, 255, 0.5);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.7);
            border-radius: 8px;
            backdrop-filter: blur(10px);
        }
        h1 {
            color: #FFF;
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
        input[type="email"],
        textarea,
        button {
            width: 96%;
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
        textarea {
            resize: vertical;
        }
        .form-group {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
   <%@ include file="components/header.jsp" %>
    <div class="header">
        <h1>Artist Profile</h1>
    </div>
    <div class="container">
        <div class="content">
            <%
                String artistEmail = request.getParameter("email");
                Artist artist = (Artist) request.getSession().getAttribute("artist") ;//ArtistServlet.getOne(artistEmail);  // Retrieve artist details using email
            %>
            <h1>Profile Information</h1>
            <form action="ArtistServlet" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="email" value="<%= artist.getEmail() %>">

                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" disabled id="email" name="email" value="<%= artist.getEmail() %>" required>
                </div>

                <div class="form-group">
                    <label for="fname">First Name:</label>
                    <input type="text" id="fname" name="fname" value="<%= artist.getfName() %>" required>
                </div>

                <div class="form-group">
                    <label for="lname">Last Name:</label>
                    <input type="text" id="lname" name="lname" value="<%= artist.getlName() %>" required>
                </div>

                <div class="form-group">
                    <label for="artistBio">Artist Bio:</label>
                    <textarea id="artistBio" name="artistBio" required><%= artist.getArtistBio() %></textarea>
                </div>

                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="text" id="password" name="password" value="<%= artist.getPassword() %>" required>
                </div>

                <button type="submit">Update Profile</button>
            </form>
        </div>
    </div>
       <%@ include file="components/footer.jsp" %>
</body>
</html>