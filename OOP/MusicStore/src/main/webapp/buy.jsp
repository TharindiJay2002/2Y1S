<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mstore.song.*" %>
<%@ page import="com.mstore.user.*" %>
<%@ page import="com.mstore.order.*, java.text.SimpleDateFormat" %>
<%
    String title = request.getParameter("title");
    String redirect = request.getParameter("redirect");

    // Example: Fetch song details (you would usually retrieve this from your database)
    Song song = SongServlet.getOne(title); // Replace with your method to fetch song data
    User userx = (User) session.getAttribute("user"); // Assuming user is stored in session
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buy <%= song.getTitle() %></title>
    <style>
    body {
        font-family: Arial,sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        background-image: url('res/a.jpg');
        background-size: cover;
        background-position: center;
    }

    .box {
        width: 100%;
        max-width: 400px;
        margin: 50px auto;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
    }

    h2 {
        text-align: center;
        color: #333;
    }

    form {
        display: flex;
        flex-direction: column;
    }

    label {
        margin: 10px 0 5px;
        color: #555;
    }

    input[type="text"],
    input[type="password"],
    input[type="email"] {
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 4px;
        width: 100%;
        box-sizing: border-box;
    }

    button {
        padding: 10px;
        margin-top: 20px;
        background-color: #28a745;
        color: white;
        font-size: 16px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    button:hover {
        background-color: #218838;
    }

    .error-message {
        color: red;
        font-size: 14px;
    }
</style>
</head>
<body>
   <%@ include file="components/header.jsp" %>
<div class="box">
    <h1>Buy <%= song.getTitle() %></h1>

    <p>Price: $<%= song.getPrice() %></p>
    
    <% 
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String date = sdf.format(new java.util.Date());
    if (userx != null) { %>
        <form action="OrderServlet" method="post">
            <input type="hidden" name="song" value="<%= song.getTitle() %>">
            <input type="hidden" name="user" value="<%= userx.getEmail() %>">
            <input type="hidden" name="price" value="<%= song.getPrice() %>">
            <input type="hidden" name="redirect" value="checkout.jsp">
            <input type="hidden" name="action" value="create">
            <input type="hidden" name="date" value="<%= date %>">
            <button type="submit">Add Order</button>
        </form>
    <% } else { %>
        <p>You need to <a href="userlogin.jsp">log in</a> to purchase this song.</p>
    <% } %>
</div>
   <%@ include file="components/footer.jsp" %>
</body>
</html>
