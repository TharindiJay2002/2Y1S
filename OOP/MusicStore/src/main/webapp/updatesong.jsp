<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mstore.dbutill.*, com.mstore.song.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Song - Online Music Store</title>
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
        input[type="number"],
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
        <h1>Update Song Details</h1>
        <%
            String SongId_Update = request.getParameter("title");
            String redirect = request.getParameter("redirect");
            redirect += "#songs";
            Song song = SongServlet.getOne(SongId_Update);
        %>
        <form action="SongServlet" method="post" onsubmit="return confirm('Do you want to update this song?');">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="redirect" value="<%=redirect %>">
            <input type="hidden" name="title" value="<%= song.getTitle() %>">

            <div class="form-group">
                <label for="titleshow">Song Title</label>
                <input type="text" disabled id="titleshow" name="titleshow" value="<%= song.getTitle() %>" required>
            </div>

            <div class="form-group">
                <label for="artist">Artist</label>
                <input type="text" id="artist" name="artist" value="<%= song.getArtist() %>" required>
            </div>
            
			<div class="form-group">
				<label for="album">Genre</label> 
				<input type="text" id="album" name="album" value="<%=song.getAlbum()%>" required>
			</div>
			
			<div class="form-group">
				<label for="genre">Genre</label> 
				<input type="text" id="genre" name="genre" value="<%= song.getGenre() %>" required>
			</div>

			<div class="form-group">
				<label for="releasedate">Release Date</label> 
				<input type="date" id="releasedate" name="releasedate" value="<%= song.getDuration() %>" required>
			</div>

			<div class="form-group">
				<label for="duration">Duration </label> 
				<input type="text" id="duration" name="duration" value="<%= song.getDuration() %>" required>
			</div>
			
			<div class="form-group">
				<label for="link">Link </label> 
				<input type="text" id="link" name="link" value="<%= song.getLink() %>" required>
			</div>
			
			<div class="form-group">
				<label for="price">Price </label> 
				<input type="text" id="price" name="price" value="<%= song.getPrice() %>" required>
			</div>
			
			<div class="form-group">
				<button type="submit">Update Song</button>
			</div>
		</form>    
		</div>
		
		    				<br><br><br><br>				<br><br><br><br>
		
       <%@ include file="components/footer.jsp" %>
</body>
</html>
