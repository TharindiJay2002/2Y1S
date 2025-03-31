<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Creation Successful</title>
    <style>
    body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            background-image: url('res/a.jpg');
    		background-size: cover; /* or contain */
    		background-position: center; /* centers the image */
    }

    .login-section {
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
    input[type="password"] {
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 4px;
        width: 100%;
        box-sizing: border-box;
    }

/* Button Styles */
button {
    background-color: rgb(103, 30, 104); /* Custom button color */
    margin-left: 20px; /* Spacing between links */
    text-decoration: none; /* Remove underline */
    color: #fff; /* White text for buttons */
    font-size: 16px;
    padding: 8px 13px; /* Padding for spacing */
    border-radius: 6px;
    backdrop-filter: blur(10px); /* Apply the blur effect */
    border: none; /* Remove borders */
    margin: 10px;
}

button:hover {
    background-color: #0056b3; /* Darker blue on hover */
}

    /* Error message styling */
    .error-message {
        color: red;
        font-size: 14px;
    }
</style>
</head>
<body>
    <%@ include file="components/header.jsp" %>
    <div class="login-section">
        <h1>User Creation Successful</h1>
        <p>Your account has been created successfully!</p>
        <form action="userlogin.jsp" method="get">
            <button onclick="location.href(inedx.jsp)">Login Now</button>
        </form>
    </div> 
</body>
    <%@ include file="components/footer.jsp" %>
</html>
 