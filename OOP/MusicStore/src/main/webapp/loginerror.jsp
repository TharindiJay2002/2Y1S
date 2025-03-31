<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    
    <title>Login Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            height: 100vh;
            margin: 0;
        }
        .error-container {
            background: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .error-message {
            color: #e74c3c;
            font-size: 1.5em;
            margin-bottom: 15px;
        }
        .suggestion {
            font-size: 1em;
            color: #666;
        }
        a {
            text-decoration: none;
            color: #3498db;
        }
    </style>
</head>
<body>
   	<%@ include file="components/header.jsp" %>
    <div class="error-container">
        <div class="error-message">Login Error!</div>
        <div class="suggestion">Please check your username and password, or <a href="userlogin.jsp">try again</a>.</div>
    </div>
</body>
   <%@ include file="components/footer.jsp" %>
</html>
