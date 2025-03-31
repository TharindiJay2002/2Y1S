<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mstore.dbutill.*, com.mstore.artist.*, com.mstore.song.*,
 java.util.ArrayList, java.util.List" %>
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
    <div class="container">
        <div class="content">
            <%
                Artist artist = (Artist) request.getSession().getAttribute("artist"); // Retrieve artist details using email

                // Assuming SongServlet.getAll() returns a List<Song>
                List<Song> songList = SongServlet.getAll(); // Fetch the list of songs
			%>

                <button type="submit" onclick="window.location.href='artist.jsp'" >Goto Artist Profile</button>

            <h2>Add New Song</h2>
            <form action="SongServlet" method="post">
                <input type="hidden" name="redirect" value="artist.jsp">
                <input type="hidden" name="action" value="create">

                <label for="title">Song Title:</label>
                <input type="text" id="title" name="title" required placeholder="Enter song Title">

                <label for="Artist">Artist:</label>
                <input disabled type="text" id="artist" name="artist" required value=<%= artist.getfName() + " " + artist.getlName() %>>

                <label for="album">Album:</label>
                <input type="text" id="album" name="album" required placeholder="Enter album">
                
                <label for="genre">Genre:</label>
                <input type="text" id="genre" name="genre" required placeholder="Enter genre">
                
                <label for="releasedate">Release Date:</label>
                <input type="Date" id="releasedate" name="releasedate" required placeholder="Enter release date">
                
                <label for="duration">Duration:</label>
                <input type="text" id="duration" name="duration" required placeholder="Enter duration">
                
                <label for="link">Link:</label>
                <input type="text" id="link" name="link" required placeholder="Enter link">
                
                <label for="price">Price:</label>
                <input type="text" id="price" name="price" required placeholder="Enter price">

                <button type="submit">Add Song</button>
            </form>
            <h2>Your Songs</h2>
            <ul>
                <%
                    if (songList != null && !songList.isEmpty()) {
                        for (Song song : songList) {
                %>
                            <li><strong><%= song.getTitle() %></strong> - <%= song.getGenre() %> (Released: <%= song.getReleaseDate() %>)</li>
                <%
	                }
	                } else {
                %>
                    <li>No songs available. Add Songs</li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
    <br>    <br>    <br>    <br>    <br>    <br>    <br>    <br>    <br>    <br>
       <%@ include file="components/footer.jsp" %>
</body>
</html>
