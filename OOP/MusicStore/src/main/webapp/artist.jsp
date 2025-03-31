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
                Artist artistx = (Artist) request.getSession().getAttribute("artist"); // Retrieve artist details using email
                if (artistx == null) {
                    response.sendRedirect("artistlogin.jsp");
                    return; // Ensure no further processing occurs after the redirect
                } // Redirect to login page if artist is not logged in
                String Emailx = artistx.getEmail();
                Artist artist = ArtistServlet.getOne(Emailx);
            %>
            <h1 style="color:black">Profile Information</h1>
            <form action="ArtistServlet" method="post">
                <input type="hidden" name="redirect" value="info.jsp">
                <input type="hidden" name="action" value="deleteandlogout">
                <input type="hidden" name="email" value="<%= artist.getEmail() %>">
                <button type="submit">Delete Profile</button>
            </form>

		<br>
		
			<button type="button" onclick="window.location.href='artistprofile.jsp'">Add Songs</button>
		
		<br>

            <form action="ArtistServlet" method="post">
                <button type="submit">Update Profile</button>
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="email" value="<%= artist.getEmail() %>">
                <input type="hidden" name="redirect" value="artist.jsp">

                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" disabled id="email" name="email" value="<%= artist.getEmail() %>" required>
                </div>

                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="text" id="password" name="password" value="<%= artist.getPassword() %>" required>
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
                    <label for="artistbio">Artist Bio :</label>
                    <input type="text" id="artistbio" name="artistbio" value="<%= artist.getArtistBio() %>" required>
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
