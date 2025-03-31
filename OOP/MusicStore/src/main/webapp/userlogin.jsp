<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login</title>

<!-- Add some basic CSS for styling -->
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
	    <h2>User Login</h2>
	    <form action="UserServlet" method="post"  onsubmit="return validateLoginForm()">
	        <input type="hidden" name="action" value="login">
	        <input type="hidden" name="redirect" value="loginerror.jsp">
	        <label for="email">Email:</label>
	        <input type="text" id="email" name="email" required>
	        <label for="password">Password:</label>
	        <input type="password" id="password" name="password" required>
	        <button type="submit">Login</button>
	        <label>Do Not Have An Account? Please <a href="userregister.jsp">Register</a></label> 
	    </form>
	</div>
   <%@ include file="components/footer.jsp" %>

<script>
function validateLoginForm() {
    var email = document.getElementById("email").value;
    var password = document.getElementById("password").value;
    
    // Simple email validation using regex
    var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    
    if (!email.match(emailPattern)) {
        alert("Please enter a valid email address.");
        return false;
    }
    
    // Password length check (you can add more checks)
    if (password.length < 6) {
        alert("Password must be at least 6 characters long.");
        return false;
    }
    
    return true; // Allow form submission if validation passes
}
</script>

</body>
</html>
